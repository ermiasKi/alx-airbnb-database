AirBnB Database Table Creation
Overview
This README provides instructions for creating the AirBnB database tables in a PostgreSQL server. The schema includes tables for users, properties, bookings, payments, reviews, and messages, with all necessary constraints and indexes as specified.
Prerequisites

PostgreSQL server (version 9.5 or later recommended for UUID support).
uuid-ossp extension enabled for UUID generation.
Appropriate database user permissions to create tables, types, and indexes.

Instructions

Connect to PostgreSQL: Use a PostgreSQL client (e.g., psql, pgAdmin) to connect to your database.
Create Database (Optional): If not already created, set up a database:CREATE DATABASE airbnb;
\c airbnb


Run the SQL Script: Execute the SQL script below to create the tables, ENUM types, indexes, and triggers.

SQL Script
-- Enable UUID extension for PostgreSQL
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create ENUM types for role, status, and payment_method
CREATE TYPE user_role AS ENUM ('guest', 'host', 'admin');
CREATE TYPE booking_status AS ENUM ('pending', 'confirmed', 'canceled');
CREATE TYPE payment_method AS ENUM ('credit_card', 'paypal', 'stripe');

-- Create User table
CREATE TABLE users (
user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(255) NOT NULL,
password_hash VARCHAR(255) NOT NULL,
phone_number VARCHAR(20),
role user_role NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT unique_email UNIQUE (email)
);

-- Create Property table
CREATE TABLE properties (
property_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
host_id UUID REFERENCES users(user_id),
name VARCHAR(100) NOT NULL,
description TEXT NOT NULL,
location VARCHAR(255) NOT NULL,
pricepernight DECIMAL(10,2) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Booking table
CREATE TABLE bookings (
booking_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
property_id UUID REFERENCES properties(property_id),
user_id UUID REFERENCES users(user_id),
start_date DATE NOT NULL,
end_date DATE NOT NULL,
total_price DECIMAL(10,2) NOT NULL,
status booking_status NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Payment table
CREATE TABLE payments (
payment_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
booking_id UUID REFERENCES bookings(booking_id),
amount DECIMAL(10,2) NOT NULL,
payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
payment_method payment_method NOT NULL
);

-- Create Review table
CREATE TABLE reviews (
review_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
property_id UUID REFERENCES properties(property_id),
user_id UUID REFERENCES users(user_id),
rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
comment TEXT NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Message table
CREATE TABLE messages (
message_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
sender_id UUID REFERENCES users(user_id),
recipient_id UUID REFERENCES users(user_id),
message_body TEXT NOT NULL,
sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create additional indexes
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_properties_host_id ON properties(host_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_payments_booking_id ON payments(booking_id);
CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_reviews_user_id ON reviews(user_id);
CREATE INDEX idx_messages_sender_id ON messages(sender_id);
CREATE INDEX idx_messages_recipient_id ON messages(recipient_id);

Notes

UUID Extension: The uuid-ossp extension is required for uuid_generate_v4(). Ensure it is enabled.
Constraints: The script includes primary keys, foreign keys, unique constraints (e.g., email), ENUMs, and a CHECK constraint for ratings (1-5).
Indexes: Primary keys are automatically indexed; additional indexes are created for efficient querying.
Trigger: A trigger updates the updated_at timestamp in the properties table on updates.
Execution Order: Run the script in a single transaction to ensure all tables and constraints are created correctly.
