export interface User {
  id: string;
  email: string;
  firstName: string;
  lastName: string;
  phoneNumber?: string;
  isVerified: boolean;
  verificationStatus: 'pending' | 'approved' | 'denied' | 'review' | 'failed';
  role: 'user' | 'admin';
  profile?: {
    dateOfBirth?: string;
    address?: string;
    profileImage?: string;
  };
  createdAt: string;
  updatedAt: string;
}

export interface AuthState {
  user: User | null;
  token: string | null;
  isLoading: boolean;
  isAuthenticated: boolean;
}

export interface LoginData {
  email: string;
  password: string;
}

export interface RegisterData {
  firstName: string;
  lastName: string;
  email: string;
  password: string;
  phoneNumber?: string;
}

export interface Verification {
  id: string;
  userId: string;
  transactionId?: string;
  customerReference: string;
  documentType: 'DriversLicense' | 'Passport' | 'NationalID' | 'StateID';
  status: 'pending' | 'approved' | 'denied' | 'review' | 'failed';
  confidence?: number;
  documents: {
    frontImage?: DocumentFile;
    backImage?: DocumentFile;
    portraitImage?: DocumentFile;
  };
  extractedData?: {
    firstName: string;
    lastName: string;
    dateOfBirth: string;
    documentNumber: string;
    expirationDate: string;
    address?: string;
    state?: string;
    country?: string;
  };
  biometric?: {
    faceMatch: boolean;
    confidence: number;
    livenessScore: number;
  };
  apiResponse?: {
    success: boolean;
    errors?: string[];
    warnings?: string[];
  };
  reviewNotes?: string;
  reviewedBy?: string;
  reviewedAt?: string;
  createdAt: string;
  updatedAt: string;
}

export interface DocumentFile {
  originalName: string;
  fileName: string;
  path: string;
  mimetype: string;
  size: number;
}

export interface VerificationUpload {
  documentType: 'DriversLicense' | 'Passport' | 'NationalID' | 'StateID';
  frontImage?: File;
  backImage?: File;
  portraitImage?: File;
}

export interface DashboardData {
  user: User;
  verification: {
    status: string;
    isVerified: boolean;
    latestVerification?: Verification;
    totalAttempts: number;
    recentVerifications: Verification[];
  };
  stats: {
    accountAge: number;
    totalVerifications: number;
    lastLoginDate: string;
  };
}

export interface ApiResponse<T = any> {
  message: string;
  data?: T;
  error?: string;
  success?: boolean;
}

export interface PaginatedResponse<T> {
  data: T[];
  pagination: {
    currentPage: number;
    totalPages: number;
    totalItems: number;
    hasNext: boolean;
    hasPrev: boolean;
  };
}

export interface AdminStats {
  totalUsers: number;
  verifiedUsers: number;
  verificationRate: string;
  statusBreakdown: {
    pending: number;
    approved: number;
    denied: number;
    review: number;
  };
  recentRegistrations: number;
}

export interface VerificationStats {
  verificationStats: Array<{
    _id: string;
    count: number;
  }>;
  totalUsers: number;
  verifiedUsers: number;
  verificationRate: string;
}

export interface NotificationState {
  notifications: Notification[];
}

export interface Notification {
  id: string;
  type: 'success' | 'error' | 'warning' | 'info';
  title: string;
  message: string;
  duration?: number;
  timestamp: number;
}

export interface FormField {
  name: string;
  type: 'text' | 'email' | 'password' | 'tel' | 'date' | 'file' | 'select';
  label: string;
  placeholder?: string;
  required?: boolean;
  options?: Array<{ value: string; label: string; }>;
  validation?: {
    minLength?: number;
    maxLength?: number;
    pattern?: RegExp;
  };
} 