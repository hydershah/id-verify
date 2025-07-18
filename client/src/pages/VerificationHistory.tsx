import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { Verification } from '../types';
import apiService from '../services/api';
import LoadingSpinner from '../components/LoadingSpinner';

const VerificationHistory: React.FC = () => {
  const [verifications, setVerifications] = useState<Verification[]>([]);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchVerifications = async () => {
      try {
        const response = await apiService.getVerificationStatus();
        setVerifications(response.verifications);
      } catch (error: any) {
        setError(error.response?.data?.message || 'Failed to load verification history');
      } finally {
        setIsLoading(false);
      }
    };

    fetchVerifications();
  }, []);

  if (isLoading) {
    return <LoadingSpinner text="Loading verification history..." />;
  }

  if (error) {
    return (
      <div className="text-center py-12">
        <div className="bg-danger-50 border border-danger-200 rounded-md p-4 max-w-md mx-auto">
          <p className="text-danger-700">{error}</p>
        </div>
      </div>
    );
  }

  const getStatusIcon = (status: string) => {
    switch (status) {
      case 'approved':
        return (
          <svg className="w-5 h-5 text-success-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M5 13l4 4L19 7" />
          </svg>
        );
      case 'denied':
        return (
          <svg className="w-5 h-5 text-danger-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M6 18L18 6M6 6l12 12" />
          </svg>
        );
      case 'review':
        return (
          <svg className="w-5 h-5 text-primary-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
          </svg>
        );
      case 'pending':
        return (
          <svg className="w-5 h-5 text-warning-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
          </svg>
        );
      default:
        return (
          <svg className="w-5 h-5 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
          </svg>
        );
    }
  };

  return (
    <div className="max-w-4xl mx-auto">
      <div className="mb-8">
        <h1 className="text-3xl font-bold text-gray-900 mb-2">Verification History</h1>
        <p className="text-gray-600">View all your identity verification attempts and their status</p>
      </div>

      {verifications.length === 0 ? (
        <div className="text-center py-12">
          <div className="bg-gray-50 rounded-lg p-8">
            <svg className="mx-auto h-16 w-16 text-gray-400 mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
            </svg>
            <h3 className="text-lg font-medium text-gray-900 mb-2">No verifications yet</h3>
            <p className="text-gray-500 mb-4">You haven't submitted any documents for verification yet.</p>
            <Link to="/verification" className="btn btn-primary">
              Start Verification
            </Link>
          </div>
        </div>
      ) : (
        <div className="space-y-6">
          {verifications.map((verification) => (
            <div key={verification.id} className="card">
              <div className="flex items-center justify-between mb-4">
                <div className="flex items-center space-x-3">
                  <div className="flex-shrink-0">
                    {getStatusIcon(verification.status)}
                  </div>
                  <div>
                    <h3 className="text-lg font-medium text-gray-900">
                      {verification.documentType} Verification
                    </h3>
                    <p className="text-sm text-gray-500">
                      Submitted on {new Date(verification.createdAt).toLocaleDateString()}
                    </p>
                  </div>
                </div>
                <div className={`inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium status-${verification.status}`}>
                  {verification.status}
                </div>
              </div>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div>
                  <h4 className="text-sm font-medium text-gray-700 mb-2">Verification Details</h4>
                  <div className="space-y-2 text-sm">
                    <div className="flex justify-between">
                      <span className="text-gray-500">Transaction ID:</span>
                      <span className="text-gray-900 font-mono">
                        {verification.transactionId || 'N/A'}
                      </span>
                    </div>
                    <div className="flex justify-between">
                      <span className="text-gray-500">Document Type:</span>
                      <span className="text-gray-900">{verification.documentType}</span>
                    </div>
                    {verification.confidence && (
                      <div className="flex justify-between">
                        <span className="text-gray-500">Confidence:</span>
                        <span className="text-gray-900">{verification.confidence}%</span>
                      </div>
                    )}
                  </div>
                </div>

                {verification.extractedData && (
                  <div>
                    <h4 className="text-sm font-medium text-gray-700 mb-2">Extracted Information</h4>
                    <div className="space-y-2 text-sm">
                      <div className="flex justify-between">
                        <span className="text-gray-500">Name:</span>
                        <span className="text-gray-900">
                          {verification.extractedData.firstName} {verification.extractedData.lastName}
                        </span>
                      </div>
                      <div className="flex justify-between">
                        <span className="text-gray-500">DOB:</span>
                        <span className="text-gray-900">
                          {verification.extractedData.dateOfBirth && 
                            new Date(verification.extractedData.dateOfBirth).toLocaleDateString()}
                        </span>
                      </div>
                      <div className="flex justify-between">
                        <span className="text-gray-500">Document #:</span>
                        <span className="text-gray-900 font-mono">
                          {verification.extractedData.documentNumber}
                        </span>
                      </div>
                    </div>
                  </div>
                )}
              </div>

              {verification.biometric && (
                <div className="mt-4 p-3 bg-gray-50 rounded-md">
                  <h4 className="text-sm font-medium text-gray-700 mb-2">Biometric Verification</h4>
                  <div className="grid grid-cols-1 md:grid-cols-3 gap-4 text-sm">
                    <div className="flex items-center space-x-2">
                      <span className="text-gray-500">Face Match:</span>
                      <span className={`font-medium ${verification.biometric.faceMatch ? 'text-success-600' : 'text-danger-600'}`}>
                        {verification.biometric.faceMatch ? 'Passed' : 'Failed'}
                      </span>
                    </div>
                    <div className="flex items-center space-x-2">
                      <span className="text-gray-500">Confidence:</span>
                      <span className="text-gray-900">{verification.biometric.confidence}%</span>
                    </div>
                    <div className="flex items-center space-x-2">
                      <span className="text-gray-500">Liveness:</span>
                      <span className="text-gray-900">{verification.biometric.livenessScore}%</span>
                    </div>
                  </div>
                </div>
              )}

              {verification.apiResponse?.errors && verification.apiResponse.errors.length > 0 && (
                <div className="mt-4 p-3 bg-danger-50 rounded-md">
                  <h4 className="text-sm font-medium text-danger-700 mb-2">Issues Found</h4>
                  <ul className="text-sm text-danger-600 space-y-1">
                    {verification.apiResponse.errors.map((error, index) => (
                      <li key={index}>• {error}</li>
                    ))}
                  </ul>
                </div>
              )}

              {verification.reviewNotes && (
                <div className="mt-4 p-3 bg-primary-50 rounded-md">
                  <h4 className="text-sm font-medium text-primary-700 mb-2">Review Notes</h4>
                  <p className="text-sm text-primary-600">{verification.reviewNotes}</p>
                </div>
              )}
            </div>
          ))}
        </div>
      )}

      <div className="mt-8 text-center">
        <Link to="/verification" className="btn btn-primary">
          Submit New Verification
        </Link>
      </div>
    </div>
  );
};

export default VerificationHistory; 