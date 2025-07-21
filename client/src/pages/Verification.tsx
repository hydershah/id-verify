import React, { useState, useRef, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { VerificationUpload, Verification as VerificationType } from '../types';
import apiService from '../services/api';
import { notifications, NOTIFICATION_MESSAGES, showApiError } from '../utils/notifications';

const Verification: React.FC = () => {
  const [formData, setFormData] = useState<VerificationUpload>({
    documentType: 'DriversLicense',
    frontImage: undefined,
    backImage: undefined,
    portraitImage: undefined,
  });
  const [existingVerification, setExistingVerification] = useState<VerificationType | null>(null);
  const [isLoading, setIsLoading] = useState(false);
  const [isLoadingData, setIsLoadingData] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);
  const [dragActive, setDragActive] = useState<{ [key: string]: boolean }>({});
  
  const frontImageRef = useRef<HTMLInputElement>(null);
  const backImageRef = useRef<HTMLInputElement>(null);
  const portraitImageRef = useRef<HTMLInputElement>(null);
  
  const navigate = useNavigate();

  // Load existing verification data on component mount
  useEffect(() => {
    const loadVerificationData = async () => {
      try {
        setIsLoadingData(true);
        const result = await apiService.getCurrentVerification();
        if (result.verification) {
          setExistingVerification(result.verification);
          // Set form data from existing verification
          setFormData(prev => ({
            ...prev,
            documentType: result.verification?.documentType || 'DriversLicense'
          }));
          console.log('📋 Loaded existing verification:', {
            id: result.verification.id,
            status: result.verification.status,
            documentType: result.verification.documentType
          });
        }
      } catch (error) {
        console.error('Error loading verification data:', error);
        // Don't show error for missing verification - it's normal for new users
      } finally {
        setIsLoadingData(false);
      }
    };

    loadVerificationData();
  }, []);

  const documentTypes = [
    { value: 'DriversLicense', label: "Driver's License" },
    { value: 'Passport', label: 'Passport' },
    { value: 'NationalID', label: 'National ID' },
    { value: 'StateID', label: 'State ID' },
  ];

  const handleInputChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    setFormData(prev => ({
      ...prev,
      documentType: e.target.value as any
    }));
  };

  const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>, type: 'frontImage' | 'backImage' | 'portraitImage') => {
    const file = e.target.files?.[0];
    if (file) {
      // Validate file type
      if (!file.type.startsWith('image/')) {
        setError(`Please select a valid image file for ${type.replace('Image', ' image')}. PDF files are not supported.`);
        return;
      }

      // Validate file size (5MB max)
      if (file.size > 5 * 1024 * 1024) {
        setError(`Image file is too large. Please select an image smaller than 5MB.`);
        return;
      }

      setError(null);
      setFormData(prev => ({
        ...prev,
        [type]: file
      }));
    }
  };

  const handleDrag = (e: React.DragEvent, type: string) => {
    e.preventDefault();
    e.stopPropagation();
    
    if (e.type === 'dragenter' || e.type === 'dragover') {
      setDragActive(prev => ({ ...prev, [type]: true }));
    } else if (e.type === 'dragleave') {
      setDragActive(prev => ({ ...prev, [type]: false }));
    }
  };

  const handleDrop = (e: React.DragEvent, type: 'frontImage' | 'backImage' | 'portraitImage') => {
    e.preventDefault();
    e.stopPropagation();
    setDragActive(prev => ({ ...prev, [type]: false }));
    
    const file = e.dataTransfer.files?.[0];
    if (file) {
      // Validate file type
      if (!file.type.startsWith('image/')) {
        setError(`Please select a valid image file for ${type.replace('Image', ' image')}. PDF files are not supported.`);
        return;
      }

      // Validate file size (5MB max)
      if (file.size > 5 * 1024 * 1024) {
        setError(`Image file is too large. Please select an image smaller than 5MB.`);
        return;
      }

      setError(null);
      setFormData(prev => ({
        ...prev,
        [type]: file
      }));
    }
  };

  const validateForm = () => {
    // Check if we have either new files or existing images
    const hasFrontImage = formData.frontImage || existingVerification?.documents?.frontImage;
    const hasBackImage = formData.backImage || existingVerification?.documents?.backImage;
    const hasPortraitImage = formData.portraitImage || existingVerification?.documents?.portraitImage;

    if (!hasFrontImage) {
      setError('Please upload the front image of your document');
      return false;
    }
    
    if (formData.documentType === 'DriversLicense' && !hasBackImage) {
      setError('Please upload the back image of your driver\'s license');
      return false;
    }
    
    if (!hasPortraitImage) {
      setError('Please upload a selfie for identity verification');
      return false;
    }
    
    return true;
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError(null);
    setSuccess(null);
    
    if (!validateForm()) {
      return;
    }
    
    setIsLoading(true);
    
    try {
      await apiService.uploadVerification(formData);
      
      // Clear form state and show success
      setSuccess('Documents uploaded successfully! Processing verification...');
      notifications.success(NOTIFICATION_MESSAGES.VERIFICATION.UPLOAD_SUCCESS);
      
      setTimeout(() => {
        navigate('/dashboard');
      }, 2000);
    } catch (error: any) {
      console.error('💥 Verification upload error:', error);
      
      // Show both inline error (for form context) and toast notification
      const errorMessage = error.response?.data?.message || 'Failed to upload documents. Please try again.';
      setError(errorMessage);
      showApiError(error, NOTIFICATION_MESSAGES.VERIFICATION.UPLOAD_ERROR);
    } finally {
      setIsLoading(false);
    }
  };

  const getFilePreview = (file: File) => {
    return URL.createObjectURL(file);
  };

  // Helper function to get image source (either from new upload or existing verification)
  const getImageSrc = (file: File | undefined, existingImageData: any, fieldName: 'frontImage' | 'backImage' | 'portraitImage'): string | undefined => {
    if (file) {
      // New file uploaded
      return getFilePreview(file);
    } else if (existingVerification?.documents?.[fieldName]?.path) {
      // Existing image from server - use path instead of url
      return `/api/verification/documents/${existingVerification.documents[fieldName]?.fileName}`;
    }
    return undefined;
  };

  const getImageName = (file: File | undefined, existingImageData: any, fieldName: 'frontImage' | 'backImage' | 'portraitImage') => {
    if (file) {
      return file.name;
    } else if (existingVerification?.documents?.[fieldName]?.originalName) {
      return existingVerification.documents[fieldName]?.originalName;
    }
    return 'Unknown file';
  };

  // Show loading spinner while fetching verification data
  if (isLoadingData) {
    return (
      <div className="max-w-4xl mx-auto flex items-center justify-center min-h-96">
        <div className="text-center">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary-600 mx-auto mb-4"></div>
          <p className="text-gray-600">Loading verification data...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="max-w-4xl mx-auto">
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-gray-900 mb-2">Identity Verification</h1>
        <p className="text-gray-600">
          {existingVerification 
            ? `Your verification status is: ${existingVerification.status}. You can update your documents below if needed.`
            : 'Upload your documents to verify your identity. All information is encrypted and secure.'
          }
        </p>
        {existingVerification && existingVerification.status === 'approved' && (
          <div className="mt-4 p-4 bg-green-50 border border-green-200 rounded-md">
            <p className="text-green-800 font-medium">✅ Your identity has been successfully verified!</p>
            {existingVerification.extractedData && (
              <p className="text-green-700 text-sm mt-1">
                Verified: {existingVerification.extractedData.firstName} {existingVerification.extractedData.lastName}
              </p>
            )}
          </div>
        )}
        {existingVerification && existingVerification.status === 'denied' && (
          <div className="mt-4 p-4 bg-red-50 border border-red-200 rounded-md">
            <p className="text-red-800 font-medium">❌ Verification was not successful.</p>
            <p className="text-red-700 text-sm mt-1">Please upload new, clear photos of your documents.</p>
          </div>
        )}
        {existingVerification && existingVerification.status === 'pending' && (
          <div className="mt-4 p-4 bg-yellow-50 border border-yellow-200 rounded-md">
            <p className="text-yellow-800 font-medium">⏳ Your verification is being processed.</p>
            <p className="text-yellow-700 text-sm mt-1">This usually takes a few minutes. You can update your documents if needed.</p>
          </div>
        )}
      </div>

      <form onSubmit={handleSubmit} className="space-y-8">
        {/* Document Type Selection */}
        <div className="card">
          <div className="card-header">
            <h2 className="text-lg font-semibold text-gray-900">Document Type</h2>
            <p className="text-sm text-gray-600 mt-1">
              Select the type of identity document you'll be uploading. Only clear, high-quality photos of physical documents are accepted.
            </p>
          </div>
          <div>
            <label htmlFor="documentType" className="block text-sm font-medium text-gray-700 mb-2">
              Select Document Type
            </label>
            <select
              id="documentType"
              value={formData.documentType}
              onChange={handleInputChange}
              className="input-field"
            >
              {documentTypes.map(type => (
                <option key={type.value} value={type.value}>
                  {type.label}
                </option>
              ))}
            </select>
            <div className="mt-2 p-3 bg-blue-50 rounded-md">
              <p className="text-sm text-blue-700">
                <strong>Important:</strong> Only upload images (JPEG, PNG) of your actual physical documents. 
                PDF files, screenshots, or photocopies are not accepted for verification.
              </p>
            </div>
          </div>
        </div>

        {/* Front Image Upload */}
        <div className="card">
          <div className="card-header">
            <h2 className="text-lg font-semibold text-gray-900">Front of Document</h2>
          </div>
          <div
            className={`border-2 border-dashed rounded-lg p-6 text-center transition-colors ${
              dragActive.frontImage 
                ? 'border-primary-400 bg-primary-50' 
                : 'border-gray-300 hover:border-gray-400'
            }`}
            onDragEnter={(e) => handleDrag(e, 'frontImage')}
            onDragLeave={(e) => handleDrag(e, 'frontImage')}
            onDragOver={(e) => handleDrag(e, 'frontImage')}
            onDrop={(e) => handleDrop(e, 'frontImage')}
          >
            {formData.frontImage || existingVerification?.documents?.frontImage ? (
              <div className="space-y-4">
                <img
                  src={getImageSrc(formData.frontImage, null, 'frontImage')}
                  alt="Front of document"
                  className="max-w-xs mx-auto rounded-lg shadow-md"
                />
                <div>
                  <p className="text-sm text-gray-600">{getImageName(formData.frontImage, null, 'frontImage')}</p>
                  {existingVerification?.status && (
                    <p className="text-xs text-blue-600 mb-2">
                      Status: <span className="font-medium capitalize">{existingVerification.status}</span>
                      {existingVerification.confidence && (
                        <span className="ml-2">({existingVerification.confidence}% confidence)</span>
                      )}
                    </p>
                  )}
                  <button
                    type="button"
                    onClick={() => frontImageRef.current?.click()}
                    className="btn btn-secondary mt-2"
                  >
                    Change Image
                  </button>
                </div>
              </div>
            ) : (
              <div className="space-y-4">
                <svg className="mx-auto h-12 w-12 text-gray-400" stroke="currentColor" fill="none" viewBox="0 0 48 48">
                  <path d="M28 8H12a4 4 0 00-4 4v20m32-12v8m0 0v8a4 4 0 01-4 4H12a4 4 0 01-4-4v-4m32-4l-3.172-3.172a4 4 0 00-5.656 0L28 28M8 32l9.172-9.172a4 4 0 015.656 0L28 28m0 0l4 4m4-24h8m-4-4v8m-12 4h.02" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" />
                </svg>
                <div>
                  <p className="text-gray-600">Upload front of your document</p>
                  <p className="text-sm text-gray-500">Drag and drop or click to select</p>
                </div>
                <button
                  type="button"
                  onClick={() => frontImageRef.current?.click()}
                  className="btn btn-primary"
                >
                  Select Image
                </button>
              </div>
            )}
            <input
              ref={frontImageRef}
              type="file"
              accept="image/*"
              onChange={(e) => handleFileChange(e, 'frontImage')}
              className="hidden"
            />
          </div>
        </div>

        {/* Back Image Upload (for Driver's License) */}
        {formData.documentType === 'DriversLicense' && (
          <div className="card">
            <div className="card-header">
              <h2 className="text-lg font-semibold text-gray-900">Back of Document</h2>
            </div>
            <div
              className={`border-2 border-dashed rounded-lg p-6 text-center transition-colors ${
                dragActive.backImage 
                  ? 'border-primary-400 bg-primary-50' 
                  : 'border-gray-300 hover:border-gray-400'
              }`}
              onDragEnter={(e) => handleDrag(e, 'backImage')}
              onDragLeave={(e) => handleDrag(e, 'backImage')}
              onDragOver={(e) => handleDrag(e, 'backImage')}
              onDrop={(e) => handleDrop(e, 'backImage')}
            >
              {formData.backImage || existingVerification?.documents?.backImage ? (
                <div className="space-y-4">
                  <img
                    src={getImageSrc(formData.backImage, null, 'backImage')}
                    alt="Back of document"
                    className="max-w-xs mx-auto rounded-lg shadow-md"
                  />
                  <div>
                    <p className="text-sm text-gray-600">{getImageName(formData.backImage, null, 'backImage')}</p>
                    <button
                      type="button"
                      onClick={() => backImageRef.current?.click()}
                      className="btn btn-secondary mt-2"
                    >
                      Change Image
                    </button>
                  </div>
                </div>
              ) : (
                <div className="space-y-4">
                  <svg className="mx-auto h-12 w-12 text-gray-400" stroke="currentColor" fill="none" viewBox="0 0 48 48">
                    <path d="M28 8H12a4 4 0 00-4 4v20m32-12v8m0 0v8a4 4 0 01-4 4H12a4 4 0 01-4-4v-4m32-4l-3.172-3.172a4 4 0 00-5.656 0L28 28M8 32l9.172-9.172a4 4 0 015.656 0L28 28m0 0l4 4m4-24h8m-4-4v8m-12 4h.02" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" />
                  </svg>
                  <div>
                    <p className="text-gray-600">Upload back of your document</p>
                    <p className="text-sm text-gray-500">Drag and drop or click to select</p>
                  </div>
                  <button
                    type="button"
                    onClick={() => backImageRef.current?.click()}
                    className="btn btn-primary"
                  >
                    Select Image
                  </button>
                </div>
              )}
              <input
                ref={backImageRef}
                type="file"
                accept="image/*"
                onChange={(e) => handleFileChange(e, 'backImage')}
                className="hidden"
              />
            </div>
          </div>
        )}

        {/* Portrait Image Upload */}
        <div className="card">
          <div className="card-header">
            <h2 className="text-lg font-semibold text-gray-900">Selfie Photo</h2>
          </div>
          <div
            className={`border-2 border-dashed rounded-lg p-6 text-center transition-colors ${
              dragActive.portraitImage 
                ? 'border-primary-400 bg-primary-50' 
                : 'border-gray-300 hover:border-gray-400'
            }`}
            onDragEnter={(e) => handleDrag(e, 'portraitImage')}
            onDragLeave={(e) => handleDrag(e, 'portraitImage')}
            onDragOver={(e) => handleDrag(e, 'portraitImage')}
            onDrop={(e) => handleDrop(e, 'portraitImage')}
          >
            {formData.portraitImage || existingVerification?.documents?.portraitImage ? (
              <div className="space-y-4">
                <img
                  src={getImageSrc(formData.portraitImage, null, 'portraitImage')}
                  alt="Selfie"
                  className="max-w-xs mx-auto rounded-lg shadow-md"
                />
                <div>
                  <p className="text-sm text-gray-600">{getImageName(formData.portraitImage, null, 'portraitImage')}</p>
                  {existingVerification?.biometric && (
                    <p className="text-xs text-green-600 mb-2">
                      Face Match: {existingVerification.biometric.faceMatch ? '✓ Verified' : '✗ Failed'}
                      {existingVerification.biometric.confidence && (
                        <span className="ml-2">({existingVerification.biometric.confidence}% match)</span>
                      )}
                    </p>
                  )}
                  <button
                    type="button"
                    onClick={() => portraitImageRef.current?.click()}
                    className="btn btn-secondary mt-2"
                  >
                    Change Image
                  </button>
                </div>
              </div>
            ) : (
              <div className="space-y-4">
                <svg className="mx-auto h-12 w-12 text-gray-400" stroke="currentColor" fill="none" viewBox="0 0 48 48">
                  <path d="M28 8H12a4 4 0 00-4 4v20m32-12v8m0 0v8a4 4 0 01-4 4H12a4 4 0 01-4-4v-4m32-4l-3.172-3.172a4 4 0 00-5.656 0L28 28M8 32l9.172-9.172a4 4 0 015.656 0L28 28m0 0l4 4m4-24h8m-4-4v8m-12 4h.02" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" />
                </svg>
                <div>
                  <p className="text-gray-600">Upload a selfie photo</p>
                  <p className="text-sm text-gray-500">This will be used for face matching</p>
                </div>
                <button
                  type="button"
                  onClick={() => portraitImageRef.current?.click()}
                  className="btn btn-primary"
                >
                  Select Image
                </button>
              </div>
            )}
            <input
              ref={portraitImageRef}
              type="file"
              accept="image/*"
              onChange={(e) => handleFileChange(e, 'portraitImage')}
              className="hidden"
            />
          </div>
        </div>

        {/* Error and Success Messages */}
        {error && (
          <div className="bg-danger-50 border border-danger-200 rounded-md p-4">
            <p className="text-danger-700">{error}</p>
          </div>
        )}

        {success && (
          <div className="bg-success-50 border border-success-200 rounded-md p-4">
            <p className="text-success-700">{success}</p>
          </div>
        )}

        {/* Submit Button */}
        <div className="flex justify-end space-x-4">
          <button
            type="button"
            onClick={() => navigate('/dashboard')}
            className="btn btn-secondary"
          >
            Cancel
          </button>
          <button
            type="submit"
            disabled={isLoading}
            className={`btn btn-primary ${isLoading ? 'opacity-50 cursor-not-allowed' : ''}`}
          >
            {isLoading ? (
              <div className="flex items-center">
                <div className="animate-spin rounded-full h-4 w-4 border-b-2 border-white mr-2"></div>
                Processing...
              </div>
            ) : (
              existingVerification ? 'Update Verification' : 'Submit for Verification'
            )}
          </button>
        </div>
      </form>
    </div>
  );
};

export default Verification; 