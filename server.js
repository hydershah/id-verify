const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const helmet = require('helmet');
const rateLimit = require('express-rate-limit');
const path = require('path');
require('dotenv').config();

const app = express();

// Trust proxy for proper IP handling (fixes rate limiting error)
app.set('trust proxy', 1);

// Security middleware
app.use(helmet());
app.use(cors());

// Rate limiting with improved configuration
const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100, // limit each IP to 100 requests per windowMs
  standardHeaders: true, // Return rate limit info in the `RateLimit-*` headers
  legacyHeaders: false, // Disable the `X-RateLimit-*` headers
  handler: (req, res) => {
    res.status(429).json({
      error: 'Too many requests',
      message: 'Please try again later',
      retryAfter: Math.round(req.rateLimit.resetTime / 1000)
    });
  },
  // Skip rate limiting in development if needed
  skip: (req) => {
    return process.env.NODE_ENV === 'development' && req.ip === '127.0.0.1';
  }
});
app.use('/api/', limiter);

// Body parsing middleware
app.use(express.json({ limit: '50mb' }));
app.use(express.urlencoded({ extended: true, limit: '50mb' }));

// Static files
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));

// Database connection with Railway support
const mongoUri = process.env.DATABASE_URL || 
                 process.env.MONGODB_URI || 
                 process.env.MONGO_URL || 
                 'mongodb://localhost:27017/id-verify';

console.log('Connecting to MongoDB...');
console.log('Environment:', process.env.NODE_ENV || 'development');
console.log('MongoDB URI configured:', mongoUri ? 'Yes' : 'No');

mongoose.connect(mongoUri, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
})
.then(() => {
  console.log('MongoDB connected successfully');
  console.log('Database name:', mongoose.connection.db.databaseName);
})
.catch(err => {
  console.log('MongoDB connection error:', err);
  if (process.env.NODE_ENV === 'production') {
    console.log('💡 Railway MongoDB Setup Guide:');
    console.log('1. Add MongoDB plugin to your Railway project');
    console.log('2. Railway will automatically set DATABASE_URL environment variable');
    console.log('3. Make sure to deploy after adding the plugin');
  }
});

// Health check endpoint for Railway
app.get('/api/health', (req, res) => {
  res.status(200).json({ 
    status: 'healthy', 
    timestamp: new Date().toISOString(),
    environment: process.env.NODE_ENV || 'development',
    mongodb: mongoose.connection.readyState === 1 ? 'connected' : 'disconnected'
  });
});

// Routes
app.use('/api/auth', require('./routes/auth'));
app.use('/api/users', require('./routes/users'));
app.use('/api/verification', require('./routes/verification'));

// Serve static files from the React app in production and development (if build exists)
const buildPath = path.join(__dirname, 'client/build');
if (process.env.NODE_ENV === 'production' || require('fs').existsSync(buildPath)) {
  app.use(express.static(buildPath));
  
  // Only serve React app for non-API routes
  app.get('*', (req, res) => {
    // Don't serve React app for API routes
    if (req.path.startsWith('/api/')) {
      return res.status(404).json({ message: 'API endpoint not found' });
    }
    res.sendFile(path.join(buildPath, 'index.html'));
  });
}

// Error handling middleware
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ 
    message: 'Something went wrong!',
    error: process.env.NODE_ENV === 'development' ? err.message : 'Internal server error'
  });
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
}); 