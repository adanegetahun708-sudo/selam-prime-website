-- =============================================
-- SELAM PRIME VALUATION - DATABASE SCHEMA
-- =============================================

-- =============================================
-- 1. USERS & AUTHENTICATION
-- =============================================
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    role VARCHAR(50) DEFAULT 'viewer',
    is_active BOOLEAN DEFAULT true,
    last_login TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_role ON users(role);

-- =============================================
-- 2. ROLES & PERMISSIONS
-- =============================================
CREATE TABLE roles (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE permissions (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    module VARCHAR(50),
    action VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE role_permissions (
    id SERIAL PRIMARY KEY,
    role_id INTEGER REFERENCES roles(id) ON DELETE CASCADE,
    permission_id INTEGER REFERENCES permissions(id) ON DELETE CASCADE,
    UNIQUE(role_id, permission_id)
);

-- =============================================
-- 3. ACTIVITY LOGS
-- =============================================
CREATE TABLE activity_logs (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    action VARCHAR(255),
    module VARCHAR(100),
    description TEXT,
    ip_address VARCHAR(45),
    user_agent TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_activity_logs_user_id ON activity_logs(user_id);
CREATE INDEX idx_activity_logs_created_at ON activity_logs(created_at);

-- =============================================
-- 4. HOME MODULE
-- =============================================
CREATE TABLE hero_sliders (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    subtitle VARCHAR(255),
    description TEXT,
    image_url VARCHAR(500),
    button_text VARCHAR(100),
    button_link VARCHAR(500),
    order_index INTEGER,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE company_info (
    id SERIAL PRIMARY KEY,
    motto VARCHAR(255),
    welcome_title VARCHAR(255),
    welcome_message TEXT,
    overview TEXT,
    why_choose_us TEXT,
    featured_image VARCHAR(500),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE statistics (
    id SERIAL PRIMARY KEY,
    label VARCHAR(100),
    value INTEGER,
    icon_url VARCHAR(500),
    description TEXT,
    order_index INTEGER,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE featured_sections (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    description TEXT,
    image_url VARCHAR(500),
    icon_url VARCHAR(500),
    order_index INTEGER,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE partners (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    logo_url VARCHAR(500),
    website_url VARCHAR(500),
    description TEXT,
    order_index INTEGER,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- 5. ABOUT US MODULE
-- =============================================
CREATE TABLE company_profile (
    id SERIAL PRIMARY KEY,
    history TEXT,
    vision TEXT,
    mission TEXT,
    values TEXT,
    corporate_identity TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE team_members (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    position VARCHAR(150),
    department VARCHAR(100),
    email VARCHAR(255),
    phone VARCHAR(20),
    photo_url VARCHAR(500),
    bio TEXT,
    order_index INTEGER,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_team_members_department ON team_members(department);

CREATE TABLE organizational_structure (
    id SERIAL PRIMARY KEY,
    department_name VARCHAR(150),
    description TEXT,
    head_person_id INTEGER REFERENCES team_members(id),
    order_index INTEGER,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- 6. SERVICES MODULE (COMING SOON)
-- =============================================
CREATE TABLE services (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    slug VARCHAR(255) UNIQUE,
    description TEXT,
    detailed_description TEXT,
    icon_url VARCHAR(500),
    image_url VARCHAR(500),
    is_published BOOLEAN DEFAULT false,
    order_index INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE service_features (
    id SERIAL PRIMARY KEY,
    service_id INTEGER REFERENCES services(id) ON DELETE CASCADE,
    feature_title VARCHAR(255),
    feature_description TEXT,
    order_index INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- 7. PROJECTS MODULE (COMING SOON)
-- =============================================
CREATE TABLE projects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    slug VARCHAR(255) UNIQUE,
    description TEXT,
    detailed_description TEXT,
    client_name VARCHAR(255),
    category VARCHAR(100),
    status VARCHAR(50),
    start_date DATE,
    end_date DATE,
    featured_image VARCHAR(500),
    is_published BOOLEAN DEFAULT false,
    order_index INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE project_images (
    id SERIAL PRIMARY KEY,
    project_id INTEGER REFERENCES projects(id) ON DELETE CASCADE,
    image_url VARCHAR(500),
    order_index INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- 8. RESEARCH MODULE (COMING SOON)
-- =============================================
CREATE TABLE publications (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    slug VARCHAR(255) UNIQUE,
    description TEXT,
    author VARCHAR(255),
    publication_date DATE,
    file_url VARCHAR(500),
    category VARCHAR(100),
    is_published BOOLEAN DEFAULT false,
    order_index INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE research_categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    slug VARCHAR(100) UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- 9. PARTNERSHIP MODULE (COMING SOON)
-- =============================================
CREATE TABLE partnerships (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    slug VARCHAR(255) UNIQUE,
    description TEXT,
    logo_url VARCHAR(500),
    website_url VARCHAR(500),
    partnership_type VARCHAR(100),
    is_published BOOLEAN DEFAULT false,
    order_index INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE investment_reports (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    description TEXT,
    file_url VARCHAR(500),
    publication_date DATE,
    is_published BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- 10. LATEST MODULE (COMING SOON)
-- =============================================
CREATE TABLE news_articles (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    slug VARCHAR(255) UNIQUE,
    description TEXT,
    content TEXT,
    featured_image VARCHAR(500),
    author_id INTEGER REFERENCES users(id),
    category VARCHAR(100),
    is_published BOOLEAN DEFAULT false,
    published_date TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    description TEXT,
    location VARCHAR(255),
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    image_url VARCHAR(500),
    is_published BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE announcements (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    content TEXT,
    priority VARCHAR(50),
    is_published BOOLEAN DEFAULT false,
    published_date TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE bids (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    description TEXT,
    bid_documents_url VARCHAR(500),
    submission_deadline DATE,
    bid_category VARCHAR(100),
    is_published BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE vacancies (
    id SERIAL PRIMARY KEY,
    job_title VARCHAR(255),
    job_description TEXT,
    requirements TEXT,
    salary_range VARCHAR(100),
    job_location VARCHAR(255),
    employment_type VARCHAR(50),
    deadline DATE,
    is_published BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- 11. CONTACT US MODULE
-- =============================================
CREATE TABLE contact_information (
    id SERIAL PRIMARY KEY,
    address TEXT,
    phone VARCHAR(20),
    email VARCHAR(255),
    whatsapp_number VARCHAR(20),
    website_url VARCHAR(500),
    office_hours TEXT,
    latitude DECIMAL(10, 8),
    longitude DECIMAL(11, 8),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE contact_inquiries (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255),
    phone VARCHAR(20),
    subject VARCHAR(255),
    message TEXT,
    inquiry_type VARCHAR(100),
    status VARCHAR(50) DEFAULT 'new',
    ip_address VARCHAR(45),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_contact_inquiries_status ON contact_inquiries(status);
CREATE INDEX idx_contact_inquiries_email ON contact_inquiries(email);

CREATE TABLE inquiry_replies (
    id SERIAL PRIMARY KEY,
    inquiry_id INTEGER REFERENCES contact_inquiries(id) ON DELETE CASCADE,
    user_id INTEGER REFERENCES users(id),
    reply_message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE application_forms (
    id SERIAL PRIMARY KEY,
    vacancy_id INTEGER REFERENCES vacancies(id),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255),
    phone VARCHAR(20),
    cv_file_url VARCHAR(500),
    cover_letter TEXT,
    status VARCHAR(50) DEFAULT 'submitted',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- 12. MEDIA & FILE MANAGEMENT
-- =============================================
CREATE TABLE media_files (
    id SERIAL PRIMARY KEY,
    file_name VARCHAR(255),
    file_path VARCHAR(500),
    file_type VARCHAR(50),
    file_size BIGINT,
    upload_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    uploaded_by INTEGER REFERENCES users(id),
    category VARCHAR(100),
    description TEXT,
    is_public BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_media_files_category ON media_files(category);
CREATE INDEX idx_media_files_uploaded_by ON media_files(uploaded_by);

-- =============================================
-- 13. WEBSITE SETTINGS
-- =============================================
CREATE TABLE website_settings (
    id SERIAL PRIMARY KEY,
    setting_key VARCHAR(100) UNIQUE,
    setting_value TEXT,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE social_media_links (
    id SERIAL PRIMARY KEY,
    platform VARCHAR(50),
    url VARCHAR(500),
    icon_class VARCHAR(100),
    order_index INTEGER,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- 14. ANALYTICS & TRACKING
-- =============================================
CREATE TABLE page_visits (
    id SERIAL PRIMARY KEY,
    page_url VARCHAR(500),
    visitor_ip VARCHAR(45),
    user_agent TEXT,
    referrer VARCHAR(500),
    visited_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_page_visits_visited_at ON page_visits(visited_at);

CREATE TABLE form_submissions (
    id SERIAL PRIMARY KEY,
    form_type VARCHAR(100),
    submission_data JSON,
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- 15. INSERT DEFAULT DATA
-- =============================================

-- Insert default roles
INSERT INTO roles (name, description) VALUES
('admin', 'Full system access'),
('editor', 'Content creation and editing'),
('viewer', 'Read-only access');

-- Insert default permissions
INSERT INTO permissions (name, description, module, action) VALUES
('view_dashboard', 'View admin dashboard', 'dashboard', 'view'),
('manage_content', 'Create/edit/delete content', 'content', 'manage'),
('manage_users', 'Create/edit/delete users', 'users', 'manage'),
('manage_media', 'Upload and manage media files', 'media', 'manage'),
('manage_inquiries', 'View and respond to inquiries', 'inquiries', 'manage'),
('manage_settings', 'Update website settings', 'settings', 'manage'),
('view_reports', 'View analytics and reports', 'reports', 'view');

-- Insert default website settings
INSERT INTO website_settings (setting_key, setting_value, description) VALUES
('site_name', 'Selam Prime Valuation', 'Website name'),
('site_description', 'Professional Valuation and Consulting Services', 'Website description'),
('site_email', 'info@selamprime.com', 'Official email'),
('site_phone', '+251911223344', 'Contact phone'),
('currency', 'ETB', 'Default currency'),
('timezone', 'Africa/Addis_Ababa', 'Server timezone'),
('maintenance_mode', 'false', 'Enable/disable maintenance mode');

-- Insert default contact information
INSERT INTO contact_information (address, phone, email) VALUES
('Addis Ababa, Ethiopia', '+251911223344', 'info@selamprime.com');

CREATE TABLE notification_settings (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    notify_inquiries BOOLEAN DEFAULT true,
    notify_comments BOOLEAN DEFAULT true,
    notify_new_content BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =============================================
-- 16. VERSION CONTROL & BACKUPS
-- =============================================
CREATE TABLE content_versions (
    id SERIAL PRIMARY KEY,
    content_type VARCHAR(100),
    content_id INTEGER,
    version_number INTEGER,
    content_data JSON,
    created_by INTEGER REFERENCES users(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE backup_logs (
    id SERIAL PRIMARY KEY,
    backup_file VARCHAR(500),
    backup_size BIGINT,
    backup_status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
