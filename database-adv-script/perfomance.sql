-- ==============================================
-- Task 4: Performance Optimization (Airbnb Database Module)
-- File: perfomance.sql
-- ==============================================

-- 1. Initial Query (Unoptimized)
-- Retrieve all bookings with user, property, and payment details
-- Includes WHERE and AND for filtering
SELECT 
    b.booking_id,
    u.user_id,
    u.username,
    u.email,
    p.property_id,
    p.title AS property_title,
    pay.payment_id,
    pay.amount,
    pay.status
FROM Bookings b
JOIN Users u ON b.user_id = u.user_id
JOIN Properties p ON b.property_id = p.property_id
JOIN Payments pay ON b.booking_id = pay.booking_id
WHERE pay.status = 'Completed'
  AND b.start_date IS NOT NULL;

-- ==============================================
-- 2. Performance Analysis
-- Run EXPLAIN ANALYZE to measure the cost of the query
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    u.user_id,
    u.username,
    u.email,
    p.property_id,
    p.title AS property_title,
    pay.payment_id,
    pay.amount,
    pay.status
FROM Bookings b
JOIN Users u ON b.user_id = u.user_id
JOIN Properties p ON b.property_id = p.property_id
JOIN Payments pay ON b.booking_id = pay.booking_id
WHERE pay.status = 'Completed'
  AND b.start_date IS NOT NULL;

-- ==============================================
-- 3. Refactored Query (Optimized)
-- Optimization strategies:
--   - Select only necessary columns
--   - Ensure indexes on foreign keys (user_id, property_id, booking_id)
--   - Avoid redundant joins

SELECT 
    b.booking_id,
    u.username,
    p.title AS property_title,
    pay.amount,
    pay.status
FROM Bookings b
JOIN Users u ON b.user_id = u.user_id
JOIN Properties p ON b.property_id = p.property_id
JOIN Payments pay ON b.booking_id = pay.booking_id
WHERE pay.status = 'Completed'
  AND b.start_date IS NOT NULL;

-- ==============================================
-- 4. Performance Analysis (Optimized)
-- Run EXPLAIN ANALYZE again to confirm performance improvement
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    u.username,
    p.title AS property_title,
    pay.amount,
    pay.status
FROM Bookings b
JOIN Users u ON b.user_id = u.user_id
JOIN Properties p ON b.property_id = p.property_id
JOIN Payments pay ON b.booking_id = pay.booking_id
WHERE pay.status = 'Completed'
  AND b.start_date IS NOT NULL;

-- ==============================================
-- END OF FILE
-- ==============================================
