// Centralized error messages for consistent UX
export const ERROR_MESSAGES = {
  // Authentication Errors
  AUTH: {
    INVALID_CREDENTIALS: '🔑 Invalid email or password. Please check your credentials and try again.',
    USER_NOT_FOUND: '❌ No account found with this email address. Please check your email or create a new account.',
    WRONG_PASSWORD: '🔒 Incorrect password. Please try again or reset your password.',
    USER_ALREADY_EXISTS: '📧 An account with this email already exists. Please sign in or use a different email.',
    ACCOUNT_LOCKED: '🚫 Account temporarily locked due to too many failed attempts. Please try again later.',
    ACCOUNT_DENIED: '⛔ Your account access has been denied. Please contact support for assistance.',
    TOKEN_EXPIRED: '⏰ Your session has expired. Please sign in again.',
    TOKEN_INVALID: '🔓 Invalid session. Please sign in again.',
  },

  // Validation Errors
  VALIDATION: {
    EMAIL_REQUIRED: 'Email address is required',
    EMAIL_INVALID: 'Please enter a valid email address',
    PASSWORD_REQUIRED: 'Password is required',
    PASSWORD_TOO_SHORT: 'Password must be at least 6 characters long',
    PASSWORD_TOO_LONG: 'Password is too long (maximum 100 characters)',
    PASSWORDS_DONT_MATCH: 'Passwords do not match',
    FIRST_NAME_REQUIRED: 'First name is required',
    FIRST_NAME_TOO_SHORT: 'First name must be at least 2 characters',
    LAST_NAME_REQUIRED: 'Last name is required',
    LAST_NAME_TOO_SHORT: 'Last name must be at least 2 characters',
    PHONE_INVALID: 'Please enter a valid phone number',
    MISSING_FIELDS: 'Please fill in all required fields',
  },

  // Rate Limiting Errors
  RATE_LIMIT: {
    TOO_MANY_ATTEMPTS: '⚡ Too many attempts. Please wait before trying again.',
    ACCOUNT_TEMPORARILY_LOCKED: '🕐 Account temporarily locked for security. Please try again in a few minutes.',
  },

  // Server Errors
  SERVER: {
    INTERNAL_ERROR: '🔧 Something went wrong on our end. Please try again later.',
    DATABASE_ERROR: '💾 Database connection error. Please try again.',
    NETWORK_ERROR: '🌐 Network connection error. Please check your internet connection.',
    SERVICE_UNAVAILABLE: '🚧 Service temporarily unavailable. Please try again later.',
  },

  // Generic Errors
  GENERIC: {
    SOMETHING_WENT_WRONG: 'Something went wrong. Please try again.',
    PLEASE_TRY_AGAIN: 'Please try again.',
    CONTACT_SUPPORT: 'If the problem persists, please contact support.',
  }
};

// Error type detection utilities
export const ERROR_TYPES = {
  isUserAlreadyExists: (message: string): boolean => 
    message.toLowerCase().includes('already exists') || 
    message.toLowerCase().includes('user with this email'),
  
  isInvalidCredentials: (message: string): boolean =>
    message.toLowerCase().includes('invalid') && 
    (message.toLowerCase().includes('email') || message.toLowerCase().includes('password') || message.toLowerCase().includes('credentials')),
  
  isPasswordTooShort: (message: string): boolean =>
    message.toLowerCase().includes('password') && 
    message.toLowerCase().includes('at least'),
  
  isEmailInvalid: (message: string): boolean =>
    message.toLowerCase().includes('valid email'),
  
  isMissingFields: (message: string): boolean =>
    message.toLowerCase().includes('missing') || 
    message.toLowerCase().includes('required'),
  
  isRateLimit: (message: string): boolean =>
    message.toLowerCase().includes('too many') || 
    message.toLowerCase().includes('rate limit') ||
    message.toLowerCase().includes('locked'),
  
  isServerError: (status: number): boolean =>
    status >= 500,
  
  isValidationError: (status: number): boolean =>
    status === 400,
  
  isAuthError: (status: number): boolean =>
    status === 401 || status === 403,
};

// Enhanced error message resolver
export const resolveErrorMessage = (error: any): string => {
  const message = error.response?.data?.message || error.message || '';
  const status = error.response?.status;

  console.log('🔍 Resolving error message:', { message, status, error });

  // Handle specific status codes first
  if (status === 429) {
    return ERROR_MESSAGES.RATE_LIMIT.TOO_MANY_ATTEMPTS;
  }

  if (ERROR_TYPES.isServerError(status)) {
    if (message.toLowerCase().includes('database')) {
      return ERROR_MESSAGES.SERVER.DATABASE_ERROR;
    }
    return ERROR_MESSAGES.SERVER.INTERNAL_ERROR;
  }

  // Handle validation errors (400)
  if (ERROR_TYPES.isValidationError(status)) {
    if (ERROR_TYPES.isUserAlreadyExists(message)) {
      return ERROR_MESSAGES.AUTH.USER_ALREADY_EXISTS;
    }
    if (ERROR_TYPES.isPasswordTooShort(message)) {
      return ERROR_MESSAGES.VALIDATION.PASSWORD_TOO_SHORT;
    }
    if (ERROR_TYPES.isEmailInvalid(message)) {
      return ERROR_MESSAGES.VALIDATION.EMAIL_INVALID;
    }
    if (ERROR_TYPES.isMissingFields(message)) {
      return ERROR_MESSAGES.VALIDATION.MISSING_FIELDS;
    }
    // Return original message for other validation errors
    return message || ERROR_MESSAGES.VALIDATION.MISSING_FIELDS;
  }

  // Handle auth errors (401, 403)
  if (ERROR_TYPES.isAuthError(status)) {
    if (status === 403) {
      if (message.toLowerCase().includes('denied')) {
        return ERROR_MESSAGES.AUTH.ACCOUNT_DENIED;
      }
      if (ERROR_TYPES.isRateLimit(message)) {
        return ERROR_MESSAGES.AUTH.ACCOUNT_LOCKED;
      }
    }
    if (status === 401) {
      return ERROR_MESSAGES.AUTH.INVALID_CREDENTIALS;
    }
  }

  // Network errors
  if (error.code === 'NETWORK_ERROR' || error.code === 'ECONNREFUSED') {
    return ERROR_MESSAGES.SERVER.NETWORK_ERROR;
  }

  // Return original message or generic fallback
  return message || ERROR_MESSAGES.GENERIC.SOMETHING_WENT_WRONG;
};

export default ERROR_MESSAGES; 