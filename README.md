# Selam Prime Valuation PLC - Website

A fully functional, dynamic website for Selam Prime Valuation PLC with a comprehensive CMS administration panel.

## 🎯 Project Overview

This project delivers a professional website with:
- **8 Main Modules**: Home, About Us, Services, Projects, Research, Partnership, Latest, Contact Us
- **Custom CMS**: Role-based content management
- **Responsive Design**: Works on all devices
- **SEO Optimized**: Meta tags, sitemap, structured data
- **Security**: SSL, encryption, SQL injection/XSS protection
- **Performance**: < 3 second load time

## 📚 Tech Stack

**Frontend:**
- React.js v18 with TypeScript
- Tailwind CSS for responsive design
- Redux Toolkit for state management
- Axios for API calls

**Backend:**
- Node.js with Express.js
- PostgreSQL database
- JWT authentication
- Multer for file uploads

**DevOps:**
- Docker & Docker Compose
- GitHub Actions CI/CD
- Nginx reverse proxy

## 📁 Project Structure

```
selam-prime-website/
├── frontend/                 # React frontend application
│   ├── public/
│   ├── src/
│   │   ├── components/
│   │   ├── pages/
│   │   ├── store/
│   │   ├── services/
│   │   └── styles/
│   ├── package.json
│   └── Dockerfile
├── backend/                  # Express.js API server
│   ├── src/
│   │   ├── routes/
│   │   ├── controllers/
│   │   ├── models/
│   │   ├── middleware/
│   │   ├── utils/
│   │   └── config/
│   ├── migrations/
│   ├── package.json
│   └── Dockerfile
├── database/                 # Database schemas
│   ├── migrations/
│   ├── seeds/
│   └── schema.sql
├── docs/                     # Documentation
│   ├── TECHNICAL.md
│   ├── USER_MANUAL.md
│   └── ADMIN_MANUAL.md
├── docker-compose.yml
├── .env.example
└── package.json
```

## 🚀 Quick Start

### Prerequisites
- Node.js v16+
- PostgreSQL 12+
- Docker & Docker Compose (optional)

### Option 1: Using Docker (Recommended)

```bash
# Clone repository
git clone https://github.com/adanegetahun708-sudo/selam-prime-website.git
cd selam-prime-website

# Copy environment variables
cp .env.example .env

# Start all services
docker-compose up -d

# Access:
# Frontend: http://localhost:3000
# Backend API: http://localhost:5000/api
# Admin Panel: http://localhost:3000/admin
```

### Option 2: Manual Installation

```bash
# Backend setup
cd backend
npm install
cp .env.example .env
npm run migrate
npm run dev

# Frontend setup (new terminal)
cd frontend
npm install
npm start
```

## ✨ Features

### Module 1: Home
- Hero banner slider with CMS management
- Corporate motto and welcome message
- Company overview section
- "Why Choose Selam Prime" features
- Live statistics counter
- Featured sections with images
- Quick contact information
- Call-to-action buttons
- Strategic partner showcase

### Module 2: About Us
- Complete history timeline
- Vision and mission statements
- Core values display
- Corporate identity information
- Dynamic organizational structure
- Leadership profiles with images
- Downloadable company profile

### Module 3: Services (Coming Soon)
- Services landing page with coming soon design
- 8 service categories placeholder
- Future service detail pages
- Inquiry button integration

### Module 4: Projects (Coming Soon)
- Project showcase landing page
- Project category structure
- Project gallery placeholder
- Future project detail pages

### Module 5: Research (Coming Soon)
- Publication repository
- Community engagement content
- Document download center
- Future research detail pages

### Module 6: Partnership (Coming Soon)
- Strategic partnerships showcase
- Partner logo display
- Future partnership detail pages
- Investment relations content

### Module 7: Latest (Coming Soon)
- News management system placeholder
- Events calendar placeholder
- Announcements section
- Bid information display
- Job vacancy listings

### Module 8: Contact Us
- Contact form with validation
- Location map integration (Google Maps)
- Social media links
- WhatsApp integration
- Online application form
- Email notifications on inquiry

## 🛡️ CMS Admin Dashboard

### Dashboard
- Real-time visitor statistics
- Inquiry count and notifications
- System status indicators
- Quick navigation shortcuts

### Content Management
- WYSIWYG editor for all pages
- Image upload and crop functionality
- Content preview before publishing
- Version history and rollback

### User Management
- Add/edit/delete admin users
- Role-based permissions (Admin, Editor, Viewer)
- Password reset functionality
- User activity logs

### Media Management
- Bulk image/document upload
- File type and size validation
- Folder organization
- Image compression and optimization

### Inquiry Management
- View and reply to contact inquiries
- Mark as read/resolved
- Export inquiry data
- Email notification triggers

### Settings
- Site title and description
- SEO metadata management
- Social media URL configuration
- Contact information updates
- Email notification settings

## 🔒 Security Features

✅ Secure admin login with JWT tokens
✅ Role-based access control (RBAC)
✅ Password encryption (bcrypt)
✅ SQL injection protection (parameterized queries)
✅ XSS protection (input sanitization)
✅ CSRF token protection
✅ Secure file uploads with validation
✅ Rate limiting on API endpoints
✅ CORS configuration
✅ SSL/TLS encryption
✅ Automated daily backups
✅ Activity logging for all admin actions

## ⚡ Performance Optimizations

✅ Responsive design (mobile, tablet, desktop)
✅ Image lazy loading
✅ CSS and JavaScript minification
✅ Gzip compression
✅ Caching strategies (browser and server)
✅ CDN-ready asset delivery
✅ Database query optimization
✅ Image compression and resizing
✅ Target load time: < 3 seconds
✅ Lighthouse score optimization

## 📊 SEO & Analytics

✅ Meta tag management
✅ Dynamic sitemap generation
✅ Structured data (schema.org)
✅ Google Analytics integration
✅ Open Graph tags
✅ Twitter Card tags
✅ Mobile-friendly validation
✅ Canonical URL handling

## 📖 Documentation

- **TECHNICAL.md** - Architecture, database schema, API endpoints
- **USER_MANUAL.md** - End-user guide for website features
- **ADMIN_MANUAL.md** - CMS admin guide with screenshots

## 🚢 Deployment

### Production Deployment (AWS/DigitalOcean)

```bash
# Build production images
docker-compose -f docker-compose.prod.yml build

# Deploy to server
docker-compose -f docker-compose.prod.yml up -d
```

### SSL Certificate Setup

```bash
# Using Let's Encrypt
certbot certonly --standalone -d yourdomain.com
```

## 📞 Support & Maintenance

- Automated backups: Daily at 2 AM
- Backup retention: 30 days
- Performance monitoring: Real-time alerts
- Security updates: Automatic patching

## 📄 License

Copyright © 2024 Selam Prime Valuation PLC. All rights reserved.

## 👥 Team

Developed by: Development Team
Client: Selam Prime Valuation PLC

---

**Last Updated**: June 2024
**Version**: 1.0.0
