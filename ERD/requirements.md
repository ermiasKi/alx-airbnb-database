# AirBnB Database Requirements

## Overview
This document outlines the requirements for the AirBnB database, including entities, attributes, constraints, and indexing specifications to support efficient data management for users, properties, bookings, payments, reviews, and messaging.

## Entities and Attributes

### User
- **Purpose**: Stores information about users (guests, hosts, admins).
- **Attributes**:
  - `user_id`: UUID, Primary Key, Indexed
  - `first_name`: VARCHAR, NOT NULL
  - `last_name`: VARCHAR, NOT NULL
  - `email`: VARCHAR, UNIQUE, NOT NULL
  - `password_hash`: VARCHAR, NOT NULL
  - `phone_number`: VARCHAR, NULL
  - `role`: ENUM('guest', 'host', 'admin'), NOT NULL
  - `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### Property
- **Purpose**: Stores details about properties listed for booking.
- **Attributes**:
  - `property_id`: UUID, Primary Key, Indexed
  - `host_id`: UUID, Foreign Key (references User.user_id)
  - `name`: VARCHAR, NOT NULL
  - `description`: TEXT, NOT NULL
  - `location`: VARCHAR, NOT NULL
  - `pricepernight`: DECIMAL, NOT NULL
  - `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
  - `updated_at`: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

### Booking
- **Purpose**: Manages booking details for properties.
- **Attributes**:
  - `booking_id`: UUID, Primary Key, Indexed
  - `property_id`: UUID, Foreign Key (references Property.property_id)
  - `user_id`: UUID, Foreign Key (references User.user_id)
  - `start_date`: DATE, NOT NULL
  - `end_date`: DATE, NOT NULL
  - `total_price`: DECIMAL, NOT NULL
  - `status`: ENUM('pending', 'confirmed', 'canceled'), NOT NULL
  - `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### Payment
- **Purpose**: Tracks payments associated with bookings.
- **Attributes**:
  - `payment_id`: UUID, Primary Key, Indexed
  - `booking_id`: UUID, Foreign Key (references Booking.booking_id)
  - `amount`: DECIMAL, NOT NULL
  - `payment_date`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
  - `payment_method`: ENUM('credit_card', 'paypal', 'stripe'), NOT NULL

### Review
- **Purpose**: Stores user reviews for properties.
- **Attributes**:
  - `review_id`: UUID, Primary Key, Indexed
  - `property_id`: UUID, Foreign Key (references Property.property_id)
  - `user_id`: UUID, Foreign Key (references User.user_id)
  - `rating`: INTEGER, CHECK (rating >= 1 AND rating <= 5), NOT NULL
  - `comment`: TEXT, NOT NULL
  - `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

### Message
- **Purpose**: Facilitates communication between users.
- **Attributes**:
  - `message_id`: UUID, Primary Key, Indexed
  - `sender_id`: UUID, Foreign Key (references User.user_id)
  - `recipient_id`: UUID, Foreign Key (references User.user_id)
  - `message_body`: TEXT, NOT NULL
  - `sent_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

## Constraints

### User Table
- **Unique Constraint**: `email` must be unique.
- **Non-null Constraints**: `first_name`, `last_name`, `email`, `password_hash`, `role` must not be null.

### Property Table
- **Foreign Key Constraint**: `host_id` references `User.user_id`.
- **Non-null Constraints**: `name`, `description`, `location`, `pricepernight` must not be null.

### Booking Table
- **Foreign Key Constraints**:
  - `property_id` references `Property.property_id`.
  - `user_id` references `User.user_id`.
- **Enum Constraint**: `status` must be one of 'pending', 'confirmed', or 'canceled'.
- **Non-null Constraints**: `start_date`, `end_date`, `total_price`, `status` must not be null.

### Payment Table
- **Foreign Key Constraint**: `booking_id` references `Booking.booking_id`.
- **Non-null Constraints**: `amount`, `payment_method` must not be null.
- **Enum Constraint**: `payment_method` must be one of 'credit_card', 'paypal', or 'stripe'.

### Review Table
- **Foreign Key Constraints**:
  - `property_id` references `Property.property_id`.
  - `user_id` references `User.user_id`.
- **Check Constraint**: `rating` must be between 1 and 5 (inclusive).
- **Non-null Constraints**: `rating`, `comment` must not be null.

### Message Table
- **Foreign Key Constraints**:
  - `sender_id` references `User.user_id`.
  - `recipient_id` references `User.user_id`.
- **Non-null Constraint**: `message_body` must not be null.

## Indexing

### Primary Keys
- Automatically indexed: `user_id`, `property_id`, `booking_id`, `payment_id`, `review_id`, `message_id`.

### Additional Indexes
- `email` in the User table for fast lookup.
- `property_id` in the Property and Booking tables for efficient joins and queries.
- `booking_id` in the Booking and Payment tables for efficient payment tracking.

## Additional Notes
- All UUID fields should use a standard UUID format for consistency.
- TIMESTAMP fields use DEFAULT CURRENT_TIMESTAMP to automatically record creation times, with `updated_at` in the Property table updating on modifications.
- ENUM fields ensure data integrity by restricting values to predefined options.
- Indexes are designed to optimize query performance for common operations like user lookups, property searches, and booking/payment tracking.