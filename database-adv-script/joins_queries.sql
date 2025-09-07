-- ==============================================
-- Task 0: Joins (Airbnb Database Module)
-- File: joins_queries.sql
-- ==============================================

-- 1. INNER JOIN
-- Retrieve all bookings and the respective users who made those bookings
SELECT 
    b.booking_id,
    u.user_id,
    u.username,
    b.start_date,
    b.end_date
FROM Bookings b
INNER JOIN Users u ON b.user_id = u.user_id
ORDER BY b.booking_id;

-- ==============================================

-- 2. LEFT JOIN
-- Retrieve all properties and their reviews, including properties with no reviews
SELECT 
    p.property_id,
    p.title AS property_title,
    r.review_id,
    r.rating,
    r.comment
FROM Properties p
LEFT JOIN Reviews r ON p.property_id = r.property_id
ORDER BY p.property_id;

-- ==============================================

-- 3. FULL OUTER JOIN
-- Retrieve all users and all bookings,
-- even if the user has no booking or a booking is not linked to a user
SELECT 
    u.user_id,
    u.username,
    b.booking_id,
    b.start_date,
    b.end_date
FROM Users u
FULL OUTER JOIN Bookings b ON u.user_id = b.user_id
ORDER BY u.user_id NULLS LAST;

-- ==============================================
-- END OF FILE
-- ==============================================
