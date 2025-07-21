import React from 'react';
import { notifications, handleAsyncWithToast } from '../../utils/notifications';
import NotificationTest from '../../components/NotificationTest';

const AdminUsers: React.FC = () => {
  // Demo function to show async operation with toast
  const handleDemoAsyncOperation = async () => {
    await handleAsyncWithToast(
      async () => {
        // Simulate an async operation
        await new Promise(resolve => setTimeout(resolve, 2000));
        return { success: true };
      },
      {
        loading: 'Processing user update...',
        success: 'User updated successfully!',
        error: 'Failed to update user'
      }
    );
  };

  return (
    <div className="space-y-6">
      <div className="card">
        <div className="card-header">
          <h1 className="text-2xl font-bold text-gray-900">User Management</h1>
          <p className="text-gray-600">Manage all users in the system</p>
        </div>
        
        <div className="p-6">
          <div className="space-y-4">
            <p className="text-gray-500 mb-6">Admin user management interface coming soon...</p>
            
            {/* Notification Test Component */}
            <div className="border-t pt-6 mb-6">
              <NotificationTest />
            </div>
            
            {/* Notification Demo Section */}
            <div className="border-t pt-6">
              <h3 className="text-lg font-medium text-gray-900 mb-4">Notification System Demo</h3>
              <div className="grid grid-cols-2 gap-4 mb-4">
                <button
                  onClick={() => notifications.success('User approved successfully!')}
                  className="px-4 py-2 bg-green-600 text-white rounded-md hover:bg-green-700"
                >
                  Success Notification
                </button>
                
                <button
                  onClick={() => notifications.error('Failed to delete user')}
                  className="px-4 py-2 bg-red-600 text-white rounded-md hover:bg-red-700"
                >
                  Error Notification
                </button>
                
                <button
                  onClick={() => notifications.warning('User verification pending')}
                  className="px-4 py-2 bg-yellow-600 text-white rounded-md hover:bg-yellow-700"
                >
                  Warning Notification
                </button>
                
                <button
                  onClick={() => notifications.info('New user registration received')}
                  className="px-4 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700"
                >
                  Info Notification
                </button>
              </div>
              
              <button
                onClick={handleDemoAsyncOperation}
                className="w-full px-4 py-2 bg-indigo-600 text-white rounded-md hover:bg-indigo-700"
              >
                Demo Async Operation (with loading toast)
              </button>
              
              <p className="text-xs text-gray-500 mt-2">
                These buttons demonstrate the notification system in action. 
                The notifications will appear in the top-right corner.
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default AdminUsers; 