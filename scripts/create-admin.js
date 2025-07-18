#!/usr/bin/env node

/**
 * Admin User Creation Script for Railway Deployment
 * Run this script after deploying to Railway to create your first admin user
 */

require('dotenv').config();
const mongoose = require('mongoose');
const User = require('../models/User');

async function createAdmin() {
  try {
    // Connect to database (Railway will use DATABASE_URL)
    const mongoUri = process.env.DATABASE_URL || 
                     process.env.MONGODB_URI || 
                     'mongodb://localhost:27017/id-verify';

    console.log('🔌 Connecting to MongoDB...');
    await mongoose.connect(mongoUri, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    });
    console.log('✅ Connected to MongoDB');

    // Admin credentials
    const adminData = {
      firstName: 'Ryon',
      lastName: 'Admin',
      email: process.env.ADMIN_EMAIL || 'ryon@usanotary.net',
      password: process.env.ADMIN_PASSWORD || 'admin123',
      phoneNumber: '+1-555-0123',
      role: 'admin',
      isVerified: true,
      verificationStatus: 'approved'
    };

    // Check if admin with this email already exists
    const existingAdmin = await User.findOne({ email: adminData.email });
    if (existingAdmin) {
      console.log('👤 Admin user already exists with email:', adminData.email);
      console.log('✅ Admin login credentials:');
      console.log('📧 Email:', adminData.email);
      console.log('🔐 Password:', adminData.password);
      process.exit(0);
    }

    // Check if ANY admin exists and offer to create new one
    const anyAdmin = await User.findOne({ role: 'admin' });
    if (anyAdmin) {
      console.log('⚠️  An admin user already exists:', anyAdmin.email);
      console.log('👤 Creating additional admin user...');
    }

    console.log('👤 Creating admin user...');
    console.log('📧 Email:', adminData.email);
    console.log('🔐 Password:', adminData.password);

    const adminUser = new User(adminData);
    await adminUser.save();

    console.log('✅ Admin user created successfully!');
    console.log('\n🎉 Admin Login Credentials:');
    console.log('📧 Email:', adminData.email);
    console.log('🔐 Password:', adminData.password);
    console.log('\n⚠️  IMPORTANT: Please change the admin password after first login!');

  } catch (error) {
    console.error('❌ Error creating admin user:', error.message);
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
  createAdmin();
}

module.exports = createAdmin; 