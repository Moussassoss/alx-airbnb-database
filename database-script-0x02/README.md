# Database Seeding for ALX Airbnb Project

This directory contains the **seed.sql** file, which inserts sample data into the database for testing purposes.

## Files
- `seed.sql` - SQL script with INSERT statements for Users, Properties, Bookings, Payments, Reviews, and Messages.

## Sample Data Includes:
- 3 Users (Guest, Host, Admin)
- 2 Properties listed by Host
- 1 Booking by Guest
- 1 Payment for the booking
- 1 Review from Guest
- 1 Message from Guest to Host

## How to Use
Run the script in your SQL environment:
```bash
mysql -u username -p database_name < seed.sql
