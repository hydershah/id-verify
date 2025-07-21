#!/usr/bin/env node

/**
 * Test User Creation Script
 * Creates a regular test user for development and testing
 */

require('dotenv').config();
const mongoose = require('mongoose');
const User = require('../models/User');

async function createTestUser() {
  try {
    // Connect to database
    const mongoUri = process.env.DATABASE_URL || 
                     process.env.MONGODB_URI || 
                     'mongodb://localhost:27017/id-verify';

    console.log('🔌 Connecting to MongoDB...');
    await mongoose.connect(mongoUri, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    });
    console.log('✅ Connected to MongoDB');

    // Test user credentials
    const testUserData = {
      firstName: 'John',
      lastName: 'Test',
      email: 'test@example.com',
      password: 'test123',
      phoneNumber: '+1-555-0456',
      role: 'user',
      isVerified: false,
      verificationStatus: 'pending'
    };

    // Check if test user with this email already exists
    const existingUser = await User.findOne({ email: testUserData.email });
    if (existingUser) {
      console.log('👤 Test user already exists with email:', testUserData.email);
      console.log('✅ Test user login credentials:');
      console.log('📧 Email:', testUserData.email);
      console.log('🔐 Password:', testUserData.password);
      process.exit(0);
    }

    console.log('👤 Creating test user...');
    console.log('📧 Email:', testUserData.email);
    console.log('🔐 Password:', testUserData.password);

    const testUser = new User(testUserData);
    await testUser.save();

    console.log('✅ Test user created successfully!');
    console.log('\n🎉 Test User Login Credentials:');
    console.log('📧 Email:', testUserData.email);
    console.log('🔐 Password:', testUserData.password);
    console.log('👤 Role: Regular User');
    console.log('📋 Status: Pending verification');

  } catch (error) {
    console.error('❌ Error creating test user:', error.message);
    if (error.code === 11000) {
      console.log('📧 User with this email already exists. Use a different email.');
    }
    process.exit(1);
  } finally {
    mongoose.connection.close();
    console.log('\n👋 Database connection closed');
  }
}

// Run the script
if (require.main === module) {
  createTestUser();
}

module.exports = createTestUser; 