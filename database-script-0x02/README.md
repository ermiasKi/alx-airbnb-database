AirBnB Database Sample Data Insertion
Overview
This README provides instructions for inserting sample data into the AirBnB database tables in a PostgreSQL server. The data includes at least 10 records per table (users, properties, bookings, payments, reviews, messages), ensuring referential integrity and compliance with schema constraints.
Prerequisites

PostgreSQL database with the AirBnB schema created (see create_tables_readme.md).
The uuid-ossp extension enabled.
Appropriate database user permissions to insert data.

Instructions

Connect to PostgreSQL: Use a PostgreSQL client (e.g., psql, pgAdmin) to connect to the airbnb database.
Verify Schema: Ensure all tables, ENUM types, and constraints are created as per the table creation script.
Run the SQL Script: Execute the SQL script below to insert sample data.

Notes

Data Integrity: The sample data respects all constraints:
Unique email in users.
Valid ENUM values (role, status, payment_method).
rating in reviews between 1 and 5.
Foreign keys (host_id, property_id, user_id, booking_id, sender_id, recipient_id) reference valid records.


UUIDs: Static UUIDs are used for consistency in this sample. In production, use uuid_generate_v4() for unique IDs.
Total Price: The total_price in bookings matches pricepernight × (days) from properties. The amount in payments aligns with total_price (except for one partial payment).
Execution Order: Insert data in order: users, properties, bookings, payments, reviews, messages to satisfy foreign key dependencies.
Verification: After insertion, verify data with SELECT COUNT(*) FROM table_name; for each table to confirm 10 records per table.
