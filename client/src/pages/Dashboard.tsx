import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../contexts/AuthContext';
import { DashboardData } from '../types';
import apiService from '../services/api';
import LoadingSpinner from '../components/LoadingSpinner';

const Dashboard: React.FC = () => {
  const { user } = useAuth();
  const [dashboardData, setDashboardData] = useState<DashboardData | null>(null);
  const [isLoading, setIsLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    const fetchDashboardData = async () => {
      try {
        const data = await apiService.getDashboardData();
        setDashboardData(data);
      } catch (error: any) {
        setError(error.response?.data?.message || 'Failed to load dashboard data');
      } finally {
        setIsLoading(false);
      }
    };

    fetchDashboardData();
  }, []);

  if (isLoading) {
    return <LoadingSpinner text="Loading dashboard..." />;
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

  const getStatusColor = (status: string) => {
    switch (status) {
      case 'approved':
        return 'text-success-600 bg-success-50';
      case 'denied':
        return 'text-danger-600 bg-danger-50';
      case 'review':
        return 'text-primary-600 bg-primary-50';
      case 'pending':
        return 'text-warning-600 bg-warning-50';
      default:
        return 'text-gray-600 bg-gray-50';
    }
  };

  const getStatusMessage = (status: string) => {
    switch (status) {
      case 'approved':
        return 'Your identity has been successfully verified!';
      case 'denied':
        return 'Your verification was denied. Please try again with different documents.';
      case 'review':
        return 'Your documents are under review. This may take 1-2 business days.';
      case 'pending':
        return 'Please upload your documents to start the verification process.';
      default:
        return 'Status unknown';
    }
  };

  return (
    <div className="space-y-6">
      {/* Welcome Header */}
      <div className="bg-gradient-to-r from-primary-600 to-primary-800 rounded-lg p-6 text-white">
        <h1 className="text-2xl font-bold mb-2">
          Welcome back, {user?.firstName}!
        </h1>
        <p className="text-primary-100">
          Manage your identity verification and account settings
        </p>
      </div>

      {/* Verification Status Card */}
      <div className="card">
        <div className="card-header">
          <h2 className="text-lg font-semibold text-gray-900">Verification Status</h2>
        </div>
        <div className="space-y-4">
          <div className={`p-4 rounded-lg ${getStatusColor(dashboardData?.verification.status || 'pending')}`}>
            <div className="flex items-center justify-between">
              <div>
                <h3 className="font-medium capitalize">
                  {dashboardData?.verification.status || 'Pending'}
                </h3>
                <p className="text-sm mt-1">
                  {getStatusMessage(dashboardData?.verification.status || 'pending')}
                </p>
              </div>
              <div className="text-right">
                <div className={`inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium status-${dashboardData?.verification.status || 'pending'}`}>
                  {dashboardData?.verification.isVerified ? 'Verified' : 'Not Verified'}
                </div>
              </div>
            </div>
          </div>

          {/* Quick Actions */}
          <div className="flex flex-wrap gap-3">
            {!dashboardData?.verification.isVerified && (
              <Link
                to="/verification"
                className="btn btn-primary"
              >
                {dashboardData?.verification.totalAttempts === 0 ? 'Start Verification' : 'Try Again'}
              </Link>
            )}
            <Link
              to="/verification/history"
              className="btn btn-secondary"
            >
              View History
            </Link>
          </div>
        </div>
      </div>

      {/* Stats Cards */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        <div className="card">
          <div className="flex items-center">
            <div className="flex-shrink-0">
              <div className="w-8 h-8 bg-primary-100 rounded-full flex items-center justify-center">
                <svg className="w-5 h-5 text-primary-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
              </div>
            </div>
            <div className="ml-4">
              <p className="text-sm font-medium text-gray-500">Verification Attempts</p>
              <p className="text-2xl font-bold text-gray-900">{dashboardData?.verification.totalAttempts || 0}</p>
            </div>
          </div>
        </div>

        <div className="card">
          <div className="flex items-center">
            <div className="flex-shrink-0">
              <div className="w-8 h-8 bg-success-100 rounded-full flex items-center justify-center">
                <svg className="w-5 h-5 text-success-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M8 7V3a4 4 0 118 0v4m-4 8a2 2 0 11-4 0 2 2 0 014 0m0 0V9a2 2 0 012-2h4a2 2 0 012 2v2" />
                </svg>
              </div>
            </div>
            <div className="ml-4">
              <p className="text-sm font-medium text-gray-500">Account Age</p>
              <p className="text-2xl font-bold text-gray-900">{dashboardData?.stats.accountAge || 0} days</p>
            </div>
          </div>
        </div>

        <div className="card">
          <div className="flex items-center">
            <div className="flex-shrink-0">
              <div className="w-8 h-8 bg-warning-100 rounded-full flex items-center justify-center">
                <svg className="w-5 h-5 text-warning-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
              </div>
            </div>
            <div className="ml-4">
              <p className="text-sm font-medium text-gray-500">Last Login</p>
              <p className="text-sm font-bold text-gray-900">
                {new Date(dashboardData?.stats.lastLoginDate || Date.now()).toLocaleDateString()}
              </p>
            </div>
          </div>
        </div>
      </div>

      {/* Recent Activity */}
      {dashboardData?.verification.recentVerifications && dashboardData.verification.recentVerifications.length > 0 && (
        <div className="card">
          <div className="card-header">
            <h2 className="text-lg font-semibold text-gray-900">Recent Activity</h2>
          </div>
          <div className="space-y-3">
            {dashboardData.verification.recentVerifications.slice(0, 3).map((verification) => (
              <div key={verification.id} className="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                <div className="flex items-center space-x-3">
                  <div className="flex-shrink-0">
                    <div className="w-8 h-8 bg-primary-100 rounded-full flex items-center justify-center">
                      <svg className="w-4 h-4 text-primary-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                      </svg>
                    </div>
                  </div>
                  <div>
                    <p className="text-sm font-medium text-gray-900">
                      {verification.documentType} verification
                    </p>
                    <p className="text-xs text-gray-500">
                      {new Date(verification.createdAt).toLocaleDateString()}
                    </p>
                  </div>
                </div>
                <div className={`inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium status-${verification.status}`}>
                  {verification.status}
                </div>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* Help Section */}
      <div className="card">
        <div className="card-header">
          <h2 className="text-lg font-semibold text-gray-900">Need Help?</h2>
        </div>
        <div className="space-y-3">
          <p className="text-gray-600">
            If you're having trouble with the verification process, here are some helpful resources:
          </p>
          <ul className="list-disc list-inside text-sm text-gray-600 space-y-1">
            <li key="documents-clear">Make sure your documents are clear and well-lit</li>
            <li key="text-readable">Ensure all text is readable and not blurry</li>
            <li key="front-back">Upload both front and back of your ID document</li>
            <li key="selfie-verification">Include a selfie for identity verification</li>
          </ul>
        </div>
      </div>
    </div>
  );
};

export default Dashboard; 