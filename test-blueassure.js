// Test script for BlueAssure Platform API connectivity using EVS Service
require('dotenv').config();
const evsService = require('./services/evsService');

async function testBlueAssureConnection() {
  console.log('Testing BlueAssure Platform API Connection using EVS Service...\n');
  
  // Show configuration
  console.log('Configuration:');
  console.log('- Username:', evsService.config.username ? '[SET]' : '[NOT SET]');
  console.log('- Password:', evsService.config.password ? '[SET]' : '[NOT SET]');
  console.log('- Base URL:', evsService.config.baseUrl);
  console.log('- Environment:', evsService.config.environment);
  console.log();
  
  // Test API connectivity
  console.log('Testing API connectivity...');
  try {
    const testResult = await evsService.testConnection();
    
    if (testResult.success) {
      console.log('✅ API is accessible');
      console.log('Message:', testResult.message);
    } else {
      console.log('❌ API connection failed');
      console.log('Error:', testResult.message);
    }
  } catch (error) {
    console.log('❌ API test failed with exception');
    console.log('Error:', error.message);
  }
  
  console.log('\n📖 Next Steps:');
  console.log('1. Set BLUEASSURE_USERNAME and BLUEASSURE_PASSWORD in your .env file');
  console.log('2. Get credentials from BlueAssure Platform → Account Security → Integration Credentials');
  console.log('3. Ensure your IP address is whitelisted in BlueAssure Platform');
  console.log('4. Set BLUEASSURE_MOCK_MODE=true to use test data for development');
}

// Run the test
testBlueAssureConnection().catch(console.error); 