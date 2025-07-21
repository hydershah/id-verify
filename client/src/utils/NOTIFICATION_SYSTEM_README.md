# Notification System Documentation

## Overview

We've implemented a comprehensive toast notification system using `react-hot-toast` that provides consistent error handling and user feedback across the application.

## Features

- ✅ **Success notifications** with green styling
- ❌ **Error notifications** with red styling 
- ⚠️ **Warning notifications** with yellow/orange styling
- ℹ️ **Info notifications** with blue styling
- ⏳ **Loading notifications** for async operations
- 🎯 **Promise-based notifications** for automatic loading/success/error handling
- 🎨 **Consistent styling** across all notification types
- 📱 **Mobile-friendly** positioning (top-right)

## Files Added/Modified

### New Files:
- `client/src/utils/notifications.ts` - Main notification utilities and configuration

### Modified Files:
- `client/src/App.tsx` - Added Toaster component
- `client/src/pages/Login.tsx` - Added success/error notifications
- `client/src/pages/Register.tsx` - Added success/error notifications
- `client/src/pages/Verification.tsx` - Added upload success/error notifications
- `client/src/pages/Profile.tsx` - Added profile update notifications
- `client/src/contexts/AuthContext.tsx` - Added logout notifications
- `client/src/pages/admin/AdminUsers.tsx` - Added notification demos

## How to Use

### Basic Notifications

```typescript
import { notifications } from '../utils/notifications';

// Success notification
notifications.success('Operation completed successfully!');

// Error notification
notifications.error('Something went wrong!');

// Warning notification
notifications.warning('Please check your input');

// Info notification
notifications.info('Here is some useful information');
```

### Pre-defined Messages

```typescript
import { NOTIFICATION_MESSAGES } from '../utils/notifications';

// Use pre-defined messages for consistency
notifications.success(NOTIFICATION_MESSAGES.AUTH.LOGIN_SUCCESS);
notifications.error(NOTIFICATION_MESSAGES.VERIFICATION.UPLOAD_ERROR);
```

### API Error Handling

```typescript
import { showApiError } from '../utils/notifications';

try {
  await apiCall();
} catch (error) {
  // Automatically resolves error message using existing error resolver
  showApiError(error, 'Fallback message if needed');
}
```

### Loading States with Promises

```typescript
import { handleAsyncWithToast } from '../utils/notifications';

// Automatically shows loading, success, and error notifications
await handleAsyncWithToast(
  async () => {
    // Your async operation
    return await apiService.updateProfile(data);
  },
  {
    loading: 'Updating profile...',
    success: 'Profile updated successfully!',
    error: 'Failed to update profile'
  }
);
```

### Manual Promise Handling

```typescript
import { notifications } from '../utils/notifications';

notifications.promise(
  apiCall(),
  {
    loading: 'Processing...',
    success: 'Success!',
    error: (error) => `Failed: ${error.message}`
  }
);
```

## Configuration

The notification system is configured in `App.tsx` with:
- **Position**: Top-right corner
- **Duration**: 4 seconds (6 seconds for errors)
- **Styling**: Custom colors and consistent design
- **Max Width**: 400px for readability

## Integration with Existing Error System

The notification system works seamlessly with the existing error message resolver in `utils/errorMessages.ts`:

- Field-specific errors show both inline (form validation) and toast notifications
- General errors show toast notifications with resolved error messages
- Success actions show toast notifications with positive feedback

## Examples in the App

Visit `/admin/users` to see interactive examples of all notification types in action.

## Best Practices

1. **Use pre-defined messages** from `NOTIFICATION_MESSAGES` for consistency
2. **Combine with inline errors** for form validation (show both)
3. **Use appropriate types** (success for positive actions, errors for failures)
4. **Keep messages concise** but informative
5. **Use promise-based notifications** for async operations to reduce boilerplate

## Error Handling Philosophy

- **Inline errors**: For form validation and field-specific issues
- **Toast notifications**: For general feedback, success messages, and global errors
- **Both**: For important validation errors that need immediate attention

This creates a multi-layered feedback system that ensures users always know what's happening with their actions. 