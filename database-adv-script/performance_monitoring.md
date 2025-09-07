# Database Performance Monitoring and Refinement

## Objective
The goal of this task is to monitor database performance using tools like `EXPLAIN ANALYZE` and identify potential bottlenecks. Based on these findings, schema adjustments and indexing strategies were applied to optimize query performance.

---

## Step 1: Monitoring Queries
We selected frequently used queries and analyzed their performance:

### Query 1 – Bookings by User
```sql
EXPLAIN ANALYZE
SELECT b.booking_id, b.start_date, b.end_date, p.title AS property_title
FROM Bookings b
JOIN Properties p ON b.property_id = p.property_id
WHERE b.user_id = 42;
```

### Query 2 – Properties with 
``` sql
EXPLAIN ANALYZE
SELECT p.property_id, p.title, r.rating, r.comment
FROM Properties p
LEFT JOIN Reviews r ON p.property_id = r.property_id
ORDER BY p.property_id;
```

### Query 3 – Payments by Date Range
``` sql
EXPLAIN ANALYZE
SELECT payment_id, booking_id, amount, status
FROM Payments
WHERE payment_date BETWEEN '2024-01-01' AND '2024-12-31';
```

## Step 2: Identified Bottlenecks

Lack of indexes on high-usage columns (Bookings.user_id, Reviews.property_id, Payments.payment_date).

Unnecessary sequential scans on large tables.

Sorting without index support.

## Step 3: Implemented Optimizations
Added Indexes
-- Optimize queries filtering by user_id
``` sql
CREATE INDEX idx_bookings_user_id ON Bookings(user_id);

-- Optimize queries joining on property_id
CREATE INDEX idx_reviews_property_id ON Reviews(property_id);

-- Optimize date-range filtering in Payments
CREATE INDEX idx_payments_payment_date ON Payments(payment_date);
```
## Step 4: Re-Testing Performance

EXPLAIN ANALYZE on Query 1 now shows Index Scan on Bookings.user_id, reducing query cost significantly.

Query 2 uses the new index on Reviews.property_id for faster lookups.

Query 3 leverages the Payments.payment_date index, pruning rows efficiently.
