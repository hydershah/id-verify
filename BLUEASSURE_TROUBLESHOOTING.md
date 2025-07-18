# BlueAssure Platform Troubleshooting Guide

## 🚨 Current Issue: Error Code 2005 "User not found"

You're getting this error because of **IP address restrictions** in BlueAssure Platform.

### **Root Cause**
BlueAssure Platform restricts all API access by IP address for security. Your current IP address is not whitelisted in your account.

### **Your Current IP Address**
```
203.175.72.47
```

## 🔧 **How to Fix This Issue**

### **Option 1: Whitelist Your IP Address (Recommended for Production)**

1. **Login to BlueAssure Platform**
   - Go to the BlueAssure Platform Management site
   - Login with your account credentials

2. **Navigate to IP Restrictions**
   - Go to **Account Security** → **IP Restrictions**
   - Click the **Edit** button

3. **Add Your IP Address**
   - Add your current IP: `203.175.72.47`
   - Save the configuration

4. **Test the Connection**
   ```bash
   node test-blueassure.js
   ```

### **Option 2: Enable Mock Mode (Quick Fix for Development)**

If you need to continue development immediately:

1. **Update .env file**:
   ```bash
   BLUEASSURE_MOCK_MODE=true
   ```

2. **Restart the server**:
   ```bash
   npm run dev
   ```

3. **Test verification** - will use simulated responses

## 📋 **Verification Checklist**

### ✅ **What's Working:**
- SSL/TLS connection to BlueAssure Platform
- Valid credentials format
- Database configuration
- Application server

### ❌ **What's NOT Working:**
- IP address whitelisting (causing authentication failures)

## 🔍 **How to Verify the Fix**

### **Test API Connection:**
```bash
node test-blueassure.js
```

**Expected Success Output:**
```
✅ API is accessible
```

### **Test Document Verification:**
1. Go to `http://localhost:3003/verification`
2. Upload test images (JPEG/PNG)
3. Should process without "User not found" errors

## 📞 **Additional Support**

### **If IP Whitelisting Doesn't Work:**
1. **Check Account Status** - Ensure account is active
2. **Verify Product Access** - Confirm account has AssureCard product enabled
3. **Check User Permissions** - Ensure user can run web service requests
4. **Contact BlueAssure Support** - Provide your account details and IP address

### **Common Issues:**
- **Dynamic IP**: If your IP changes frequently, add a range or use a static IP
- **Corporate Network**: You might need your corporate/office IP instead
- **VPN**: Disable VPN or whitelist the VPN exit IP

## 🎯 **Quick Summary**

**Problem**: Your IP address `203.175.72.47` is not whitelisted
**Solution**: Add this IP to BlueAssure Platform → Account Security → IP Restrictions
**Alternative**: Use `BLUEASSURE_MOCK_MODE=true` for development

Once IP is whitelisted, your verification system will work perfectly! 🚀 