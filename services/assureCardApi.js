const axios = require('axios');
const { convertToBase64 } = require('./fileUpload');

class AssureCardAPI {
  constructor() {
    // Official BlueAssure Platform API endpoint from documentation
    this.apiUrl = 'https://blueassure.evssolutions.com/WebServices/Integrated/Main/V300/AssureCard';
    
    // These should be set in environment variables
    this.credentials = {
      username: process.env.BLUEASSURE_USERNAME || 'your_username',
      password: process.env.BLUEASSURE_PASSWORD || 'your_password'
    };

    // Test mode configuration
    this.testMode = process.env.BLUEASSURE_TEST_MODE === 'true';
    
    // Mock mode for development when credentials are invalid
    this.mockMode = process.env.BLUEASSURE_MOCK_MODE === 'true';
    
    if (this.testMode) {
      console.log('BlueAssure API running in TEST MODE - using dummy data');
    }
    
    if (this.mockMode) {
      console.log('BlueAssure API running in MOCK MODE - simulating responses for development');
    }
  }

  // Generate customer reference according to documentation
  generateCustomerReference(userId) {
    const prefix = this.testMode ? 'TEST_NOTARY' : 'NOTARY';
    return `${prefix}_${Date.now()}_${userId}`;
  }

  // Verify document using official BlueAssure Platform API format
  async verifyDocument(verificationData) {
    try {
      // If in mock mode, return simulated response for development
      if (this.mockMode) {
        return this.generateMockResponse(verificationData);
      }

      const { 
        userId, 
        documentType, 
        frontImagePath, 
        backImagePath, 
        portraitImagePath,
        customerReference 
      } = verificationData;

      // Convert images to base64 with error handling
      let frontImage = null;
      let backImage = null; 
      let portraitImage = null;

      try {
        frontImage = frontImagePath ? convertToBase64(frontImagePath) : null;
        backImage = backImagePath ? convertToBase64(backImagePath) : null;
        portraitImage = portraitImagePath ? convertToBase64(portraitImagePath) : null;
      } catch (conversionError) {
        throw new Error(`Image conversion failed: ${conversionError.message}`);
      }

      // Prepare API payload according to official documentation format
      const payload = {
        meta: {
          credentials: {
            username: this.credentials.username,
            password: this.credentials.password
          },
          customerReference: customerReference || this.generateCustomerReference(userId)
        },
        data: {
          scanMode: "DirectImageUpload",
          documentType: documentType,
          frontImage: frontImage,
          backImage: backImage,
          portraitImage: portraitImage,
          ssn: null,
          phoneNumber: "",
          sendPhoneVerification: null,
          forceVerificationByCall: null,
          emailAddress: null,
          ipAddress: null,
          similarityThreshold: null
        }
      };

      // Make API request with proper headers and TLS configuration
      const response = await axios.post(this.apiUrl, payload, {
        headers: {
          'Host': 'blueassure.evssolutions.com:443',
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        timeout: 60000, // 60 second timeout for document processing
        httpsAgent: new (require('https').Agent)({
          secureProtocol: 'TLSv1_2_method', // Force TLS 1.2 as per documentation
          rejectUnauthorized: true, // Use proper certificate validation
          keepAlive: true,
          timeout: 60000
        })
      });

      // Process response according to documentation format
      return this.processApiResponse(response.data);
      
    } catch (error) {
      console.error('BlueAssure API Error:', error.response?.data || error.message);
      
      // If authentication error (2005) and not in mock mode, provide specific guidance
      if (error.response?.data?.errors?.some(err => err.code === "2005")) {
        console.log('\n🚨 BlueAssure Platform Authentication Error (Code 2005: User not found)');
        console.log('📋 This usually means one of the following issues:');
        console.log('   1. ❌ Invalid credentials - check username/password');
        console.log('   2. 🌐 IP address not whitelisted in BlueAssure Platform');
        console.log('   3. 🔒 Account does not have access to AssureCard product');
        console.log('   4. ⏸️  Account or user is disabled/locked');
        console.log('\n🔧 To fix IP whitelisting issue:');
        console.log('   • Login to BlueAssure Platform Management site');
        console.log('   • Go to Account Security → IP Restrictions');
        console.log('   • Click Edit and add your current IP: 203.175.72.47');
        console.log('   • Save the configuration');
        console.log('\n💡 Alternative: Enable BLUEASSURE_MOCK_MODE=true for development');
      }
      
      return this.handleApiError(error);
    }
  }

  // Generate mock response for development
  generateMockResponse(verificationData) {
    const { userId, documentType, customerReference } = verificationData;
    
    // Simulate processing delay
    return new Promise((resolve) => {
      setTimeout(() => {
        // Generate realistic mock data
        const mockResponse = {
          success: true,
          transactionId: `MOCK_${Date.now()}_${Math.random().toString(36).substr(2, 9)}`,
          status: 'approved', // Mock successful verification
          confidence: 95,
          document: {
            extractedData: {
              firstName: 'John',
              lastName: 'Doe',
              dateOfBirth: '1990-01-15',
              documentNumber: 'D123456789',
              expirationDate: '2025-12-31',
              address: '123 Main St, Anytown, ST 12345'
            }
          },
          biometric: {
            faceMatch: true,
            confidence: 92,
            livenessScore: 88
          },
          errors: [],
          warnings: ['Mock response - using simulated data for development'],
          rawResponse: {
            meta: {
              transactionId: `MOCK_${Date.now()}`,
              productName: 'AssureCard',
              customerReference: customerReference,
              mockMode: true
            }
          }
        };

        console.log('🎭 Mock Response Generated:', {
          transactionId: mockResponse.transactionId,
          status: mockResponse.status,
          confidence: mockResponse.confidence
        });

        resolve(mockResponse);
      }, 1000); // 1 second delay to simulate API processing
    });
  }

  // Process API response according to BlueAssure Platform documentation format
  processApiResponse(data) {
    try {
      console.log('BlueAssure API raw response:', JSON.stringify(data, null, 2));

      // Check for errors first (as per documentation, errors and data are mutually exclusive)
      if (data.errors && Array.isArray(data.errors) && data.errors.length > 0) {
        const errorMessages = data.errors.map(err => err.message || err.toString());
        return {
          success: false,
          status: 'failed',
          confidence: 0,
          transactionId: data.meta?.transactionId || null,
          errors: errorMessages,
          warnings: [],
          rawResponse: data
        };
      }

      // Process successful response with data object
      if (data.data && data.meta) {
        const assureCardData = data.data.assureCard || data.data;
        
        // Extract transaction info from meta
        const transactionId = data.meta.transactionId;
        const productName = data.meta.productName;
        
        // Determine status based on response data
        let status = 'pending';
        let confidence = 0;
        
        // For AssureCard, the response might be asynchronous (webhook-based)
        // Initial response typically just confirms receipt
        if (transactionId) {
          status = 'pending'; // Will be updated via webhook
        }

        // Extract document data if available
        let extractedData = null;
        if (assureCardData.document) {
          extractedData = {
            firstName: assureCardData.document.firstName || '',
            lastName: assureCardData.document.lastName || '',
            dateOfBirth: assureCardData.document.dateOfBirth || '',
            documentNumber: assureCardData.document.documentNumber || '',
            expirationDate: assureCardData.document.expirationDate || '',
            address: assureCardData.document.address || ''
          };
        }

        // Extract biometric data if available
        let biometric = null;
        if (assureCardData.biometric || assureCardData.faceMatch !== undefined) {
          biometric = {
            faceMatch: assureCardData.biometric?.faceMatch || assureCardData.faceMatch || false,
            confidence: assureCardData.biometric?.confidence || assureCardData.faceMatchConfidence || 0,
            livenessScore: assureCardData.biometric?.livenessScore || 0
          };
        }

        return {
          success: true,
          transactionId: transactionId,
          status: this.mapStatus(status),
          confidence: confidence,
          document: extractedData ? { extractedData } : null,
          biometric: biometric,
          errors: [],
          warnings: data.meta.warnings || [],
          rawResponse: data
        };
      }

      // Fallback for unexpected response format
      return {
        success: false,
        status: 'failed',
        confidence: 0,
        errors: ['Unexpected response format from verification API'],
        rawResponse: data
      };

    } catch (error) {
      console.error('Error processing BlueAssure API response:', error);
      return {
        success: false,
        status: 'failed',
        confidence: 0,
        errors: ['Failed to process API response'],
        rawResponse: data
      };
    }
  }

  // Map API status to our status enum
  mapStatus(apiStatus) {
    const statusMap = {
      'approved': 'approved',
      'denied': 'denied',
      'review': 'review',
      'pending': 'pending',
      'error': 'failed'
    };

    const mappedStatus = statusMap[apiStatus?.toLowerCase()];
    // Ensure we always return a valid enum value
    const validStatuses = ['pending', 'approved', 'denied', 'review', 'failed'];
    return validStatuses.includes(mappedStatus) ? mappedStatus : 'pending';
  }

  // Handle API errors according to BlueAssure Platform documentation
  handleApiError(error) {
    let errorMessage = 'Unknown error occurred';
    let status = 'failed'; // Always use valid enum value

    if (error.response) {
      // API responded with error status
      const statusCode = error.response.status;
      const errorData = error.response.data;

      console.log('BlueAssure API Error Response:', {
        status: statusCode,
        data: errorData
      });

      if (statusCode === 401) {
        errorMessage = 'Invalid BlueAssure API credentials - check username/password';
      } else if (statusCode === 403) {
        errorMessage = 'Access forbidden - check IP restrictions and account permissions';
      } else if (statusCode === 400) {
        errorMessage = errorData.message || 'Invalid request data sent to verification API';
      } else if (statusCode === 429) {
        errorMessage = 'API rate limit exceeded - please try again later';
      } else if (statusCode >= 500) {
        errorMessage = 'BlueAssure API server error - service temporarily unavailable';
      } else {
        errorMessage = errorData.message || `BlueAssure API error: ${statusCode}`;
      }
    } else if (error.request) {
      // Network error (including SSL errors)
      if (error.code === 'EPROTO' || error.message.includes('SSL') || error.message.includes('TLS')) {
        errorMessage = 'SSL/TLS connection error - BlueAssure API may be temporarily unavailable';
      } else if (error.code === 'ENOTFOUND') {
        errorMessage = 'Unable to connect to BlueAssure API - check internet connection';
      } else if (error.code === 'ETIMEDOUT') {
        errorMessage = 'Connection to BlueAssure API timed out - please try again';
      } else {
        errorMessage = 'Network error - unable to reach BlueAssure API';
      }
    } else {
      // Other error
      errorMessage = error.message || 'Unexpected error during verification';
    }

    return {
      success: false,
      status: status, // Always 'failed' which is a valid enum value
      confidence: 0,
      transactionId: null,
      errors: [errorMessage],
      rawResponse: error.response?.data || null
    };
  }

  // Health check method to test API connectivity
  async healthCheck() {
    try {
      // Simple test request to check if API is accessible
      const testPayload = {
        meta: {
          credentials: {
            username: this.credentials.username,
            password: this.credentials.password
          },
          customerReference: `HEALTH_CHECK_${Date.now()}`
        },
        data: {
          scanMode: "DirectImageUpload",
          documentType: "DriversLicense",
          frontImage: "test", // This will fail validation but test connectivity
          backImage: null,
          portraitImage: null
        }
      };

      await axios.post(this.apiUrl, testPayload, {
        headers: {
          'Host': 'blueassure.evssolutions.com:443',
          'Content-Type': 'application/json'
        },
        timeout: 10000,
        httpsAgent: new (require('https').Agent)({
          secureProtocol: 'TLSv1_2_method',
          rejectUnauthorized: true
        })
      });

      return { healthy: true };
    } catch (error) {
      return { 
        healthy: false, 
        error: error.message,
        details: error.response?.data || null
      };
    }
  }
}

module.exports = new AssureCardAPI(); 