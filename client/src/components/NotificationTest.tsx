import React from 'react';
import { notifications } from '../utils/notifications';

const NotificationTest: React.FC = () => {
  const testNotifications = () => {
    console.log('🧪 Testing notifications...');
    
    // Test success notification
    setTimeout(() => {
      console.log('🧪 Showing success notification');
      notifications.success('Test success message!');
    }, 500);
    
    // Test error notification
    setTimeout(() => {
      console.log('🧪 Showing error notification');
      notifications.error('Test error message!');
    }, 1000);
    
    // Test warning notification
    setTimeout(() => {
      console.log('🧪 Showing warning notification');
      notifications.warning('Test warning message!');
    }, 1500);
    
    // Test info notification
    setTimeout(() => {
      console.log('🧪 Showing info notification');
      notifications.info('Test info message!');
    }, 2000);
  };

  return (
    <div className="p-4 bg-white rounded-lg shadow">
      <h3 className="text-lg font-semibold mb-4">Notification System Test</h3>
      <button
        onClick={testNotifications}
        className="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700"
      >
        Test All Notifications
      </button>
      <p className="text-sm text-gray-600 mt-2">
        Click the button to test if notifications are working. Check the console for debug logs.
      </p>
    </div>
  );
};

export default NotificationTest; 