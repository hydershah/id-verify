import toast, { ToastOptions } from 'react-hot-toast';
import { resolveErrorMessage } from './errorMessages';

// Common toast options for consistent styling
const commonToastOptions: ToastOptions = {
  duration: 4000,
  position: 'top-right',
  style: {
    borderRadius: '8px',
    fontSize: '14px',
    padding: '12px 16px',
    maxWidth: '400px',
  },
};

// Success toast options
const successToastOptions: ToastOptions = {
  ...commonToastOptions,
  icon: '✅',
  style: {
    ...commonToastOptions.style,
    background: '#10B981',
    color: '#ffffff',
    border: '1px solid #059669',
  },
};

// Error toast options
const errorToastOptions: ToastOptions = {
  ...commonToastOptions,
  duration: 6000, // Show errors longer
  icon: '❌',
  style: {
    ...commonToastOptions.style,
    background: '#EF4444',
    color: '#ffffff',
    border: '1px solid #DC2626',
  },
};

// Warning toast options
const warningToastOptions: ToastOptions = {
  ...commonToastOptions,
  icon: '⚠️',
  style: {
    ...commonToastOptions.style,
    background: '#F59E0B',
    color: '#ffffff',
    border: '1px solid #D97706',
  },
};

// Info toast options
const infoToastOptions: ToastOptions = {
  ...commonToastOptions,
  icon: 'ℹ️',
  style: {
    ...commonToastOptions.style,
    background: '#3B82F6',
    color: '#ffffff',
    border: '1px solid #2563EB',
  },
};

// Loading toast options
const loadingToastOptions: ToastOptions = {
  ...commonToastOptions,
  duration: Infinity, // Loading toasts should be manually dismissed
  icon: '⏳',
  style: {
    ...commonToastOptions.style,
    background: '#6B7280',
    color: '#ffffff',
    border: '1px solid #4B5563',
  },
};

// Notification utilities
export const notifications = {
  // Success notifications
  success: (message: string, options?: ToastOptions) => {
    return toast.success(message, { ...successToastOptions, ...options });
  },

  // Error notifications
  error: (message: string, options?: ToastOptions) => {
    console.log('🔔 notifications.error called with:', message);
    return toast.error(message, { ...errorToastOptions, ...options });
  },

  // Warning notifications
  warning: (message: string, options?: ToastOptions) => {
    return toast(message, { ...warningToastOptions, ...options });
  },

  // Info notifications
  info: (message: string, options?: ToastOptions) => {
    return toast(message, { ...infoToastOptions, ...options });
  },

  // Loading notifications
  loading: (message: string, options?: ToastOptions) => {
    return toast.loading(message, { ...loadingToastOptions, ...options });
  },

  // Promise-based notifications (for async operations)
  promise: <T>(
    promise: Promise<T>,
    messages: {
      loading: string;
      success: string | ((data: T) => string);
      error: string | ((error: any) => string);
    },
    options?: ToastOptions
  ) => {
    return toast.promise(promise, messages, { ...commonToastOptions, ...options });
  },

  // Dismiss specific toast
  dismiss: (toastId?: string) => {
    return toast.dismiss(toastId);
  },

  // Dismiss all toasts
  dismissAll: () => {
    return toast.dismiss();
  },

  // Custom toast with full control
  custom: (message: string, options?: ToastOptions) => {
    return toast(message, { ...commonToastOptions, ...options });
  },
};

// Pre-defined common messages
export const NOTIFICATION_MESSAGES = {
  AUTH: {
    LOGIN_SUCCESS: '🎉 Welcome back! You have successfully signed in.',
    LOGIN_ERROR: '❌ Sign in failed. Please check your credentials.',
    LOGOUT_SUCCESS: '👋 You have been signed out successfully.',
    REGISTER_SUCCESS: '🎉 Account created successfully! Welcome aboard.',
    REGISTER_ERROR: '❌ Account creation failed. Please try again.',
    PROFILE_UPDATED: '✅ Your profile has been updated successfully.',
    PASSWORD_UPDATED: '✅ Your password has been updated successfully.',
  },
  VERIFICATION: {
    UPLOAD_SUCCESS: '✅ Documents uploaded successfully! We will review them shortly.',
    UPLOAD_ERROR: '❌ Document upload failed. Please try again.',
    STATUS_UPDATED: '✅ Verification status updated successfully.',
    DOCUMENTS_REQUIRED: '⚠️ Please upload all required documents to proceed.',
    REVIEW_SUBMITTED: '📤 Documents submitted for review. You will be notified of the results.',
  },
  GENERAL: {
    LOADING: '⏳ Processing your request...',
    SAVE_SUCCESS: '✅ Changes saved successfully.',
    SAVE_ERROR: '❌ Failed to save changes. Please try again.',
    DELETE_SUCCESS: '✅ Item deleted successfully.',
    DELETE_ERROR: '❌ Failed to delete item. Please try again.',
    NETWORK_ERROR: '🌐 Network error. Please check your connection and try again.',
    COPY_SUCCESS: '📋 Copied to clipboard!',
    FEATURE_COMING_SOON: '🚧 This feature is coming soon!',
  },
  ADMIN: {
    USER_UPDATED: '✅ User information updated successfully.',
    USER_DELETED: '✅ User deleted successfully.',
    VERIFICATION_REVIEWED: '✅ Verification reviewed successfully.',
    BULK_ACTION_SUCCESS: '✅ Bulk action completed successfully.',
    PERMISSION_DENIED: '🚫 You do not have permission to perform this action.',
  },
};

// Utility function to show error from API response
export const showApiError = (error: any, fallbackMessage?: string) => {
  try {
    const message = resolveErrorMessage(error);
    notifications.error(message);
  } catch (err) {
    // Fallback if error resolver is not available
    const message = error.response?.data?.message || error.message || fallbackMessage || 'Something went wrong';
    notifications.error(message);
  }
};

// Utility function to show success message with optional callback
export const showSuccess = (message: string, callback?: () => void, delay: number = 1000) => {
  notifications.success(message);
  if (callback) {
    setTimeout(callback, delay);
  }
};

// Utility function for handling async operations with loading states
export const handleAsyncWithToast = async <T>(
  operation: () => Promise<T>,
  messages: {
    loading: string;
    success: string;
    error?: string;
  }
): Promise<T> => {
  return await notifications.promise(
    operation(),
    {
      loading: messages.loading,
      success: messages.success,
      error: (error: any) => {
        // Use our error resolver if available
        try {
          return resolveErrorMessage(error);
        } catch {
          return messages.error || 'Operation failed';
        }
      },
    }
  );
};

// Quick notification examples (useful for testing/development)
export const showExampleNotifications = () => {
  setTimeout(() => notifications.success('Success! Everything worked perfectly.'), 500);
  setTimeout(() => notifications.error('Error! Something went wrong.'), 1000);
  setTimeout(() => notifications.warning('Warning! Please check your input.'), 1500);
  setTimeout(() => notifications.info('Info: Here\'s some useful information.'), 2000);
};

export default notifications; 