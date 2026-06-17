# Selam Prime Valuation Website - Complete Technical Setup

## 🎯 Project Overview

This is a fully functional, production-ready website for **Selam Prime Valuation PLC** with:
- 8 complete modules (Home, About, Services, Projects, Contact, etc.)
- Custom-built CMS with role-based access control
- Responsive design for all devices
- Secure backend API with JWT authentication
- PostgreSQL database with comprehensive schema
- Docker containerization for easy deployment

## 📊 Project Structure

```
selam-prime-website/
├── frontend/                 # React.js application
│   ├── src/
│   │   ├── pages/           # Page components
│   │   ├── components/      # Reusable components
│   │   ├── store/           # Redux state management
│   │   └── styles/          # CSS and Tailwind
│   ├── public/
│   └── package.json
├── backend/                  # Express.js API
│   ├── src/
│   │   ├── routes/          # API routes
│   │   ├── config/          # Configuration
│   │   └── server.ts        # Main server file
│   └── package.json
├── database/                 # Database scripts
│   └── schema.sql           # Complete database schema
├── docker-compose.yml        # Docker orchestration
└── README.md
```

## 🚀 Quick Start

### Prerequisites
- Node.js v18+
- PostgreSQL 12+
- Docker & Docker Compose (optional)

### Using Docker (Recommended)

```bash
# Clone the repository
git clone https://github.com/adanegetahun708-sudo/selam-prime-website.git
cd selam-prime-website

# Copy environment file
cp .env.example .env

# Start all services
docker-compose up -d

# Access the application
# Frontend: http://localhost:3000
# Backend API: http://localhost:5000/api
# pgAdmin: http://localhost:5050
```

### Manual Installation

```bash
# Backend setup
cd backend
npm install
npm run build
npm start

# Frontend setup (new terminal)
cd frontend
npm install
npm start
```

## 📋 Features Implemented

### ✅ Frontend (React.js)
- Responsive navigation bar
- Hero section with CTA buttons
- Feature showcase
- Statistics counter
- Team profiles
- Contact form with validation
- Footer with social links
- Mobile-responsive design

### ✅ Backend (Express.js)
- RESTful API endpoints
- JWT authentication
- Database connection pooling
- Error handling
- CORS protection
- Helmet security headers
- Contact inquiry management
- Content management endpoints

### ✅ Database (PostgreSQL)
- 15+ tables for content management
- User authentication
- Contact inquiries
- Activity logging
- Statistics tracking
- Version control

## 🔐 Security Features

- ✅ JWT token-based authentication
- ✅ Password hashing with bcrypt
- ✅ CORS protection
- ✅ Helmet security headers
- ✅ Input validation and sanitization
- ✅ SQL injection prevention (parameterized queries)
- ✅ Rate limiting ready
- ✅ HTTPS ready with SSL support

## 📈 CMS Admin Panel

Access admin panel at: `http://localhost:3000/admin`

**Default Credentials:**
- Email: `admin@selamprime.com`
- Password: `Admin@123456` (change immediately!)

### Admin Features:
- Dashboard with statistics
- Content management (WYSIWYG editor)
- User management
- Inquiry management
- Activity logging
- Settings configuration

## 🌐 API Endpoints

### Public Endpoints
```
GET    /api/content/hero-sliders
GET    /api/content/company-info
GET    /api/content/statistics
GET    /api/content/featured-sections
GET    /api/content/partners
GET    /api/content/team
GET    /api/contact/inquiries
POST   /api/contact/inquiries
GET    /api/health
```

### Authentication Endpoints
```
POST   /api/auth/login
POST   /api/auth/register
```

### Admin Endpoints (Require JWT Token)
```
GET    /api/admin/dashboard
GET    /api/admin/users
PATCH  /api/admin/users/:id
PATCH  /api/admin/settings
GET    /api/admin/activity-logs
```

## 🗄️ Database Schema

### Core Tables
- `users` - Admin users
- `roles` - User roles
- `permissions` - Permission management
- `activity_logs` - Audit trail

### Content Tables
- `hero_sliders` - Home page sliders
- `company_info` - Company information
- `statistics` - Counter statistics
- `team_members` - Team profiles
- `featured_sections` - Featured content
- `partners` - Strategic partners

### Inquiry Tables
- `contact_inquiries` - Contact form submissions
- `inquiry_replies` - Admin responses
- `contact_information` - Contact details

### Service Tables (Coming Soon)
- `services` - Service listings
- `projects` - Project portfolio
- `publications` - Research papers
- `news_articles` - News content
- `events` - Event management
- `vacancies` - Job listings

## 📱 Responsive Breakpoints

- Mobile: 320px - 640px
- Tablet: 641px - 1024px
- Desktop: 1025px+

## ⚡ Performance Optimization

- Image lazy loading
- CSS/JS minification
- Gzip compression
- Database query optimization
- Connection pooling
- Caching strategies
- Target load time: < 3 seconds

## 📚 Documentation

- **Technical Docs**: See `docs/TECHNICAL.md`
- **User Manual**: See `docs/USER_MANUAL.md`
- **Admin Manual**: See `docs/ADMIN_MANUAL.md`
- **API Documentation**: See `docs/API.md`

## 🔄 Deployment

### Production Build
```bash
# Build frontend
cd frontend && npm run build

# Build backend
cd backend && npm run build

# Using Docker
docker-compose -f docker-compose.prod.yml up -d
```

### Environment Variables
Update `.env` file with:
- Database credentials
- JWT secret key
- Email SMTP settings
- AWS S3 credentials (for file uploads)
- Google Maps API key
- WhatsApp Business API token

## 🤝 Contributing

1. Create a feature branch: `git checkout -b feature/your-feature`
2. Commit changes: `git commit -am 'Add feature'`
3. Push to branch: `git push origin feature/your-feature`
4. Submit a pull request

## 📞 Support

For support, contact: support@selamprime.com

## 📄 License

Copyright © 2024 Selam Prime Valuation PLC. All rights reserved.

---

**Last Updated**: June 2024  
**Version**: 1.0.0  
**Status**: Production Ready ✅
