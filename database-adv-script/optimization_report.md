# Task 4: Query Performance Optimization

## Objective
Refactor complex queries to improve performance by analyzing execution plans and applying optimizations.

---

## Initial Query
The initial query joined **Bookings**, **Users**, **Properties**, and **Payments** tables to retrieve booking details with user, property, and payment information.

**Issues identified:**
- Selected unnecessary columns (`user_id`, `email`, `property_id`, etc.).
- No filtering conditions, which caused **full table scans**.
- Large number of joins increased execution cost.

---

## Performance Analysis
We used the following command:

```sql
EXPLAIN ANALYZE
SELECT b.booking_id, u.user_id, u.username, u.email, p.property_id, p.title, pay.payment_id, pay.amount, pay.status
FROM Bookings b
JOIN Users u ON b.user_id = u.user_id
JOIN Properties p ON b.property_id = p.property_id
JOIN Payments pay ON b.booking_id = pay.booking_id;
