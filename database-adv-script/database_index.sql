-- ==============================================
-- Task 3: Indexes for Optimization (Airbnb Database Module)
-- File: database_index.sql
-- ==============================================

-- 1. Create indexes on high-usage columns
-- Users table: username and email are often used for lookups
CREATE INDEX idx_users_username ON Users(username);
CREATE INDEX idx_users_email ON Users(email);

-- Bookings table: user_id and property_id are often used in joins
CREATE INDEX idx_bookings_user_id ON Bookings(user_id);
CREATE INDEX idx_bookings_property_id ON Bookings(property_id);
CREATE INDEX idx_bookings_start_date ON Bookings(start_date);

-- Properties table: location and title are often used for searches
CREATE INDEX idx_properties_location ON Properties(location);
CREATE INDEX idx_properties_title ON Properties(title);

-- ==============================================
-- 2. Performance Measurement using EXPLAIN ANALYZE
-- Before and after running CREATE INDEX, compare execution plans.

-- Example: Query to fetch all bookings by a specific user
EXPLAIN ANALYZE
SELECT *
FROM Bookings b
JOIN Users u ON b.user_id = u.user_id
WHERE u.username = 'john_doe';

-- Example: Query to fetch properties by location
EXPLAIN ANALYZE
SELECT *
FROM Properties
WHERE location = 'New York';

-- Example: Query to fetch all bookings for a property
EXPLAIN ANALYZE
SELECT *
FROM Bookings b
JOIN Properties p ON b.property_id = p.property_id
WHERE p.title = 'Cozy Apartment';

-- ==============================================
-- END OF FILE
-- ==============================================
