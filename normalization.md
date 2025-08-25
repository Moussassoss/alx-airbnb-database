# Database Normalization for ALX Airbnb Database

## Objective
The goal of normalization is to reduce redundancy and ensure data integrity by organizing the database into well-structured tables. Our target is to achieve **Third Normal Form (3NF)**.

---

## Step 1: First Normal Form (1NF)
**Requirements:**
- Each table must have a primary key.
- No repeating groups or multi-valued attributes.
- All attributes must be atomic (indivisible).

**Application to our schema:**
- All tables (`Users`, `Properties`, `Bookings`, `Payments`, `Reviews`, `Messages`) have **UUID primary keys**.
- Attributes are atomic (e.g., `first_name`, `last_name`, `email` are indivisible).
- No repeating groups exist.

✅ The schema is in **1NF**.

---

## Step 2: Second Normal Form (2NF)
**Requirements:**
- Must be in 1NF.
- No partial dependencies (all non-key attributes must depend on the whole primary key).

**Application to our schema:**
- Each table uses a single-column primary key (`UUID`), not composite keys.
- Therefore, all non-key attributes fully depend on the primary key.

✅ The schema is in **2NF**.

---

## Step 3: Third Normal Form (3NF)
**Requirements:**
- Must be in 2NF.
- No transitive dependencies (non-key attributes should not depend on other non-key attributes).

**Application to our schema:**
- `Users`: All attributes depend only on `user_id`.  
- `Properties`: Depend only on `property_id`. `pricepernight` is independent of other attributes.  
- `Bookings`: Attributes depend only on `booking_id`.  
  - ⚠️ Note: `total_price` can be derived from `pricepernight * number_of_nights`. This is technically a transitive dependency.  
  - However, it is **kept for performance reasons**, which is acceptable in real-world systems.  
- `Payments`: All attributes depend only on `payment_id`.  
- `Reviews`: All attributes depend only on `review_id`.  
- `Messages`: All attributes depend only on `message_id`.

✅ The schema is in **3NF**.  

---

## Conclusion
- The database design meets **Third Normal Form (3NF)** requirements.  
- Only acceptable redundancy: `total_price` in `Bookings` (for faster queries).  
- This ensures **data integrity, reduced redundancy, and efficient querying**.

