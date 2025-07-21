import React, { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import { resolveErrorMessage, ERROR_MESSAGES } from '../utils/errorMessages';
import { notifications, NOTIFICATION_MESSAGES, showApiError } from '../utils/notifications';

const Login: React.FC = () => {
  const [formData, setFormData] = useState({
    email: '',
    password: ''
  });
  const [errors, setErrors] = useState<{ [key: string]: string }>({});
  const [isLoading, setIsLoading] = useState(false);
  const { login } = useAuth();
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

    console.log('🔍 Login form validation results:', {
      hasErrors: Object.keys(newErrors).length > 0,
      errors: newErrors,
      formData: { ...formData, password: '[HIDDEN]' }
    });

    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    
    console.log('🔐 Login form submission started');
    console.log('📝 Form data:', { ...formData, password: '[HIDDEN]' });
    
    if (!validateForm()) {
      console.log('❌ Login form validation failed');
      return;
    }

    setIsLoading(true);
    setErrors({}); // Clear previous errors
    
    try {
      console.log('📡 Sending login request...');
      
      // Clean and format the data
      const cleanData = {
        email: formData.email.trim().toLowerCase(),
        password: formData.password.trim()
      };
      
      console.log('🧹 Cleaned data:', { ...cleanData, password: '[HIDDEN]' });
      
      await login(cleanData);
      console.log('✅ Login successful, navigating to dashboard');
      
      // Show success notification
      notifications.success(NOTIFICATION_MESSAGES.AUTH.LOGIN_SUCCESS);
      
      // Navigate after a short delay to let user see the success message
      setTimeout(() => {
        navigate('/dashboard');
      }, 1000);
    } catch (error: any) {
      console.error('💥 Login error:', error);
      console.error('📄 Error response:', error.response?.data);
      console.error('🔢 Status code:', error.response?.status);
      console.error('🔍 Full error object:', error);
      
      // Use centralized error message resolver
      const errorMessage = resolveErrorMessage(error);
      console.log('✅ Resolved error message:', errorMessage);
      
      // Always show the error notification
      notifications.error(errorMessage);
      
      // Also set inline error for form display
      const errorData = error.response?.data;
      const newErrors: { [key: string]: string } = {};
      
      if (errorData?.field && errorData?.errorType) {
        // Field-specific error - show in the appropriate field
        newErrors[errorData.field] = errorMessage;
        console.log(`🎯 Field-specific error for ${errorData.field}:`, errorMessage);
      } else {
        // General error - show in general error area
        newErrors.general = errorMessage;
      }
      
      setErrors(newErrors);
    } finally {
      setIsLoading(false);
    }
  };

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
            Sign in to your account
          </h2>
          <p className="mt-2 text-center text-sm text-gray-600">
            Or{' '}
            <Link to="/register" className="font-medium text-primary-600 hover:text-primary-500">
              create a new account
            </Link>
          </p>
        </div>

        <form className="mt-8 space-y-6" onSubmit={handleSubmit}>

          
          {errors.general && (
            <div className="bg-red-50 border border-red-200 rounded-md p-4 mb-4">
              <div className="flex">
                <div className="flex-shrink-0">
                  <svg className="h-5 w-5 text-red-400" viewBox="0 0 20 20" fill="currentColor">
                    <path fillRule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clipRule="evenodd" />
                  </svg>
                </div>
                <div className="ml-3">
                  <h3 className="text-sm font-medium text-red-800">
                    Login Error
                  </h3>
                  <div className="mt-2 text-sm text-red-700">
                    <p>{errors.general}</p>
                    {errors.general.toLowerCase().includes('too many') && (
                      <p className="mt-2 text-xs">
                        Please wait before trying again to protect your account security.
                      </p>
                    )}
                  </div>
                </div>
              </div>
            </div>
          )}

          <div className="space-y-4">
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
                className={`mt-1 input-field ${errors.email ? 'border-danger-300 focus:ring-danger-500' : ''}`}
                placeholder="Enter your email"
                value={formData.email}
                onChange={handleChange}
              />
              {errors.email && (
                <p className="mt-1 text-sm text-danger-600">{errors.email}</p>
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
                autoComplete="current-password"
                required
                className={`mt-1 input-field ${errors.password ? 'border-danger-300 focus:ring-danger-500' : ''}`}
                placeholder="Enter your password"
                value={formData.password}
                onChange={handleChange}
              />
              {errors.password && (
                <p className="mt-1 text-sm text-danger-600">{errors.password}</p>
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
                  Signing in...
                </div>
              ) : (
                'Sign in'
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

export default Login; 