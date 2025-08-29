# AirBnB Database Normalization (3NF)

## Overview
This document outlines the normalization process for the AirBnB database schema to achieve **3NF** (Third Normal Form), ensuring no transitive dependencies, minimal redundancy, and robust data integrity. The schema manages users, locations, properties, bookings, payments, reviews, and messages.

## Entities and Attributes

### User
- **Purpose**: Stores user information (guests, hosts, admins).
- **Attributes**:
  - `user_id`: UUID, Primary Key, Indexed
  - `first_name`: VARCHAR, NOT NULL
  - `last_name`: VARCHAR, NOT NULL
  - `email`: VARCHAR, UNIQUE, NOT NULL
  - `password_hash`: VARCHAR, NOT NULL
  - `phone_number`: VARCHAR, NULL
  - `role`: ENUM('guest', 'host', 'admin'), NOT NULL
  - `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- **Constraints**:
  - Unique constraint on `email`.
  - Non-null constraints on `first_name`, `last_name`, `email`, `password_hash`, `role`.
- **Indexes**:
  - Primary Key: `user_id`
  - Additional Index: `email`

### Location
- **Purpose**: Stores normalized location data to eliminate redundancy in property locations.
- **Attributes**:
  - `location_id`: UUID, Primary Key, Indexed
  - `street_address`: VARCHAR, NOT NULL
  - `city`: VARCHAR, NOT NULL
  - `state`: VARCHAR, NULL
  - `country`: VARCHAR, NOT NULL
  - `postal_code`: VARCHAR, NULL
- **Constraints**:
  - Non-null constraints on `street_address`, `city`, `country`.
- **Indexes**:
  - Primary Key: `location_id`
  - Additional Indexes: `city`, `country`

### Property
- **Purpose**: Stores details about properties listed for booking.
- **Attributes**:
  - `property_id`: UUID, Primary Key, Indexed
  - `host_id`: UUID, Foreign Key (references User.user_id)
  - `name`: VARCHAR, NOT NULL
  - `description`: TEXT, NOT NULL
  - `location_id`: UUID, Foreign Key (references Location.location_id), NOT NULL
  - `pricepernight`: DECIMAL, NOT NULL
  - `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
  - `updated_at`: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP
- **Constraints**:
  - Foreign key constraints on `host_id` and `location_id`.
  - Non-null constraints on `name`, `description`, `location_id`, `pricepernight`.
- **Indexes**:
  - Primary Key: `property_id`
  - Additional Index: `location_id`

### Booking
- **Purpose**: Manages booking details for properties.
- **Attributes**:
  - `booking_id`: UUID, Primary Key, Indexed
  - `property_id`: UUID, Foreign Key (references Property.property_id)
  - `user_id`: UUID, Foreign Key (references User.user_id)
  - `start_date`: DATE, NOT NULL
  - `end_date`: DATE, NOT NULL
  - `status`: ENUM('pending', 'confirmed', 'canceled'), NOT NULL
  - `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- **Constraints**:
  - Foreign key constraints on `property_id` and `user_id`.
  - Enum constraint on `status`.
  - Non-null constraints on `start_date`, `end_date`, `status`.
- **Indexes**:
  - Primary Key: `booking_id`
  - Additional Indexes: `property_id`, `user_id`

### Payment
- **Purpose**: Tracks payments associated with bookings.
- **Attributes**:
  - `payment_id`: UUID, Primary Key, Indexed
  - `booking_id`: UUID, Foreign Key (references Booking.booking_id)
  - `amount`: DECIMAL, NOT NULL
  - `payment_date`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
  - `payment_method`: ENUM('credit_card', 'paypal', 'stripe'), NOT NULL
- **Constraints**:
  - Foreign key constraint on `booking_id`.
  - Non-null constraints on `amount`, `payment_method`.
  - Enum constraint on `payment_method`.
- **Indexes**:
  - Primary Key: `payment_id`
  - Additional Index: `booking_id`

### Review
- **Purpose**: Stores user reviews for properties.
- **Attributes**:
  - `review_id`: UUID, Primary Key, Indexed
  - `property_id`: UUID, Foreign Key (references Property.property_id)
  - `user_id`: UUID, Foreign Key (references User.user_id)
  - `rating`: INTEGER, CHECK (rating >= 1 AND rating <= 5), NOT NULL
  - `comment`: TEXT, NOT NULL
  - `created_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- **Constraints**:
  - Foreign key constraints on `property_id` and `user_id`.
  - Check constraint on `rating` (1-5).
  - Non-null constraints on `rating`, `comment`.
- **Indexes**:
  - Primary Key: `review_id`
  - Additional Indexes: `property_id`, `user_id`

### Message
- **Purpose**: Facilitates communication between users.
- **Attributes**:
  - `message_id`: UUID, Primary Key, Indexed
  - `sender_id`: UUID, Foreign Key (references User.user_id)
  - `recipient_id`: UUID, Foreign Key (references User.user_id)
  - `message_body`: TEXT, NOT NULL
  - `sent_at`: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- **Constraints**:
  - Foreign key constraints on `sender_id` and `recipient_id`.
  - Non-null constraint on `message_body`.
- **Indexes**:
  - Primary Key: `message_id`
  - Additional Indexes: `sender_id`, `recipient_id`

## Normalization Process
### Initial Schema Analysis
- **1NF Compliance**: All attributes are atomic (no repeating groups or arrays).
- **2NF Compliance**: No partial dependencies, as all tables use single-attribute primary keys (UUIDs).
- **3NF Issues**:
  - **Property Table**: `location` (VARCHAR) may contain composite data (e.g., "New York, NY, USA"), introducing a transitive dependency (e.g., `city` → `country`).
  - **Booking Table**: `total_price` is derived from `pricepernight` (from Property) and `start_date`, `end_date`, creating a transitive dependency.
  - **Payment Table**: `amount` may duplicate `total_price`, but removing `total_price` makes `amount` the source of truth.

### Changes for 3NF
- **Location Table**: Introduced to normalize location data, removing transitive dependency in Property (e.g., `city` → `country`) by storing `street_address`, `city`, `state`, `country`, `postal_code` separately.
- **Property Table**: Replaced `location` with `location_id` (Foreign Key to Location), ensuring attributes depend only on `property_id`.
- **Booking Table**: Removed `total_price`, as it is derived from `pricepernight` × (`end_date` - `start_date`), eliminating transitive dependency.
- **Payment Table**: Retained `amount` as the single source of truth for payment, with application logic to validate against computed booking cost.

## Additional Notes
- **UUIDs**: Used for all primary keys to ensure uniqueness.
- **Dynamic Calculations**: Booking cost is computed dynamically (`pricepernight` × (`end_date` - `start_date`)) to avoid storing derived data. For performance, consider materialized views or triggers if needed.
- **Indexes**: Added `city` and `country` indexes in Location for efficient searches.
- **Data Integrity**: Foreign keys, ENUMs, and CHECK constraints ensure referential integrity and valid data.
- **Trade-Offs**: Normalized schema reduces redundancy but increases join complexity. Denormalization (e.g., storing `total_price`) may be considered for performance with proper constraints.