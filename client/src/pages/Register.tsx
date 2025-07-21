import React, { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import { resolveErrorMessage, ERROR_MESSAGES } from '../utils/errorMessages';
import { notifications, NOTIFICATION_MESSAGES, showApiError } from '../utils/notifications';

const Register: React.FC = () => {
  const [formData, setFormData] = useState({
    firstName: '',
    lastName: '',
    email: '',
    password: '',
    confirmPassword: '',
    phoneNumber: ''
  });
  const [errors, setErrors] = useState<{ [key: string]: string }>({});
  const [isLoading, setIsLoading] = useState(false);
  const [success, setSuccess] = useState<string | null>(null);
  const { register } = useAuth();
  const navigate = useNavigate();

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    setFormData(prev => ({
      ...prev,
      [name]: value
    }));
    // Clear error when user starts typing
    if (errors[name]) {
      setErrors(prev => ({
        ...prev,
        [name]: ''
      }));
    }
  };

  const validateForm = () => {
    const newErrors: { [key: string]: string } = {};

    // First name validation
    if (!formData.firstName || formData.firstName.trim() === '') {
      newErrors.firstName = ERROR_MESSAGES.VALIDATION.FIRST_NAME_REQUIRED;
    } else if (formData.firstName.trim().length < 2) {
      newErrors.firstName = ERROR_MESSAGES.VALIDATION.FIRST_NAME_TOO_SHORT;
    }

    // Last name validation
    if (!formData.lastName || formData.lastName.trim() === '') {
      newErrors.lastName = ERROR_MESSAGES.VALIDATION.LAST_NAME_REQUIRED;
    } else if (formData.lastName.trim().length < 2) {
      newErrors.lastName = ERROR_MESSAGES.VALIDATION.LAST_NAME_TOO_SHORT;
    }

    // Email validation
    if (!formData.email || formData.email.trim() === '') {
      newErrors.email = ERROR_MESSAGES.VALIDATION.EMAIL_REQUIRED;
    } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(formData.email.trim())) {
      newErrors.email = ERROR_MESSAGES.VALIDATION.EMAIL_INVALID;
    }

    // Password validation
    if (!formData.password || formData.password.trim() === '') {
      newErrors.password = ERROR_MESSAGES.VALIDATION.PASSWORD_REQUIRED;
    } else if (formData.password.length < 6) {
      newErrors.password = ERROR_MESSAGES.VALIDATION.PASSWORD_TOO_SHORT;
    } else if (formData.password.length > 100) {
      newErrors.password = ERROR_MESSAGES.VALIDATION.PASSWORD_TOO_LONG;
    }

    // Confirm password validation
    if (!formData.confirmPassword || formData.confirmPassword.trim() === '') {
      newErrors.confirmPassword = 'Please confirm your password';
    } else if (formData.password !== formData.confirmPassword) {
      newErrors.confirmPassword = ERROR_MESSAGES.VALIDATION.PASSWORDS_DONT_MATCH;
    }

    // Phone number validation (optional field)
    if (formData.phoneNumber && formData.phoneNumber.trim() !== '') {
      const phoneRegex = /^\+?[\d\s\-\(\)\.]{7,20}$/;
      if (!phoneRegex.test(formData.phoneNumber)) {
        newErrors.phoneNumber = ERROR_MESSAGES.VALIDATION.PHONE_INVALID;
      }
    }

    console.log('🔍 Form validation results:', {
      hasErrors: Object.keys(newErrors).length > 0,
      errors: newErrors,
      formData: { ...formData, password: '[HIDDEN]', confirmPassword: '[HIDDEN]' }
    });

    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    
    console.log('🚀 Form submission started');
    console.log('📝 Form data:', { ...formData, password: '[HIDDEN]', confirmPassword: '[HIDDEN]' });
    
    if (!validateForm()) {
      console.log('❌ Form validation failed');
      return;
    }

    setIsLoading(true);
    setErrors({}); // Clear previous errors
    setSuccess(null); // Clear previous success messages
    
    try {
      console.log('📡 Sending registration request...');
      const { confirmPassword, ...registrationData } = formData;
      
      // Ensure all fields are properly trimmed
      const cleanData = {
        firstName: registrationData.firstName.trim(),
        lastName: registrationData.lastName.trim(),
        email: registrationData.email.trim().toLowerCase(),
        password: registrationData.password.trim(),
        phoneNumber: registrationData.phoneNumber?.trim() || undefined
      };
      
      console.log('🧹 Cleaned data:', { ...cleanData, password: '[HIDDEN]' });
      
      await register(cleanData);
      console.log('✅ Registration successful, navigating to dashboard');
      
      // Show success notification and set success state
      setSuccess('Account created successfully! Redirecting to dashboard...');
      notifications.success(NOTIFICATION_MESSAGES.AUTH.REGISTER_SUCCESS);
      
      // Navigate after a short delay to let user see the success message
      setTimeout(() => {
        navigate('/dashboard');
      }, 1000);
    } catch (error: any) {
      console.error('💥 Registration error:', error);
      console.error('📄 Error response:', error.response?.data);
      console.error('🔢 Status code:', error.response?.status);
      console.error('📨 Full error object:', {
        message: error.message,
        status: error.response?.status,
        data: error.response?.data,
        headers: error.response?.headers
      });

      // Use centralized error message resolver
      const errorMessage = resolveErrorMessage(error);
      console.log('✅ Resolved error message:', errorMessage);
      
      // Check if this is a field-specific error and handle accordingly
      const errorData = error.response?.data;
      const newErrors: { [key: string]: string } = {};
      
      if (errorData?.field && errorData?.errorType) {
        // Field-specific error - show both inline and toast
        newErrors[errorData.field] = errorMessage;
        console.log(`🎯 Field-specific error for ${errorData.field}:`, errorMessage);
        notifications.error(`${errorData.field}: ${errorMessage}`);
      } else {
        // General error - show toast notification
        showApiError(error);
        newErrors.general = errorMessage;
      }
      
      setErrors(newErrors);
    } finally {
      setIsLoading(false);
    }
  };

  // Add debug logging to help track form state
  console.log('🔍 Register Form Debug:', {
    formData: { ...formData, password: '[HIDDEN]', confirmPassword: '[HIDDEN]' },
    errors,
    isLoading,
    hasGeneralError: !!errors.general,
    hasFieldErrors: Object.keys(errors).filter(key => key !== 'general').length > 0
  });

  return (
    <div className="min-h-screen bg-gradient-to-br from-primary-50 to-white flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
      <div className="max-w-md w-full space-y-8">
        <div>
          <div className="text-center">
            <Link to="/" className="text-2xl font-bold text-gradient">
              ID Verify
            </Link>
          </div>
          <h2 className="mt-6 text-center text-3xl font-bold text-gray-900">
            Create your account
          </h2>
          <p className="mt-2 text-center text-sm text-gray-600">
            Or{' '}
            <Link to="/login" className="font-medium text-primary-600 hover:text-primary-500">
              sign in to existing account
            </Link>
          </p>
        </div>

        <form className={`mt-8 space-y-6 transition-all duration-300 ${Object.keys(errors).length > 0 ? 'animate-pulse' : ''}`} onSubmit={handleSubmit}>
          {/* Debug Panel - Remove in production */}
          {process.env.NODE_ENV === 'development' && Object.keys(errors).length > 0 && (
            <div className="bg-yellow-50 border border-yellow-200 rounded-md p-3 mb-4">
              <h4 className="text-sm font-medium text-yellow-800 mb-2">🔧 Debug Info (Dev Only)</h4>
              <pre className="text-xs text-yellow-700 overflow-auto">
                {JSON.stringify({ errors, hasFormData: !!formData.email }, null, 2)}
              </pre>
            </div>
          )}

          {/* Field Validation Summary */}
          {Object.keys(errors).filter(key => key !== 'general').length > 0 && (
            <div className="bg-orange-50 border border-orange-200 rounded-lg p-4 mb-4">
              <h3 className="text-sm font-medium text-orange-800 mb-2">
                ⚠️ Please fix the following errors:
              </h3>
              <ul className="text-sm text-orange-700 space-y-1">
                {Object.entries(errors)
                  .filter(([key]) => key !== 'general')
                  .map(([field, message]) => (
                    <li key={field} className="flex items-center">
                      <span className="w-2 h-2 bg-orange-400 rounded-full mr-2 flex-shrink-0"></span>
                      <strong className="capitalize">{field.replace(/([A-Z])/g, ' $1')}:</strong>
                      <span className="ml-1">{message}</span>
                    </li>
                  ))}
              </ul>
            </div>
          )}

          {errors.general && (
            <div className="bg-red-100 border-l-4 border-red-500 rounded-lg p-5 mb-6 shadow-lg">
              <div className="flex items-start">
                <div className="flex-shrink-0">
                  <svg className="h-6 w-6 text-red-500" fill="currentColor" viewBox="0 0 20 20">
                    <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clipRule="evenodd" />
                  </svg>
                </div>
                <div className="ml-4 flex-1">
                  <h3 className="text-lg font-semibold text-red-800 mb-2">
                    ⚠️ Registration Failed
                  </h3>
                  <div className="text-red-700">
                    <p className="font-medium text-base">{errors.general}</p>
                    {(errors.general.toLowerCase().includes('email already exists') || 
                       errors.general.toLowerCase().includes('account with this email') ||
                       errors.general.toLowerCase().includes('user with this email')) && (
                       <div className="mt-4 p-3 bg-red-50 border border-red-200 rounded-md">
                         <p className="text-sm text-red-800 mb-2">
                           <strong>Already have an account?</strong>
                         </p>
                         <Link to="/login" className="inline-flex items-center px-4 py-2 border border-red-300 text-sm font-medium rounded-md text-red-700 bg-white hover:bg-red-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500 transition-colors">
                           <svg className="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                             <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M11 16l-4-4m0 0l4-4m-4 4h14m-5 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h7a3 3 0 013 3v1"></path>
                           </svg>
                           Sign in instead
                         </Link>
                       </div>
                     )}
                  </div>
                </div>
              </div>
            </div>
          )}

          {/* Success Message */}
          {success && (
            <div className="bg-green-100 border-l-4 border-green-500 rounded-lg p-5 mb-6 shadow-lg">
              <div className="flex items-start">
                <div className="flex-shrink-0">
                  <svg className="h-6 w-6 text-green-500" fill="currentColor" viewBox="0 0 20 20">
                    <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clipRule="evenodd" />
                  </svg>
                </div>
                <div className="ml-4 flex-1">
                  <h3 className="text-lg font-semibold text-green-800 mb-2">
                    ✅ Registration Successful!
                  </h3>
                  <p className="text-green-700 font-medium">{success}</p>
                </div>
              </div>
            </div>
          )}

          <div className="space-y-4">
            <div className="grid grid-cols-2 gap-4">
              <div>
                <label htmlFor="firstName" className="block text-sm font-medium text-gray-700">
                  First Name
                </label>
                <input
                  id="firstName"
                  name="firstName"
                  type="text"
                  autoComplete="given-name"
                  required
                  className={`mt-1 input-field ${errors.firstName ? 'border-red-500 bg-red-50 focus:border-red-500 focus:ring-red-500' : ''}`}
                  placeholder="First name"
                  value={formData.firstName}
                  onChange={handleChange}
                />
                {errors.firstName && (
                  <div className="mt-2 p-2 bg-red-50 border border-red-200 rounded-md">
                    <p className="text-sm text-red-700 flex items-center">
                      <svg className="w-4 h-4 mr-2 text-red-500" fill="currentColor" viewBox="0 0 20 20">
                        <path fillRule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clipRule="evenodd" />
                      </svg>
                      {errors.firstName}
                    </p>
                  </div>
                )}
              </div>

              <div>
                <label htmlFor="lastName" className="block text-sm font-medium text-gray-700">
                  Last Name
                </label>
                <input
                  id="lastName"
                  name="lastName"
                  type="text"
                  autoComplete="family-name"
                  required
                  className={`mt-1 input-field ${errors.lastName ? 'border-red-500 bg-red-50 focus:border-red-500 focus:ring-red-500' : ''}`}
                  placeholder="Last name"
                  value={formData.lastName}
                  onChange={handleChange}
                />
                {errors.lastName && (
                  <div className="mt-2 p-2 bg-red-50 border border-red-200 rounded-md">
                    <p className="text-sm text-red-700 flex items-center">
                      <svg className="w-4 h-4 mr-2 text-red-500" fill="currentColor" viewBox="0 0 20 20">
                        <path fillRule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clipRule="evenodd" />
                      </svg>
                      {errors.lastName}
                    </p>
                  </div>
                )}
              </div>
            </div>

            <div>
              <label htmlFor="email" className="block text-sm font-medium text-gray-700">
                Email Address
              </label>
              <input
                id="email"
                name="email"
                type="email"
                autoComplete="email"
                required
                className={`mt-1 input-field ${errors.email ? 'border-red-500 bg-red-50 focus:border-red-500 focus:ring-red-500' : ''}`}
                placeholder="Enter your email"
                value={formData.email}
                onChange={handleChange}
              />
              {errors.email && (
                <div className="mt-2 p-3 bg-red-50 border border-red-200 rounded-md">
                  <p className="text-sm text-red-700 flex items-center">
                    <svg className="w-4 h-4 mr-2 text-red-500" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clipRule="evenodd" />
                    </svg>
                    {errors.email}
                  </p>
                  {errors.email.toLowerCase().includes('already exists') && (
                    <p className="mt-2 text-xs text-red-600">
                      💡 <strong>Tip:</strong> If this is your email, try{' '}
                      <Link to="/login" className="font-medium underline text-red-800 hover:text-red-900">
                        signing in instead
                      </Link>
                    </p>
                  )}
                </div>
              )}
            </div>

            <div>
              <label htmlFor="phoneNumber" className="block text-sm font-medium text-gray-700">
                Phone Number <span className="text-gray-400">(optional)</span>
              </label>
              <input
                id="phoneNumber"
                name="phoneNumber"
                type="tel"
                autoComplete="tel"
                className={`mt-1 input-field ${errors.phoneNumber ? 'border-red-500 bg-red-50 focus:border-red-500 focus:ring-red-500' : ''}`}
                placeholder="Enter your phone number"
                value={formData.phoneNumber}
                onChange={handleChange}
              />
              {errors.phoneNumber && (
                <div className="mt-2 p-2 bg-red-50 border border-red-200 rounded-md">
                  <p className="text-sm text-red-700 flex items-center">
                    <svg className="w-4 h-4 mr-2 text-red-500" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clipRule="evenodd" />
                    </svg>
                    {errors.phoneNumber}
                  </p>
                </div>
              )}
            </div>

            <div>
              <label htmlFor="password" className="block text-sm font-medium text-gray-700">
                Password
              </label>
              <input
                id="password"
                name="password"
                type="password"
                autoComplete="new-password"
                required
                className={`mt-1 input-field ${errors.password ? 'border-red-500 bg-red-50 focus:border-red-500 focus:ring-red-500' : ''}`}
                placeholder="Enter your password"
                value={formData.password}
                onChange={handleChange}
              />
              {errors.password && (
                <div className="mt-2 p-2 bg-red-50 border border-red-200 rounded-md">
                  <p className="text-sm text-red-700 flex items-center">
                    <svg className="w-4 h-4 mr-2 text-red-500" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clipRule="evenodd" />
                    </svg>
                    {errors.password}
                  </p>
                </div>
              )}
            </div>

            <div>
              <label htmlFor="confirmPassword" className="block text-sm font-medium text-gray-700">
                Confirm Password
              </label>
              <input
                id="confirmPassword"
                name="confirmPassword"
                type="password"
                autoComplete="new-password"
                required
                className={`mt-1 input-field ${errors.confirmPassword ? 'border-red-500 bg-red-50 focus:border-red-500 focus:ring-red-500' : ''}`}
                placeholder="Confirm your password"
                value={formData.confirmPassword}
                onChange={handleChange}
              />
              {errors.confirmPassword && (
                <div className="mt-2 p-2 bg-red-50 border border-red-200 rounded-md">
                  <p className="text-sm text-red-700 flex items-center">
                    <svg className="w-4 h-4 mr-2 text-red-500" fill="currentColor" viewBox="0 0 20 20">
                      <path fillRule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clipRule="evenodd" />
                    </svg>
                    {errors.confirmPassword}
                  </p>
                </div>
              )}
            </div>
          </div>

          <div>
            <button
              type="submit"
              disabled={isLoading}
              className={`group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-primary-600 hover:bg-primary-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500 ${
                isLoading ? 'opacity-50 cursor-not-allowed' : ''
              }`}
            >
              {isLoading ? (
                <div className="flex items-center">
                  <div className="animate-spin rounded-full h-4 w-4 border-b-2 border-white mr-2"></div>
                  Creating account...
                </div>
              ) : (
                'Create Account'
              )}
            </button>
          </div>

          <div className="text-center">
            <Link to="/" className="text-sm text-gray-600 hover:text-gray-900">
              ← Back to home
            </Link>
          </div>
        </form>
      </div>
    </div>
  );
};

export default Register; 