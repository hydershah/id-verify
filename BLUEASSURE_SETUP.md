# BlueAssure Platform Integration Setup

This document provides instructions for setting up the BlueAssure Platform API integration for document verification.

## Prerequisites

1. **BlueAssure Platform Account** - You need an active account with BlueAssure Platform
2. **API Credentials** - Generated from your BlueAssure Platform account
3. **IP Whitelisting** - Your server IP must be added to the allowed list
4. **Environment Variables** - Properly configured credentials

## Setup Steps

### 1. Get API Credentials

1. Log in to your BlueAssure Platform Management site
2. Navigate to **Account Security** → **Integration Credentials**
3. Click **Add** to create new credentials
4. Copy the generated username and password (password won't be shown again!)
5. Save credentials in a secure password manager

### 2. Configure IP Restrictions

1. In BlueAssure Platform, go to **Account Security** → **IP Restrictions**
2. Click **Edit** and add your server's IP address
3. For development, you may need to add your local IP
4. Save the configuration

### 3. Environment Variables

Copy `.env.example` to `.env` and configure:

```bash
# BlueAssure Platform API Configuration
BLUEASSURE_USERNAME=your_actual_username_here
BLUEASSURE_PASSWORD=your_actual_password_here

# For testing with dummy data (no charges)
BLUEASSURE_TEST_MODE=true
```

### 4. Test the Connection

Run the test script to verify connectivity:

```bash
node test-blueassure.js
```

Expected output for successful connection:
```
✅ API is accessible
```

## Important Notes

### Document Requirements

- **File Types**: JPEG, PNG only (no PDFs)
- **Size Limits**: Under 5MB per image
- **Resolution**: Minimum 800x600px, maximum 1500px
- **Quality**: Less than 15% compression rate

### API Behavior

- **Asynchronous Processing**: Results come via webhook (not immediate response)
- **Processing Time**: 10 seconds to 1 minute per verification
- **Webhook Required**: You need to configure a webhook URL for results

### Test Mode

When `BLUEASSURE_TEST_MODE=true`:
- Uses dummy data (no real verification)
- No transaction charges
- Use special test images provided by BlueAssure
- Responses include dummy results for testing workflows

### Supported Document Types

- `DriversLicense` - Requires front and back images
- `PassportBook` - Requires front image only
- `PassportCard` - Requires front and back images

## Troubleshooting

### SSL/TLS Errors
- Ensure your system supports TLS 1.2
- Check firewall settings
- Verify the API endpoint URL is correct

### Authentication Errors (401)
- Verify username/password are correct
- Check that credentials haven't expired
- Ensure account is active

### Access Forbidden (403)
- Check IP restrictions in BlueAssure Platform
- Verify account has access to AssureCard product
- Check user permissions

### Connection Timeouts
- Verify internet connectivity
- Check if BlueAssure Platform is accessible from your server
- Consider increasing timeout values for slower connections

## Support

For technical issues:
1. Check the BlueAssure Platform documentation
2. Review server logs for detailed error messages
3. Contact BlueAssure Platform support with your account details

## Security Notes

- Never commit credentials to version control
- Use environment variables for all sensitive data
- Regularly rotate API credentials
- Monitor API usage and logs for suspicious activity 