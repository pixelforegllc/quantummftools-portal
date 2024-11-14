# QuantumMF Tools Portal

A comprehensive web application portal that automates daily tasks with file processing capabilities and API integrations. This internal tool suite provides various file manipulation utilities and automated workflows.

## Project Overview

### Core Features & Status

#### 1. File Converter ⏳ (In Progress)
- Convert between CSV and Excel formats
- Maintain conversion history
- Download converted files later
- Status: Basic structure complete, implementing file processing

#### 2. File Splitter 🔄 (Pending)
- Split large CSV/Excel files into smaller ones
- Pull files from Tool 1 or upload new ones
- Track split operations history
- Status: Not started

#### 3. File Merger 🔄 (Pending)
- Merge multiple files with matching headers
- Support CSV, Excel, or mixed formats
- Maintain merge history
- Status: Not started

#### 4. File Formatter and Exporter 🔄 (Pending)
- Multi-step data cleaning process
- Text to columns with semicolon delimiter
- Phone number formatting
- Duplicate removal
- Status: Not started

#### 5. Click-Based File Processor 🔄 (Pending)
- Process CSV files with specific columns
- Generate two output files with different formats
- Automatic file naming
- Status: Not started

#### 6. Automatic Conversion Puller 🔄 (Pending)
- Zoho Leads to Infobip contact sync
- Dynamic tag management
- Configurable sync schedules
- Status: Not started

#### 7. Inbound SMS Auto Scheduler 🔄 (Pending)
- Automated SMS sending via Infobip
- Dynamic message templates
- Configurable time windows
- Multi-day sequences
- Status: Not started

### Current Development Status

#### Completed ✅
1. Project Structure
   - Basic repository setup
   - Frontend and backend scaffolding
   - Development environment configuration

2. Backend Foundation
   - Express server setup
   - MongoDB connection
   - Basic authentication system
   - File upload handling
   - API route structure

3. Frontend Foundation
   - React with TypeScript setup
   - CoreUI integration
   - Basic routing
   - File converter component structure

#### In Progress ⏳
1. File Processing Service
   - File conversion implementation
   - Error handling
   - Progress tracking
   - History management

2. Authentication System
   - User registration/login
   - JWT implementation
   - Role-based access control

#### Pending 🔄
1. Remaining Tools Implementation
2. API Integrations (Zoho, Infobip)
3. Advanced Features
4. Testing Suite
5. Documentation
6. Deployment Configuration

## Technical Details

### Architecture

```
webapp-project/
├── backend/
│   ├── src/
│   │   ├── config/
│   │   │   └── config.js         // Configuration management
│   │   ├── controllers/
│   │   │   ├── authController.js // Authentication logic
│   │   │   └── fileController.js // File processing logic
│   │   ├── middleware/
│   │   │   └── auth.js          // JWT authentication
│   │   ├── models/
│   │   │   ├── User.js          // User data model
│   │   │   └── FileConversion.js // File conversion model
│   │   ├── routes/
│   │   │   ├── auth.js          // Auth routes
│   │   │   └── files.js         // File processing routes
│   │   └── index.js             // Main server file
│   └── package.json
├── frontend/
│   ├── src/
│   │   ├── components/
│   │   │   └── tools/           // Tool-specific components
│   │   ├── services/            // API integration services
│   │   ├── hooks/               // Custom React hooks
│   │   └── App.tsx              // Main React component
│   └── package.json
└── README.md
```

### Tech Stack

#### Backend
- Node.js with Express
- MongoDB for database
- JWT for authentication
- Multer for file uploads
- XLSX and CSV-Parser for file processing

#### Frontend
- React with TypeScript
- CoreUI for UI components
- React Router for navigation
- Axios for API calls
- Formik for form handling

### Server Configuration
- Network Name: webapp-vpc-prod
- IP Range: 10.124.32.0/20

#### Application Server
- Public IP: 164.92.79.175
- Private IP: 10.124.32.4
- Hostname: webapp-main-prod

#### Database Server
- Public IP: 144.126.213.183
- Private IP: 10.124.32.2
- Hostname: webapp-db-prod

## Setup Instructions

### Prerequisites
- Node.js (v14 or higher)
- MongoDB
- Git

### Installation Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/pixelforegllc/quantummftools-portal.git
   cd quantummftools-portal
   ```

2. Install dependencies:
   ```bash
   # Install root dependencies
   npm install

   # Install backend dependencies
   cd backend
   npm install

   # Install frontend dependencies
   cd ../frontend
   npm install
   ```

3. Configure environment variables:

   Backend (.env):
   ```
   PORT=5000
   MONGODB_URI=mongodb://localhost:27017/webapp
   JWT_SECRET=your-secret-key
   FRONTEND_URL=http://localhost:3000
   UPLOAD_PATH=uploads
   MAX_FILE_SIZE=10485760
   ```

   Frontend (.env):
   ```
   REACT_APP_API_URL=http://localhost:5000/api
   ```

4. Start the application:
   ```bash
   # Start backend
   cd backend
   npm start

   # In another terminal, start frontend
   cd frontend
   npm start
   ```

## API Documentation

### Authentication Endpoints
- POST /api/auth/register - Register new user
- POST /api/auth/login - User login
- GET /api/auth/profile - Get user profile
- PUT /api/auth/profile - Update user profile

### File Processing Endpoints
- POST /api/files/convert - Convert between CSV and Excel
- GET /api/files/history - Get conversion history
- GET /api/files/download/:id - Download converted file

## Next Steps

1. Complete File Processing Service
   - Implement remaining conversion logic
   - Add progress tracking
   - Setup file cleanup

2. Implement Remaining Tools
   - File Splitter
   - File Merger
   - File Formatter
   - Click Processor

3. Add API Integrations
   - Zoho API setup
   - Infobip API integration
   - Sync scheduler

4. Testing & Documentation
   - Unit tests
   - Integration tests
   - API documentation
   - User guide

5. Deployment
   - CI/CD setup
   - Production environment
   - Monitoring

## Contributing

1. Create a feature branch
2. Implement changes
3. Submit pull request
4. Code review
5. Merge to main

## License

This project is proprietary and confidential. All rights reserved.

---
Last Updated: November 14, 2024
Current Version: 0.1.0
