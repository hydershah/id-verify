const mongoose = require('mongoose');

const verificationSchema = new mongoose.Schema({
  userId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  },
  transactionId: {
    type: String,
    unique: true,
    sparse: true
  },
  customerReference: {
    type: String,
    required: true
  },
  documentType: {
    type: String,
    enum: ['DriversLicense', 'Passport', 'NationalID', 'StateID'],
    required: true
  },
  status: {
    type: String,
    enum: ['pending', 'approved', 'denied', 'review', 'failed'],
    default: 'pending'
  },
  confidence: {
    type: Number,
    min: 0,
    max: 100
  },
  documents: {
    frontImage: {
      originalName: String,
      fileName: String,
      path: String,
      mimetype: String,
      size: Number
    },
    backImage: {
      originalName: String,
      fileName: String,
      path: String,
      mimetype: String,
      size: Number
    },
    portraitImage: {
      originalName: String,
      fileName: String,
      path: String,
      mimetype: String,
      size: Number
    }
  },
  extractedData: {
    firstName: String,
    lastName: String,
    dateOfBirth: Date,
    documentNumber: String,
    expirationDate: Date,
    address: String,
    state: String,
    country: String
  },
  biometric: {
    faceMatch: Boolean,
    confidence: Number,
    livenessScore: Number
  },
  apiResponse: {
    success: Boolean,
    rawResponse: mongoose.Schema.Types.Mixed,
    errors: [String],
    warnings: [String]
  },
  reviewNotes: String,
  reviewedBy: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User'
  },
  reviewedAt: Date,
  createdAt: {
    type: Date,
    default: Date.now
  },
  updatedAt: {
    type: Date,
    default: Date.now
  }
});

// Update timestamp on save
verificationSchema.pre('save', function(next) {
  this.updatedAt = Date.now();
  next();
});

// Index for efficient queries
verificationSchema.index({ userId: 1, createdAt: -1 });
verificationSchema.index({ transactionId: 1 }, { sparse: true }); // Allow multiple null values
verificationSchema.index({ status: 1 });

module.exports = mongoose.model('Verification', verificationSchema); 