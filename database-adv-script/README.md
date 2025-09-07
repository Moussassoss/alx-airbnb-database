📘 Task 0: Joins – Airbnb Database Module

This task demonstrates how to use SQL JOINs to query data across multiple tables in the Airbnb database schema.

🔑 Covered JOIN Types
1. INNER JOIN

Returns rows when there is a match in both tables.

Example: Fetch all bookings with user and property details.

` SELECT 
    b.booking_id,
    u.username,
    p.title AS property_title,
    b.start_date,
    b.end_date
FROM Bookings b
INNER JOIN Users u ON b.user_id = u.user_id
INNER JOIN Properties p ON b.property_id = p.property_id;
`
2. LEFT JOIN

Returns all rows from the left table (Users) and matched rows from the right table (Bookings).

If no booking exists for a user, NULL values are returned for booking fields.

` SELECT 
    u.user_id,
    u.username,
    b.booking_id,
    b.start_date,
    b.end_date
FROM Users u
LEFT JOIN Bookings b ON u.user_id = b.user_id;
`
3. FULL OUTER JOIN

Returns all rows from both tables, whether or not there is a match.

Useful for spotting unbooked properties or bookings with missing property links.
`
SELECT 
    p.property_id,
    p.title AS property_title,
    b.booking_id,
    b.start_date,
    b.end_date
FROM Properties p
FULL OUTER JOIN Bookings b ON p.property_id = b.property_id;
`
✅ Key Learnings

INNER JOIN → Common data only

LEFT JOIN → Keep all from left table, matched or not

FULL OUTER JOIN → Combine all, matched or not
