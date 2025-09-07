# Task 3: Implement Indexes for Optimization

## Objective
Identify and create indexes to improve query performance in the Airbnb database.

---

## High-Usage Columns
Indexes were created on the following frequently used columns:

### Users Table
- **email** → Used for login and uniqueness checks.
- **role** → Often filtered in admin/host queries.

### Properties Table
- **host_id** → Supports joins between `Users` and `Properties`.
- **location** → Frequently searched in property discovery.
- **pricepernight** → Supports sorting and filtering by price.

### Bookings Table
- **user_id** → Supports queries about a user’s booking history.
- **property_id** → Supports joins with `Properties`.
- **start_date** → Used in date range queries.
- **status** → Supports filtering by booking status.

---

## Performance Testing
To measure improvements, we used `EXPLAIN` and `ANALYZE`:

### Example 1: User Bookings Query
```sql
EXPLAIN ANALYZE
SELECT b.booking_id, b.start_date, b.end_date
FROM Bookings b
JOIN Users u ON b.user_id = u.user_id
WHERE u.email = 'test@example.com';
