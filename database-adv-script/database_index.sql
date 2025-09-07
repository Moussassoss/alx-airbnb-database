-- ==============================================
-- Task 3: Implement Indexes for Optimization
-- File: database_index.sql
-- ==============================================

-- 1. User Table
-- Index on email for fast lookups (login, uniqueness checks)
CREATE INDEX idx_users_email ON Users(email);

-- Index on role to speed up queries filtering by role
CREATE INDEX idx_users_role ON Users(role);

-- ==============================================

-- 2. Property Table
-- Index on host_id for frequent joins with Users
CREATE INDEX idx_properties_host_id ON Properties(host_id);

-- Index on location for search queries
CREATE INDEX idx_properties_location ON Properties(location);

-- Index on pricepernight for sorting/filtering by price
CREATE INDEX idx_properties_price ON Properties(pricepernight);

-- ==============================================

-- 3. Booking Table
-- Index on user_id for joins and user’s booking history
CREATE INDEX idx_bookings_user_id ON Bookings(user_id);

-- Index on property_id for joins with Properties
CREATE INDEX idx_bookings_property_id ON Bookings(property_id);

-- Index on start_date for date range searches
CREATE INDEX idx_bookings_start_date ON Bookings(start_date);

-- Index on status for filtering (pending, confirmed, canceled)
CREATE INDEX idx_bookings_status ON Bookings(status);

-- ==============================================
-- END OF FILE
-- ==============================================
