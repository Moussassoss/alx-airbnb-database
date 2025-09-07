# Partitioning Performance Report

## Objective
The goal of this task was to improve query performance on the **Bookings** table by applying **table partitioning** based on the `start_date` column.

## Implementation
- Created a new table **Bookings_Partitioned** using `PARTITION BY RANGE (start_date)`.
- Defined yearly partitions:
  - `bookings_2023`
  - `bookings_2024`
  - `bookings_2025`
- Tested queries using `EXPLAIN ANALYZE`.

## Performance Observations
- **Before Partitioning:**  
  Queries scanning large date ranges had to perform a full table scan on the entire Bookings table, leading to slower response times.

- **After Partitioning:**  
  PostgreSQL prunes partitions automatically, scanning only the relevant partitions based on the query's `WHERE` clause.  
  For example:  
  - Querying for bookings in **2024** only scans the `bookings_2024` partition.  
  - Querying across 2023–2025 scans only `bookings_2023`, `bookings_2024`, and `bookings_2025` instead of the entire dataset.

## Conclusion
Partitioning significantly reduces query execution time for large datasets by limiting the number of rows scanned.  
This makes **range queries by date** much more efficient and scalable.
