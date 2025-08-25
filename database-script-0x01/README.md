# Database Schema for ALX Airbnb Project

This directory contains the **schema.sql** file, which defines the database structure for the Airbnb-like application.

## Files
- `schema.sql` - SQL script to create the database schema.

## Tables Created
1. **Users**
2. **Properties**
3. **Bookings**
4. **Payments**
5. **Reviews**
6. **Messages**

## Constraints
- Primary keys for all tables.
- Foreign key relationships:
  - Properties → Users (host_id)
  - Bookings → Properties & Users
  - Payments → Bookings
  - Reviews → Properties & Users
  - Messages → Users (sender & recipient)
- Unique constraint on `Users.email`.
- Rating validation in Reviews (1–5).

## Indexing
- Index on `Users.email`.
- Index on foreign keys for faster joins.

## How to Use
Run the script in your SQL environment:
```bash
mysql -u username -p database_name < schema.sql
