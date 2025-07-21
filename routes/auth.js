const express = require('express');
const jwt = require('jsonwebtoken');
const validator = require('validator');
const User = require('../models/User');
const { auth } = require('../middleware/auth');

const router = express.Router();

// Simple in-memory rate limiting for login attempts
const loginAttempts = new Map();
const MAX_LOGIN_ATTEMPTS = 5;
const LOCKOUT_TIME = 15 * 60 * 1000; // 15 minutes

// Clean up old entries every hour to prevent memory leaks
setInterval(() => {
  const now = Date.now();
  for (const [key, value] of loginAttempts.entries()) {
    if (value.lockedUntil && now > value.lockedUntil) {
      loginAttempts.delete(key);
    }
  }
}, 60 * 60 * 1000); // 1 hour

// Generate JWT token
const generateToken = (userId) => {
  return jwt.sign({ userId }, process.env.JWT_SECRET, {
    expiresIn: process.env.JWT_EXPIRE || '7d'
  });
};

// @route   POST /api/auth/register
// @desc    Register a new user
// @access  Public
router.post('/register', async (req, res) => {
  try {
    console.log('📝 Registration request received:', {
      body: req.body,
      headers: req.headers['content-type']
    });

    const { firstName, lastName, email, password, phoneNumber } = req.body;

    // Enhanced validation with specific field checks
    const missingFields = [];
    if (!firstName || firstName.trim() === '') missingFields.push('firstName');
    if (!lastName || lastName.trim() === '') missingFields.push('lastName');
    if (!email || email.trim() === '') missingFields.push('email');
    if (!password || password.trim() === '') missingFields.push('password');

    if (missingFields.length > 0) {
      console.log('❌ Missing required fields:', missingFields);
      return res.status(400).json({ 
        message: `Missing required fields: ${missingFields.join(', ')}`,
        errorType: 'MISSING_REQUIRED_FIELDS',
        fields: missingFields,
        missingFields: missingFields
      });
    }

    // Validate email format
    if (!validator.isEmail(email.trim())) {
      console.log('❌ Invalid email format:', email);
      return res.status(400).json({ 
        message: 'Please provide a valid email address',
        errorType: 'INVALID_EMAIL_FORMAT',
        field: 'email'
      });
    }

    // Validate password length
    if (password.length < 6) {
      console.log('❌ Password too short:', password.length);
      return res.status(400).json({ 
        message: 'Password must be at least 6 characters long',
        errorType: 'PASSWORD_TOO_SHORT',
        field: 'password',
        minLength: 6
      });
    }

    // Check if user already exists
    const existingUser = await User.findOne({ email: email.trim().toLowerCase() });
    if (existingUser) {
      console.log('❌ User already exists:', email);
      return res.status(400).json({ 
        message: 'A user with this email already exists',
        errorType: 'USER_ALREADY_EXISTS',
        field: 'email',
        suggestion: 'Try signing in instead'
      });
    }

    // Create new user with trimmed and formatted data
    const userData = {
      firstName: firstName.trim(),
      lastName: lastName.trim(),
      email: email.trim().toLowerCase(),
      password: password.trim(),
      phoneNumber: phoneNumber ? phoneNumber.trim() : undefined
    };

    console.log('👤 Creating new user:', { ...userData, password: '[HIDDEN]' });

    const user = new User(userData);
    await user.save();

    console.log('✅ User created successfully:', user._id);

    // Generate token
    const token = generateToken(user._id);

    const responseData = {
      message: 'User registered successfully',
      token,
      user: {
        id: user._id,
        firstName: user.firstName,
        lastName: user.lastName,
        email: user.email,
        phoneNumber: user.phoneNumber,
        isVerified: user.isVerified,
        verificationStatus: user.verificationStatus,
        role: user.role
      }
    };

    console.log('🎉 Registration successful, sending response');
    res.status(201).json(responseData);
    
  } catch (error) {
    console.error('💥 Registration error:', error);
    
    // Handle specific MongoDB errors
    if (error.code === 11000) {
      const field = Object.keys(error.keyPattern)[0];
      return res.status(400).json({ 
        message: `A user with this ${field} already exists` 
      });
    }
    
    // Handle validation errors
    if (error.name === 'ValidationError') {
      const validationErrors = Object.values(error.errors).map(err => err.message);
      return res.status(400).json({ 
        message: 'Validation failed',
        errors: validationErrors
      });
    }
    
    res.status(500).json({ message: 'Internal server error. Please try again.' });
  }
});

// @route   POST /api/auth/login
// @desc    Login user
// @access  Public
router.post('/login', async (req, res) => {
  try {
    console.log('🔐 Login request received:', {
      body: { ...req.body, password: '[HIDDEN]' },
      headers: req.headers['content-type'],
      ip: req.ip
    });

    const { email, password } = req.body;
    const clientIP = req.ip || req.connection.remoteAddress;

    // Check rate limiting for this IP
    const attemptKey = `${clientIP}_${email?.toLowerCase()}`;
    const attempts = loginAttempts.get(attemptKey);
    
    if (attempts && attempts.count >= MAX_LOGIN_ATTEMPTS) {
      const timeLeft = Math.ceil((attempts.lockedUntil - Date.now()) / 1000 / 60);
      if (Date.now() < attempts.lockedUntil) {
        console.log('🚫 Rate limit exceeded for:', { ip: clientIP, email: email?.toLowerCase(), timeLeft });
        return res.status(429).json({ 
          message: `Too many login attempts. Please try again in ${timeLeft} minutes.`,
          errorType: 'RATE_LIMIT_EXCEEDED',
          timeLeftMinutes: timeLeft,
          maxAttempts: MAX_LOGIN_ATTEMPTS
        });
      } else {
        // Reset attempts after lockout period
        loginAttempts.delete(attemptKey);
      }
    }

    // Enhanced validation with specific field checks
    const missingFields = [];
    if (!email || email.trim() === '') missingFields.push('email');
    if (!password || password.trim() === '') missingFields.push('password');

    if (missingFields.length > 0) {
      console.log('❌ Missing required fields:', missingFields);
      return res.status(400).json({ 
        message: `Missing required fields: ${missingFields.join(', ')}`,
        errorType: 'MISSING_REQUIRED_FIELDS',
        fields: missingFields,
        missingFields: missingFields
      });
    }

    // Validate email format
    const cleanEmail = email.trim().toLowerCase();
    if (!validator.isEmail(cleanEmail)) {
      console.log('❌ Invalid email format:', cleanEmail);
      return res.status(400).json({ 
        message: 'Please provide a valid email address',
        errorType: 'INVALID_EMAIL_FORMAT',
        field: 'email'
      });
    }

    // Validate password format
    if (password.length < 6) {
      console.log('❌ Password too short for login attempt:', cleanEmail);
      return res.status(400).json({ 
        message: 'Password must be at least 6 characters long',
        errorType: 'PASSWORD_TOO_SHORT',
        field: 'password',
        minLength: 6
      });
    }

    if (password.length > 100) {
      console.log('❌ Password too long for login attempt:', cleanEmail);
      return res.status(400).json({ 
        message: 'Password is too long',
        errorType: 'PASSWORD_TOO_LONG',
        field: 'password',
        maxLength: 100
      });
    }

    console.log('🔍 Looking up user:', cleanEmail);
    
    // Find user with case-insensitive email search
    const user = await User.findOne({ email: cleanEmail });
    if (!user) {
      console.log('❌ User not found:', cleanEmail);
      
      // Track failed login attempt for non-existent user
      const currentAttempts = loginAttempts.get(attemptKey) || { count: 0, lockedUntil: 0 };
      currentAttempts.count += 1;
      
      if (currentAttempts.count >= MAX_LOGIN_ATTEMPTS) {
        currentAttempts.lockedUntil = Date.now() + LOCKOUT_TIME;
        console.log('🚫 IP locked due to too many failed attempts for non-existent users:', { email: cleanEmail, ip: clientIP });
      }
      
      loginAttempts.set(attemptKey, currentAttempts);
      
      // Use same message as password failure for security but with error type
      return res.status(401).json({ 
        message: 'Invalid email or password',
        errorType: 'INVALID_CREDENTIALS',
        field: 'email'
      });
    }

    console.log('👤 User found:', {
      id: user._id,
      email: user.email,
      role: user.role,
      isVerified: user.isVerified,
      verificationStatus: user.verificationStatus
    });

    // Check password
    console.log('🔒 Verifying password...');
    const isMatch = await user.comparePassword(password.trim());
    if (!isMatch) {
      console.log('❌ Password mismatch for user:', cleanEmail);
      
      // Track failed login attempt
      const currentAttempts = loginAttempts.get(attemptKey) || { count: 0, lockedUntil: 0 };
      currentAttempts.count += 1;
      
      if (currentAttempts.count >= MAX_LOGIN_ATTEMPTS) {
        currentAttempts.lockedUntil = Date.now() + LOCKOUT_TIME;
        console.log('🚫 Account locked due to too many failed attempts:', { email: cleanEmail, ip: clientIP });
        
        return res.status(429).json({ 
          message: `Too many login attempts. Please try again in ${Math.ceil(LOCKOUT_TIME / 1000 / 60)} minutes.`,
          errorType: 'RATE_LIMIT_EXCEEDED',
          lockoutTime: LOCKOUT_TIME / 1000 / 60
        });
      }
      
      loginAttempts.set(attemptKey, currentAttempts);
      
      return res.status(401).json({ 
        message: 'Invalid email or password',
        errorType: 'INVALID_CREDENTIALS',
        field: 'password',
        attemptsRemaining: MAX_LOGIN_ATTEMPTS - currentAttempts.count
      });
    }

    console.log('✅ Password verified successfully');

    // Clear failed login attempts on successful login
    if (loginAttempts.has(attemptKey)) {
      loginAttempts.delete(attemptKey);
      console.log('🧹 Cleared failed login attempts for:', cleanEmail);
    }

    // Check if account is disabled or needs verification
    if (user.verificationStatus === 'denied') {
      console.log('❌ Account denied:', cleanEmail);
      return res.status(403).json({ 
        message: 'Your account has been denied. Please contact support for assistance.' 
      });
    }

    // Generate token
    console.log('🎫 Generating authentication token...');
    const token = generateToken(user._id);

    const responseData = {
      message: 'Login successful',
      token,
      user: {
        id: user._id,
        firstName: user.firstName,
        lastName: user.lastName,
        email: user.email,
        phoneNumber: user.phoneNumber,
        isVerified: user.isVerified,
        verificationStatus: user.verificationStatus,
        role: user.role
      }
    };

    console.log('🎉 Login successful for user:', {
      id: user._id,
      email: user.email,
      role: user.role
    });

    res.json(responseData);
    
  } catch (error) {
    console.error('💥 Login error:', error);
    
    // Handle specific database errors
    if (error.name === 'MongoError' || error.name === 'MongooseError') {
      console.error('Database error during login:', error.message);
      return res.status(500).json({ message: 'Database connection error. Please try again.' });
    }
    
    // Handle validation errors
    if (error.name === 'ValidationError') {
      console.error('Validation error during login:', error.message);
      return res.status(400).json({ message: 'Invalid login data provided' });
    }
    
    res.status(500).json({ message: 'Internal server error. Please try again later.' });
  }
});

// @route   GET /api/auth/me
// @desc    Get current user
// @access  Private
router.get('/me', auth, async (req, res) => {
  try {
    const user = await User.findById(req.user.id).select('-password');
    res.json(user);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Server error' });
  }
});

// @route   PUT /api/auth/profile
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

module.exports = router; 