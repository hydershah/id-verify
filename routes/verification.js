const express = require('express');
const path = require('path');
const mongoose = require('mongoose');
const User = require('../models/User');
const Verification = require('../models/Verification');
const { auth, adminAuth } = require('../middleware/auth');
const { upload } = require('../services/fileUpload');
const evsService = require('../services/evsService');

const router = express.Router();

// Helper function to validate status values
const validateStatus = (status) => {
  const validStatuses = ['pending', 'approved', 'denied', 'review', 'failed'];
  return validStatuses.includes(status) ? status : 'pending';
};

// @route   POST /api/verification/upload
// @desc    Upload documents for verification
// @access  Private
router.post('/upload', auth, upload.fields([
  { name: 'frontImage', maxCount: 1 },
  { name: 'backImage', maxCount: 1 },
  { name: 'portraitImage', maxCount: 1 }
]), async (req, res) => {
  try {
    const { documentType } = req.body;
    const userId = req.user.id;

    // Validation
    if (!documentType) {
      return res.status(400).json({ message: 'Document type is required' });
    }

    const validDocumentTypes = ['DriversLicense', 'Passport', 'NationalID', 'StateID'];
    if (!validDocumentTypes.includes(documentType)) {
      return res.status(400).json({ message: 'Invalid document type' });
    }

    // Check if files were uploaded
    if (!req.files || Object.keys(req.files).length === 0) {
      return res.status(400).json({ message: 'Please upload at least one document image' });
    }

    // Validate required files based on document type
    if (!req.files.frontImage) {
      return res.status(400).json({ message: 'Front image of document is required' });
    }

    if (documentType === 'DriversLicense' && !req.files.backImage) {
      return res.status(400).json({ message: 'Back image is required for driver\'s license verification' });
    }

    if (!req.files.portraitImage) {
      return res.status(400).json({ message: 'Portrait/selfie image is required for identity verification' });
    }

    // Prepare file information with validation
    const documents = {};
    try {
      if (req.files.frontImage) {
        const file = req.files.frontImage[0];
        if (!file.mimetype.startsWith('image/')) {
          return res.status(400).json({ message: 'Front image must be a valid image file' });
        }
        documents.frontImage = {
          originalName: file.originalname,
          fileName: file.filename,
          path: file.path,
          mimetype: file.mimetype,
          size: file.size
        };
      }

      if (req.files.backImage) {
        const file = req.files.backImage[0];
        if (!file.mimetype.startsWith('image/')) {
          return res.status(400).json({ message: 'Back image must be a valid image file' });
        }
        documents.backImage = {
          originalName: file.originalname,
          fileName: file.filename,
          path: file.path,
          mimetype: file.mimetype,
          size: file.size
        };
      }

      if (req.files.portraitImage) {
        const file = req.files.portraitImage[0];
        if (!file.mimetype.startsWith('image/')) {
          return res.status(400).json({ message: 'Portrait image must be a valid image file' });
        }
        documents.portraitImage = {
          originalName: file.originalname,
          fileName: file.filename,
          path: file.path,
          mimetype: file.mimetype,
          size: file.size
        };
      }
    } catch (fileError) {
      console.error('File processing error:', fileError);
      return res.status(400).json({ message: 'Error processing uploaded files' });
    }

    // Create verification record
    const verification = new Verification({
      userId,
      customerReference: `NOTARY_${Date.now()}_${userId}`,
      documentType,
      documents,
      status: 'pending'
    });

    await verification.save();

    // Process verification with EVS Service
    try {
      // Read files as buffers for EVS service
      const fs = require('fs');
      
      const frontImageBuffer = fs.readFileSync(documents.frontImage.path);
      const backImageBuffer = documents.backImage ? fs.readFileSync(documents.backImage.path) : null;
      const selfieImageBuffer = fs.readFileSync(documents.portraitImage.path);

      // Prepare EVS request
      const evsRequest = {
        documentType: documentType,
        frontImage: frontImageBuffer,
        backImage: backImageBuffer,
        selfieImage: selfieImageBuffer,
        userId: userId
      };

      console.log('Processing verification with EVS Service:', {
        userId,
        documentType,
        hasFiles: {
          frontImage: !!frontImageBuffer,
          backImage: !!backImageBuffer,
          portraitImage: !!selfieImageBuffer
        }
      });

      const evsResult = await evsService.verifyDocument(evsRequest);

      console.log('EVS result received:', {
        success: evsResult.success,
        status: evsResult.status,
        confidence: evsResult.confidence,
        hasErrors: !!evsResult.errors?.length
      });

      // Validate and ensure status is a valid enum value
      const mappedStatus = validateStatus(evsResult.status);

      // Update verification with EVS results
      verification.transactionId = evsResult.transactionId;
      verification.status = mappedStatus;
      verification.confidence = evsResult.confidence;
      verification.apiResponse = {
        success: evsResult.success,
        rawResponse: evsResult,
        errors: evsResult.errors || [],
        warnings: evsResult.warnings || []
      };

      if (evsResult.document) {
        verification.extractedData = {
          firstName: evsResult.document.extractedData.firstName,
          lastName: evsResult.document.extractedData.lastName,
          dateOfBirth: evsResult.document.extractedData.dateOfBirth,
          documentNumber: evsResult.document.extractedData.documentNumber,
          expirationDate: evsResult.document.extractedData.expirationDate,
          address: evsResult.document.extractedData.address
        };
      }

      if (evsResult.biometric) {
        verification.biometric = {
          faceMatch: evsResult.biometric.faceMatch,
          confidence: evsResult.biometric.confidence,
          livenessScore: evsResult.biometric.livenessScore
        };
      }

      await verification.save();

      // Update user verification status
      const user = await User.findById(userId);
      if (user) {
        user.verificationStatus = mappedStatus;
        user.isVerified = mappedStatus === 'approved';
        await user.save();
      }

      res.json({
        message: 'Documents uploaded and processed successfully',
        verification: {
          id: verification._id,
          status: verification.status,
          confidence: verification.confidence,
          transactionId: verification.transactionId,
          extractedData: verification.extractedData,
          biometric: verification.biometric,
          createdAt: verification.createdAt
        }
      });

    } catch (evsError) {
      console.error('EVS processing error:', {
        message: evsError.message,
        stack: evsError.stack,
        verificationId: verification._id
      });
      
      // Determine specific error message based on error type
      let errorMessage = 'Documents uploaded but verification processing failed';
      
      if (evsError.message.includes('Image quality')) {
        errorMessage = 'Error processing image files. Please ensure images are valid and try again.';
      } else if (evsError.message.includes('File not found')) {
        errorMessage = 'Uploaded files could not be accessed. Please try uploading again.';
      } else if (evsError.message.includes('authentication') || evsError.message.includes('2005')) {
        errorMessage = 'Verification service authentication failed. Please contact support.';
      } else if (evsError.message.includes('timeout')) {
        errorMessage = 'Verification processing timed out. Please try again with smaller image files.';
      }
      
      // Update verification with error status
      verification.status = validateStatus('failed');
      verification.apiResponse = {
        success: false,
        errors: [errorMessage],
        rawResponse: null
      };
      
      try {
        await verification.save();
        
        // Also update user status if needed
        const user = await User.findById(userId);
        if (user) {
          user.verificationStatus = validateStatus('failed');
          user.isVerified = false;
          await user.save();
        }
      } catch (saveError) {
        console.error('Error saving verification failure status:', saveError);
      }

      res.status(500).json({
        message: errorMessage,
        verification: {
          id: verification._id,
          status: verification.status,
          createdAt: verification.createdAt
        },
        supportMessage: 'If this problem persists, please contact support with the verification ID above.'
      });
    }

  } catch (error) {
    console.error('Upload error:', error);
    res.status(500).json({ message: 'Server error during upload' });
  }
});

// @route   GET /api/verification/status
// @desc    Get user's verification status
// @access  Private
router.get('/status', auth, async (req, res) => {
  try {
    const verifications = await Verification.find({ userId: req.user.id })
      .sort({ createdAt: -1 })
      .select('-documents -apiResponse.rawResponse');

    res.json({
      verifications,
      currentStatus: req.user.verificationStatus,
      isVerified: req.user.isVerified
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Server error' });
  }
});

// @route   GET /api/verification/:id
// @desc    Get specific verification details
// @access  Private
router.get('/:id', auth, async (req, res) => {
  try {
    const { id } = req.params;

    // Validate ObjectId format
    if (!mongoose.Types.ObjectId.isValid(id)) {
      return res.status(400).json({ message: 'Invalid verification ID format' });
    }

    const verification = await Verification.findOne({
      _id: id,
      userId: req.user.id
    }).select('-apiResponse.rawResponse');

    if (!verification) {
      return res.status(404).json({ message: 'Verification not found' });
    }

    res.json(verification);
  } catch (error) {
    console.error('Get verification details error:', error);
    res.status(500).json({ message: 'Server error' });
  }
});

// @route   GET /api/verification/admin/pending
// @desc    Get all pending verifications (Admin only)
// @access  Private (Admin)
router.get('/admin/pending', adminAuth, async (req, res) => {
  try {
    const verifications = await Verification.find({ status: 'review' })
      .populate('userId', 'firstName lastName email')
      .sort({ createdAt: -1 });

    res.json(verifications);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Server error' });
  }
});

// @route   PUT /api/verification/admin/:id/review
// @desc    Review and update verification status (Admin only)
// @access  Private (Admin)
router.put('/admin/:id/review', adminAuth, async (req, res) => {
  try {
    const { status, reviewNotes } = req.body;
    const { id } = req.params;

    // Validate ObjectId format
    if (!mongoose.Types.ObjectId.isValid(id)) {
      return res.status(400).json({ message: 'Invalid verification ID format' });
    }

    // Validate status using helper function
    const validatedStatus = validateStatus(status);
    if (validatedStatus === 'pending' && status !== 'pending') {
      return res.status(400).json({ message: 'Invalid status value provided' });
    }

    const verification = await Verification.findById(id);
    if (!verification) {
      return res.status(404).json({ message: 'Verification not found' });
    }

    // Update verification
    verification.status = validatedStatus;
    verification.reviewNotes = reviewNotes;
    verification.reviewedBy = req.user.id;
    verification.reviewedAt = new Date();
    await verification.save();

    // Update user status
    const user = await User.findById(verification.userId);
    if (user) {
      user.verificationStatus = validatedStatus;
      user.isVerified = validatedStatus === 'approved';
      await user.save();
    }

    res.json({
      message: 'Verification reviewed successfully',
      verification: {
        id: verification._id,
        status: verification.status,
        reviewNotes: verification.reviewNotes,
        reviewedAt: verification.reviewedAt
      }
    });
  } catch (error) {
    console.error('Admin review error:', error);
    res.status(500).json({ message: 'Server error' });
  }
});

// @route   GET /api/verification/admin/stats
// @desc    Get verification statistics (Admin only)
// @access  Private (Admin)
router.get('/admin/stats', adminAuth, async (req, res) => {
  try {
    const stats = await Verification.aggregate([
      {
        $group: {
          _id: '$status',
          count: { $sum: 1 }
        }
      }
    ]);

    const totalUsers = await User.countDocuments();
    const verifiedUsers = await User.countDocuments({ isVerified: true });

    res.json({
      verificationStats: stats,
      totalUsers,
      verifiedUsers,
      verificationRate: totalUsers > 0 ? (verifiedUsers / totalUsers * 100).toFixed(2) : 0
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Server error' });
  }
});

module.exports = router; 