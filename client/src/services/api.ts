import axios, { AxiosInstance, AxiosResponse } from 'axios';
import { 
  User, 
  LoginData, 
  RegisterData, 
  DashboardData, 
  Verification, 
  VerificationUpload,
  AdminStats,
  VerificationStats
} from '../types';


class ApiService {
  private api: AxiosInstance;

  constructor() {
    this.api = axios.create({
      baseURL: process.env.REACT_APP_API_URL || '/api',
      timeout: 30000,
      headers: {
        'Content-Type': 'application/json',
      },
    });

    // Request interceptor to add auth token
    this.api.interceptors.request.use(
      (config) => {
        const token = localStorage.getItem('token');
        if (token) {
          config.headers.Authorization = `Bearer ${token}`;
        }
        return config;
      },
      (error) => {
        return Promise.reject(error);
      }
    );

    // Response interceptor to handle errors
    this.api.interceptors.response.use(
      (response) => response,
      (error) => {
        if (error.response?.status === 401) {
          // Token expired or invalid
          localStorage.removeItem('token');
          localStorage.removeItem('user');
          window.location.href = '/login';
        }
        return Promise.reject(error);
      }
    );
  }

  // Auth API calls
  async login(credentials: LoginData): Promise<{ user: User; token: string; message: string }> {
    console.log('🌐 API Service: Sending login request', { 
      ...credentials, 
      password: '[HIDDEN]' 
    });
    
    try {
      const response = await this.api.post('/auth/login', credentials);
      console.log('✅ API Service: Login successful', {
        status: response.status,
        user: response.data.user
      });
      return response.data;
    } catch (error: any) {
      console.error('💥 API Service: Login failed', {
        status: error.response?.status,
        data: error.response?.data,
        message: error.message
      });
      throw error;
    }
  }

  async register(userData: RegisterData): Promise<{ user: User; token: string; message: string }> {
    console.log('🌐 API Service: Sending registration request', { 
      ...userData, 
      password: '[HIDDEN]' 
    });
    
    try {
      const response = await this.api.post('/auth/register', userData);
      console.log('✅ API Service: Registration successful', {
        status: response.status,
        user: response.data.user
      });
      return response.data;
    } catch (error: any) {
      console.error('💥 API Service: Registration failed', {
        status: error.response?.status,
        data: error.response?.data,
        message: error.message
      });
      throw error;
    }
  }

  async getCurrentUser(): Promise<User> {
    const response = await this.api.get('/auth/me');
    return response.data;
  }

  async updateProfile(profileData: Partial<User>): Promise<{ user: User; message: string }> {
    const response = await this.api.put('/auth/profile', profileData);
    return response.data;
  }

  // User API calls
  async getDashboardData(): Promise<DashboardData> {
    const response = await this.api.get('/users/dashboard');
    return response.data;
  }

  async getUserProfile(): Promise<User> {
    const response = await this.api.get('/users/profile');
    return response.data;
  }

  async updateUserProfile(profileData: Partial<User>): Promise<{ user: User; message: string }> {
    const response = await this.api.put('/users/profile', profileData);
    return response.data;
  }

  // Verification API calls
  async getCurrentVerification(): Promise<{ verification: Verification | null }> {
    console.log('🔍 Fetching current verification data...');
    try {
      const response = await this.api.get('/verification/current');
      console.log('✅ Current verification data fetched:', {
        hasVerification: !!response.data.verification,
        status: response.data.verification?.status
      });
      return response.data;
    } catch (error: any) {
      console.error('💥 Error fetching verification data:', error);
      throw error;
    }
  }

  async uploadVerification(verificationData: VerificationUpload): Promise<{ verification: Verification; message: string }> {
    const formData = new FormData();
    formData.append('documentType', verificationData.documentType);
    
    if (verificationData.frontImage) {
      formData.append('frontImage', verificationData.frontImage);
    }
    if (verificationData.backImage) {
      formData.append('backImage', verificationData.backImage);
    }
    if (verificationData.portraitImage) {
      formData.append('portraitImage', verificationData.portraitImage);
    }

    const response = await this.api.post('/verification/upload', formData, {
      headers: {
        'Content-Type': 'multipart/form-data',
      },
    });
    return response.data;
  }

  async getVerificationStatus(): Promise<{ verifications: Verification[]; currentStatus: string; isVerified: boolean }> {
    const response = await this.api.get('/verification/status');
    return response.data;
  }

  async getVerificationDetails(id: string): Promise<Verification> {
    const response = await this.api.get(`/verification/${id}`);
    return response.data;
  }

  // Admin API calls
  async getAdminStats(): Promise<AdminStats> {
    const response = await this.api.get('/users/admin/stats');
    return response.data;
  }

  async getVerificationStats(): Promise<VerificationStats> {
    const response = await this.api.get('/verification/admin/stats');
    return response.data;
  }

  async getAllUsers(page: number = 1, limit: number = 10): Promise<{ users: User[]; pagination: any }> {
    const response = await this.api.get(`/users/admin/all?page=${page}&limit=${limit}`);
    return response.data;
  }

  async getUserDetails(id: string): Promise<{ user: User; verifications: Verification[] }> {
    const response = await this.api.get(`/users/admin/${id}`);
    return response.data;
  }

  async updateUserStatus(id: string, statusData: { verificationStatus?: string; isVerified?: boolean; role?: string }): Promise<{ user: User; message: string }> {
    const response = await this.api.put(`/users/admin/${id}/status`, statusData);
    return response.data;
  }

  async deleteUser(id: string): Promise<{ message: string }> {
    const response = await this.api.delete(`/users/admin/${id}`);
    return response.data;
  }

  async getPendingVerifications(): Promise<Verification[]> {
    const response = await this.api.get('/verification/admin/pending');
    return response.data;
  }

  async reviewVerification(id: string, reviewData: { status: string; reviewNotes?: string }): Promise<{ verification: Verification; message: string }> {
    const response = await this.api.put(`/verification/admin/${id}/review`, reviewData);
    return response.data;
  }

  // Generic API call method
  async makeRequest<T>(
    method: 'get' | 'post' | 'put' | 'delete',
    url: string,
    data?: any,
    config?: any
  ): Promise<T> {
    const response: AxiosResponse<T> = await this.api[method](url, data, config);
    return response.data;
  }
}

const apiService = new ApiService();
export default apiService; 