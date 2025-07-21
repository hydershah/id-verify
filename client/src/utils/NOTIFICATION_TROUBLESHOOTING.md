# Notification System Troubleshooting Guide

## Issue: Notifications Not Showing for Login Errors

### What We've Implemented

1. **Toast Notification System** using `react-hot-toast`
2. **Error Handling Integration** with existing error resolver
3. **Debug Logging** to track notification flow
4. **Test Components** to verify system functionality

### How to Test

#### 1. Test Basic Notifications
- Go to `/admin/users` and click "Test All Notifications"
- Go to `/login` and click "Test Notification System"
- Check browser console for debug logs

#### 2. Test Login Error Notifications
- Try logging in with invalid credentials
- Check browser console for these logs:
  ```
  💥 Login error: [error object]
  🔔 showApiError called with: [error details]
  🔔 notifications.error called with: [message]
  ```

#### 3. Check Toaster Component
- Verify `<Toaster />` is present in `App.tsx`
- Check that it's positioned at "top-right"
- Ensure no CSS is hiding it (z-index issues)

### Debug Steps

#### Step 1: Verify Toaster is Working
1. Open browser console
2. Go to `/admin/users`
3. Click "Test All Notifications"
4. You should see notifications appear in top-right corner
5. Check console for debug logs

#### Step 2: Test Error Handling
1. Go to `/login`
2. Enter invalid credentials (e.g., wrong email/password)
3. Check console for error logs
4. Look for these specific logs:
   - `💥 Login error:`
   - `🔔 showApiError called with:`
   - `🔔 notifications.error called with:`

#### Step 3: Check Server Response
1. Open Network tab in browser dev tools
2. Try invalid login
3. Check the `/api/auth/login` request
4. Verify response has status 401 and proper error message

### Common Issues & Solutions

#### Issue 1: Notifications Not Appearing
**Symptoms:** No toast notifications show up
**Solutions:**
- Check if `react-hot-toast` is installed: `npm list react-hot-toast`
- Verify `<Toaster />` component is in `App.tsx`
- Check browser console for JavaScript errors
- Ensure no CSS is hiding notifications (z-index, overflow: hidden)

#### Issue 2: Error Messages Not Resolving
**Symptoms:** Generic error messages instead of specific ones
**Solutions:**
- Check if `resolveErrorMessage` function is working
- Verify server is returning proper error format
- Check browser console for error resolver logs

#### Issue 3: Notifications Show But Not for Login Errors
**Symptoms:** Test notifications work but login errors don't show
**Solutions:**
- Check if `showApiError` function is being called
- Verify error object structure matches expected format
- Check if error is being caught properly in try/catch

### Debug Console Logs to Look For

#### Successful Notification Flow:
```
🧪 Testing notifications...
🧪 Showing error notification
🔔 notifications.error called with: Test error message!
```

#### Login Error Flow:
```
💥 Login error: [error object]
🔔 showApiError called with: [error details]
🔔 Resolved message: [resolved message]
🔔 notifications.error called with: [final message]
```

### Server Error Response Format

The server should return errors in this format:
```json
{
  "message": "Invalid email or password",
  "errorType": "INVALID_CREDENTIALS",
  "field": "email"
}
```

### Manual Testing Commands

#### Test Notifications Directly in Console:
```javascript
// Test basic notification
import { notifications } from './utils/notifications';
notifications.error('Test error message');

// Test error resolver
import { resolveErrorMessage } from './utils/errorMessages';
const mockError = {
  response: {
    status: 401,
    data: { message: 'Invalid email or password' }
  }
};
console.log(resolveErrorMessage(mockError));
```

### If Still Not Working

1. **Check Browser Compatibility**: Ensure you're using a modern browser
2. **Clear Browser Cache**: Hard refresh (Ctrl+F5 or Cmd+Shift+R)
3. **Check for JavaScript Errors**: Look for any console errors that might be blocking execution
4. **Verify Import Paths**: Ensure all imports are correct
5. **Check Network Tab**: Verify API calls are being made and responses received

### Contact Support

If the issue persists after following these steps, please provide:
1. Browser console logs
2. Network tab screenshots
3. Steps to reproduce the issue
4. Browser and OS information 