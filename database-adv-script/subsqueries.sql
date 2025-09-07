-- Properties with average rating > 4.0
SELECT 
    p.property_id,
    p.title,
    p.location
FROM Properties p
WHERE (
    SELECT AVG(r.rating)
    FROM Reviews r
    WHERE r.property_id = p.property_id
) > 4.0;
-- Users with more than 3 bookings
SELECT 
    u.user_id,
    u.username,
    u.email
FROM Users u
WHERE (
    SELECT COUNT(*)
    FROM Bookings b
    WHERE b.user_id = u.user_id
) > 3;
