const express = require('express');
const User = require('../models/User');
const Verification = require('../models/Verification');
const { auth, adminAuth } = require('../middleware/auth');
const mongoose = require('mongoose');

const router = express.Router();

// @route   GET /api/users/profile
// @desc    Get current user profile
// @access  Private
router.get('/profile', auth, async (req, res) => {
  try {
    const user = await User.findById(req.user.id).select('-password');
    if (!user) {
      return res.status(404).json({ message: 'User not found' });
    }

    res.json(user);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Server error' });
  }
});

// @route   PUT /api/users/profile
// @desc    Update user profile
// @access  Private
router.put('/profile', auth, async (req, res) => {
  try {
    const { firstName, lastName, phoneNumber, dateOfBirth, address } = req.body;

    const user = await User.findById(req.user.id);
    if (!user) {
      return res.status(404).json({ message: 'User not found' });
    }

    // Update fields
    if (firstName) user.firstName = firstName;
    if (lastName) user.lastName = lastName;
    if (phoneNumber) user.phoneNumber = phoneNumber;
    if (dateOfBirth) user.profile.dateOfBirth = dateOfBirth;
    if (address) user.profile.address = address;

    await user.save();

    res.json({
      message: 'Profile updated successfully',
      user: {
        id: user._id,
        firstName: user.firstName,
        lastName: user.lastName,
        email: user.email,
        phoneNumber: user.phoneNumber,
        isVerified: user.isVerified,
        verificationStatus: user.verificationStatus,
        role: user.role,
        profile: user.profile
      }
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Server error' });
  }
});

// @route   GET /api/users/dashboard
// @desc    Get user dashboard data
// @access  Private
router.get('/dashboard', auth, async (req, res) => {
  try {
    const user = await User.findById(req.user.id).select('-password');
    if (!user) {
      return res.status(404).json({ message: 'User not found' });
    }

    // Get user's verification history
    const verifications = await Verification.find({ userId: req.user.id })
      .sort({ createdAt: -1 })
      .limit(5)
      .select('-documents -apiResponse.rawResponse');

    // Get latest verification
    const latestVerification = verifications[0] || null;

    // Dashboard statistics
    const dashboardData = {
      user: {
        id: user._id,
        firstName: user.firstName,
        lastName: user.lastName,
        email: user.email,
        phoneNumber: user.phoneNumber,
        isVerified: user.isVerified,
        verificationStatus: user.verificationStatus,
        role: user.role,
        profile: user.profile,
        createdAt: user.createdAt
      },
      verification: {
        status: user.verificationStatus,
        isVerified: user.isVerified,
        latestVerification,
        totalAttempts: verifications.length,
        recentVerifications: verifications
      },
      stats: {
        accountAge: Math.floor((new Date() - user.createdAt) / (1000 * 60 * 60 * 24)), // days
        totalVerifications: verifications.length,
        lastLoginDate: new Date().toISOString()
      }
    };

    res.json(dashboardData);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Server error' });
  }
});

// @route   GET /api/users/admin/all
// @desc    Get all users (Admin only)
// @access  Private (Admin)
router.get('/admin/all', adminAuth, async (req, res) => {
  try {
    const page = parseInt(req.query.page) || 1;
    const limit = parseInt(req.query.limit) || 10;
    const skip = (page - 1) * limit;

    const users = await User.find()
      .select('-password')
      .sort({ createdAt: -1 })
      .skip(skip)
      .limit(limit);

    const totalUsers = await User.countDocuments();

    res.json({
      users,
      pagination: {
        currentPage: page,
        totalPages: Math.ceil(totalUsers / limit),
        totalUsers,
        hasNext: page < Math.ceil(totalUsers / limit),
        hasPrev: page > 1
      }
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Server error' });
  }
});

// @route   GET /api/users/admin/stats
// @desc    Get user statistics (Admin only)
// @access  Private (Admin)
router.get('/admin/stats', adminAuth, async (req, res) => {
  try {
    const totalUsers = await User.countDocuments();
    const verifiedUsers = await User.countDocuments({ isVerified: true });
    const pendingUsers = await User.countDocuments({ verificationStatus: 'pending' });
    const approvedUsers = await User.countDocuments({ verificationStatus: 'approved' });
    const deniedUsers = await User.countDocuments({ verificationStatus: 'denied' });
    const reviewUsers = await User.countDocuments({ verificationStatus: 'review' });

    // Get registration trend (last 30 days)
    const thirtyDaysAgo = new Date();
    thirtyDaysAgo.setDate(thirtyDaysAgo.getDate() - 30);
    
    const recentUsers = await User.countDocuments({
      createdAt: { $gte: thirtyDaysAgo }
    });

    res.json({
      totalUsers,
      verifiedUsers,
      verificationRate: totalUsers > 0 ? (verifiedUsers / totalUsers * 100).toFixed(2) : 0,
      statusBreakdown: {
        pending: pendingUsers,
        approved: approvedUsers,
        denied: deniedUsers,
        review: reviewUsers
      },
      recentRegistrations: recentUsers
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Server error' });
  }
});

// @route   GET /api/users/admin/:id
// @desc    Get specific user details (Admin only)
// @access  Private (Admin)
router.get('/admin/:id', adminAuth, async (req, res) => {
  try {
    const { id } = req.params;
    
    // Validate ObjectId format
    if (!mongoose.Types.ObjectId.isValid(id)) {
      return res.status(400).json({ message: 'Invalid user ID format' });
    }

    const user = await User.findById(id).select('-password');
    if (!user) {
      return res.status(404).json({ message: 'User not found' });
    }

    // Get user's verification history
    const verifications = await Verification.find({ userId: id })
      .sort({ createdAt: -1 })
      .select('-documents -apiResponse.rawResponse');

    res.json({
      user,
      verifications
    });
  } catch (error) {
    console.error('Get user details error:', error);
    res.status(500).json({ message: 'Server error' });
  }
});

// @route   PUT /api/users/admin/:id/status
// @desc    Update user status (Admin only)
// @access  Private (Admin)
router.put('/admin/:id/status', adminAuth, async (req, res) => {
  try {
    const { verificationStatus, isVerified, role } = req.body;
    const { id } = req.params;

    // Validate ObjectId format
    if (!mongoose.Types.ObjectId.isValid(id)) {
      return res.status(400).json({ message: 'Invalid user ID format' });
    }

    const user = await User.findById(id);
    if (!user) {
      return res.status(404).json({ message: 'User not found' });
    }

    // Update user status
    if (verificationStatus) {
      const validStatuses = ['pending', 'approved', 'denied', 'review'];
      if (!validStatuses.includes(verificationStatus)) {
        return res.status(400).json({ message: 'Invalid verification status' });
      }
      user.verificationStatus = verificationStatus;
    }

    if (typeof isVerified === 'boolean') {
      user.isVerified = isVerified;
    }

    if (role) {
      const validRoles = ['user', 'admin'];
      if (!validRoles.includes(role)) {
        return res.status(400).json({ message: 'Invalid role' });
      }
      user.role = role;
    }

    await user.save();

    res.json({
      message: 'User status updated successfully',
      user: {
        id: user._id,
        firstName: user.firstName,
        lastName: user.lastName,
        email: user.email,
        verificationStatus: user.verificationStatus,
        isVerified: user.isVerified,
        role: user.role
      }
    });
  } catch (error) {
    console.error('Update user status error:', error);
    res.status(500).json({ message: 'Server error' });
  }
});

// @route   DELETE /api/users/admin/:id
// @desc    Delete user (Admin only)
// @access  Private (Admin)
router.delete('/admin/:id', adminAuth, async (req, res) => {
  try {
    const { id } = req.params;

    // Validate ObjectId format
    if (!mongoose.Types.ObjectId.isValid(id)) {
      return res.status(400).json({ message: 'Invalid user ID format' });
    }

    const user = await User.findById(id);
    if (!user) {
      return res.status(404).json({ message: 'User not found' });
    }

    // Delete user's verifications first
    await Verification.deleteMany({ userId: id });

    // Delete the user
    await User.findByIdAndDelete(id);

    res.json({
      message: 'User and associated data deleted successfully'
    });
  } catch (error) {
    console.error('Delete user error:', error);
    res.status(500).json({ message: 'Server error' });
  }
});

module.exports = router; 