-- Insert sample data into users table (10 records)
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('550e8400-e29b-41d4-a716-446655440001', 'John', 'Doe', 'john.doe@example.com', 'hashed_password_1', '123-456-7890', 'guest', CURRENT_TIMESTAMP),
('550e8400-e29b-41d4-a716-446655440002', 'Jane', 'Smith', 'jane.smith@example.com', 'hashed_password_2', '234-567-8901', 'host', CURRENT_TIMESTAMP),
('550e8400-e29b-41d4-a716-446655440003', 'Alice', 'Johnson', 'alice.johnson@example.com', 'hashed_password_3', NULL, 'admin', CURRENT_TIMESTAMP),
('550e8400-e29b-41d4-a716-446655440004', 'Bob', 'Brown', 'bob.brown@example.com', 'hashed_password_4', '345-678-9012', 'guest', CURRENT_TIMESTAMP),
('550e8400-e29b-41d4-a716-446655440005', 'Emma', 'Davis', 'emma.davis@example.com', 'hashed_password_5', '456-789-0123', 'host', CURRENT_TIMESTAMP),
('550e8400-e29b-41d4-a716-446655440006', 'Michael', 'Wilson', 'michael.wilson@example.com', 'hashed_password_6', NULL, 'guest', CURRENT_TIMESTAMP),
('550e8400-e29b-41d4-a716-446655440007', 'Sarah', 'Taylor', 'sarah.taylor@example.com', 'hashed_password_7', '567-890-1234', 'host', CURRENT_TIMESTAMP),
('550e8400-e29b-41d4-a716-446655440008', 'David', 'Moore', 'david.moore@example.com', 'hashed_password_8', '678-901-2345', 'guest', CURRENT_TIMESTAMP),
('550e8400-e29b-41d4-a716-446655440009', 'Laura', 'Martin', 'laura.martin@example.com', 'hashed_password_9', NULL, 'guest', CURRENT_TIMESTAMP),
('550e8400-e29b-41d4-a716-446655440010', 'Chris', 'Lee', 'chris.lee@example.com', 'hashed_password_10', '789-012-3456', 'host', CURRENT_TIMESTAMP);

-- Insert sample data into properties table (10 records)
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('6b7c9d1f-3a4b-4c5d-8e9f-0a1b2c3d4e01', '550e8400-e29b-41d4-a716-446655440002', 'Cozy Beach House', 'A charming beachfront cottage', 'Miami, FL, USA', 150.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('6b7c9d1f-3a4b-4c5d-8e9f-0a1b2c3d4e02', '550e8400-e29b-41d4-a716-446655440005', 'Downtown Loft', 'Modern loft in city center', 'New York, NY, USA', 200.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('6b7c9d1f-3a4b-4c5d-8e9f-0a1b2c3d4e03', '550e8400-e29b-41d4-a716-446655440007', 'Mountain Cabin', 'Rustic retreat with mountain views', 'Aspen, CO, USA', 180.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('6b7c9d1f-3a4b-4c5d-8e9f-0a1b2c3d4e04', '550e8400-e29b-41d4-a716-446655440010', 'Urban Apartment', 'Sleek apartment near downtown', 'Chicago, IL, USA', 120.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('6b7c9d1f-3a4b-4c5d-8e9f-0a1b2c3d4e05', '550e8400-e29b-41d4-a716-446655440002', 'Lakefront Villa', 'Spacious villa by the lake', 'Seattle, WA, USA', 250.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('6b7c9d1f-3a4b-4c5d-8e9f-0a1b2c3d4e06', '550e8400-e29b-41d4-a716-446655440005', 'City Studio', 'Compact studio in the heart of the city', 'San Francisco, CA, USA', 100.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('6b7c9d1f-3a4b-4c5d-8e9f-0a1b2c3d4e07', '550e8400-e29b-41d4-a716-446655440007', 'Countryside Cottage', 'Quaint cottage in rural area', 'Austin, TX, USA', 90.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('6b7c9d1f-3a4b-4c5d-8e9f-0a1b2c3d4e08', '550e8400-e29b-41d4-a716-446655440010', 'Luxury Condo', 'High-end condo with amenities', 'Los Angeles, CA, USA', 300.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('6b7c9d1f-3a4b-4c5d-8e9f-0a1b2c3d4e09', '550e8400-e29b-41d4-a716-446655440002', 'Historic Townhouse', 'Charming townhouse with history', 'Boston, MA, USA', 175.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('6b7c9d1f-3a4b-4c5d-8e9f-0a1b2c3d4e10', '550e8400-e29b-41d4-a716-446655440005', 'Seaside Bungalow', 'Cozy bungalow by the sea', 'San Diego, CA, USA', 160.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Insert sample data into bookings table (10 records)
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('7c8d0e2f-4b5c-5d6e-9f0a-1b2c3d4e5f01', '6b7c9d1f-3a4b-4c5d-8e9f-0a1b2c3d4e01', '550e8400-e29b-41d4-a716-446655440001', '2025-09-01', '2025-09-03', 300.00, 'confirmed', CURRENT_TIMESTAMP),
('7c8d0e2f-4b5c-5d6e-9f0a-1b2c3d4e5f02', '6b7c9d1f-3a4b-4c5d-8e9f-0a1b2c3d4e02', '550e8400-e29b-41d4-a716-446655440004', '2025-09-05', '2025-09-07', 400.00, 'pending', CURRENT_TIMESTAMP),
('7c8d0e2f-4b5c-5d6e-9f0a-1b2c3d4e5f03', '6b7c9d1f-3a4b-4c5d-8e9f-0a1b2c3d4e03', '550e8400-e29b-41d4-a716-446655440006', '2025-09-10', '2025-09-12', 360.00, 'confirmed', CURRENT_TIMESTAMP),
('7c8d0e2f-4b5c-5d6e-9f0a-1b2c3d4e5f04', '6b7c9d1f-3a4b-4c5d-8e9f-0a1b2c3d4e04', '550e8400-e29b-41d4-a716-446655440008', '2025-09-15', '2025-09-17', 240.00, 'canceled', CURRENT_TIMESTAMP),
('7c8d0e2f-4b5c-5d6e-9f0a-1b2c3d4e5f05', '6b7c9d1f-3a4b-4c5d-8e9f-0a1b2c3d4e05', '550e8400-e29b-41d4-a716-446655440009', '2025-09-20', '2025-09-23', 750.00, 'confirmed', CURRENT_TIMESTAMP),
('7c8d0e2f-4b5c-5d6e-9f0a-1b2c3d4e5f06', '6b7c9d1f-3a4b-4c5d-8e9f-0a1b2c3d4e06', '550e8400-e29b-41d4-a716-446655440001', '2025-09-25', '2025-09-27', 200.00, 'pending', CURRENT_TIMESTAMP),
('7c8d0e2f-4b5c-5d6e-9f0a-1b2c3d4e5f07', '6b7c9d1f-3a4b-4c5d-8e9f-0a1b2c3d4e07', '550e8400-e29b-41d4-a716-446655440004', '2025-10-01', '2025-10-03', 180.00, 'confirmed', CURRENT_TIMESTAMP),
('7c8d0e2f-4b5c-5d6e-9f0a-1b2c3d4e5f08', '6b7c9d1f-3a4b-4c5d-8e9f-0a1b2c3d4e08', '550e8400-e29b-41d4-a716-446655440006', '2025-10-05', '2025-10-08', 900.00, 'confirmed', CURRENT_TIMESTAMP),
('7c8d0e2f-4b5c-5d6e-9f0a-1b2c3d4e5f09', '6b7c9d1f-3a4b-4c5d-8e9f-0a1b2c3d4e09', '550e8400-e29b-41d4-a716-446655440008', '2025-10-10', '2025-10-12', 350.00, 'pending', CURRENT_TIMESTAMP),
('7c8d0e2f-4b5c-5d6e-9f0a-1b2c3d4e5f10', '6b7c9d1f-3a4b-4c5d-8e9f-0a1b2c3d4e10', '550e8400-e29b-41d4-a716-446655440009', '2025-10-15', '2025-10-17', 320.00, 'confirmed', CURRENT_TIMESTAMP);

-- Insert sample data into payments table (10 records)
INSERT INTO payments (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('8d9e1f3a-5c6d-6e7f-0a1b-2c3d4e5f6a01', '7c8d0e2f-4b5c-5d6e-9f0a-1b2c3d4e5f01', 300.00, CURRENT_TIMESTAMP, 'credit_card'),
('8d9e1f3a-5c6d-6e7f-0a1b-2c3d4e5f6a02', '7c8d0e2f-4b5c-5d6e-9f0a-1b2c3d4e5f02', 400.00, CURRENT_TIMESTAMP, 'paypal'),
('8d9e1f3a-5c6d-6e7f-0a1b-2c3d4e5f6a03', '7c8d0e2f-4b5c-5d6e-9f0a-1b2c3d4e5f03', 360.00, CURRENT_TIMESTAMP, 'stripe'),
('8d9e1f3a-5c6d-6e7f-0a1b-2c3d4e5f6a04', '7c8d0e2f-4b5c-5d6e-9f0a-1b2c3d4e5f05', 750.00, CURRENT_TIMESTAMP, 'credit_card'),
('8d9e1f3a-5c6d-6e7f-0a1b-2c3d4e5f6a05', '7c8d0e2f-4b5c-5d6e-9f0a-1b2c3d4e5f06', 200.00, CURRENT_TIMESTAMP, 'paypal'),
('8d9e1f3a-5c6d-6e7f-0a1b-2c3d4e5f6a06', '7c8d0e2f-4b5c-5d6e-9f0a-1b2c3d4e5f07', 180.00, CURRENT_TIMESTAMP, 'stripe'),
('8d9e1f3a-5c6d-6e7f-0a1b-2c3d4e5f6a07', '7c8d0e2f-4b5c-5d6e-9f0a-1b2c3d4e5f08', 900.00, CURRENT_TIMESTAMP, 'credit_card'),
('8d9e1f3a-5c6d-6e7f-0a1b-2c3d4e5f6a08', '7c8d0e2f-4b5c-5d6e-9f0a-1b2c3d4e5f09', 350.00, CURRENT_TIMESTAMP, 'paypal'),
('8d9e1f3a-5c6d-6e7f-0a1b-2c3d4e5f6a09', '7c8d0e2f-4b5c-5d6e-9f0a-1b2c3d4e5f10', 320.00, CURRENT_TIMESTAMP, 'stripe'),
('8d9e1f3a-5c6d-6e7f-0a1b-2c3d4e5f6a10', '7c8d0e2f-4b5c-5d6e-9f0a-1b2c3d4e5f01', 150.00, CURRENT_TIMESTAMP, 'credit_card');

-- Insert sample data into reviews table (10 records)
INSERT INTO reviews (review_id, property_id, user_id, rating, comment, created_at) VALUES
('9e0f2a4b-6d7e-7f8a-1b2c-3d4e5f6a7b01', '6b7c9d1f-3a4b-4c5d-8e9f-0a1b2c3d4e01', '550e8400-e29b-41d4-a716-446655440001', 5, 'Amazing beach house, great location!', CURRENT_TIMESTAMP),
('9e0f2a4b-6d7e-7f8a-1b2c-3d4e5f6a7b02', '6b7c9d1f-3a4b-4c5d-8e9f-0a1b2c3d4e02', '550e8400-e29b-41d4-a716-446655440004', 4, 'Nice loft, very central.', CURRENT_TIMESTAMP),
('9e0f2a4b-6d7e-7f8a-1b2c-3d4e5f6a7b03', '6b7c9d1f-3a4b-4c5d-8e9f-0a1b2c3d4e03', '550e8400-e29b-41d4-a716-446655440006', 5, 'Loved the mountain views!', CURRENT_TIMESTAMP),
('9e0f2a4b-6d7e-7f8a-1b2c-3d4e5f6a7b04', '6b7c9d1f-3a4b-4c5d-8e9f-0a1b2c3d4e04', '550e8400-e29b-41d4-a716-446655440008', 3, 'Decent apartment, but a bit noisy.', CURRENT_TIMESTAMP),
('9e0f2a4b-6d7e-7f8a-1b2c-3d4e5f6a7b05', '6b7c9d1f-3a4b-4c5d-8e9f-0a1b2c3d4e05', '550e8400-e29b-41d4-a716-446655440009', 5, 'Perfect villa, very relaxing.', CURRENT_TIMESTAMP),
('9e0f2a4b-6d7e-7f8a-1b2c-3d4e5f6a7b06', '6b7c9d1f-3a4b-4c5d-8e9f-0a1b2c3d4e06', '550e8400-e29b-41d4-a716-446655440001', 4, 'Good studio, small but functional.', CURRENT_TIMESTAMP),
('9e0f2a4b-6d7e-7f8a-1b2c-3d4e5f6a7b07', '6b7c9d1f-3a4b-4c5d-8e9f-0a1b2c3d4e07', '550e8400-e29b-41d4-a716-446655440004', 5, 'Lovely cottage, great host.', CURRENT_TIMESTAMP),
('9e0f2a4b-6d7e-7f8a-1b2c-3d4e5f6a7b08', '6b7c9d1f-3a4b-4c5d-8e9f-0a1b2c3d4e08', '550e8400-e29b-41d4-a716-446655440006', 4, 'Luxury condo was fantastic!', CURRENT_TIMESTAMP),
('9e0f2a4b-6d7e-7f8a-1b2c-3d4e5f6a7b09', '6b7c9d1f-3a4b-4c5d-8e9f-0a1b2c3d4e09', '550e8400-e29b-41d4-a716-446655440008', 5, 'Historic townhouse was a delight.', CURRENT_TIMESTAMP),
('9e0f2a4b-6d7e-7f8a-1b2c-3d4e5f6a7b10', '6b7c9d1f-3a4b-4c5d-8e9f-0a1b2c3d4e10', '550e8400-e29b-41d4-a716-446655440009', 4, 'Great seaside stay, would return.', CURRENT_TIMESTAMP);

-- Insert sample data into messages table (10 records)
INSERT INTO messages (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('0f1a3b5c-7e8f-8a9b-2c3d-4e5f6a7b8c01', '550e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440002', 'Is the beach house available next month?', CURRENT_TIMESTAMP),
('0f1a3b5c-7e8f-8a9b-2c3d-4e5f6a7b8c02', '550e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440001', 'Yes, it’s available. Please book soon!', CURRENT_TIMESTAMP),
('0f1a3b5c-7e8f-8a9b-2c3d-4e5f6a7b8c03', '550e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440005', 'Can you confirm parking at the loft?', CURRENT_TIMESTAMP),
('0f1a3b5c-7e8f-8a9b-2c3d-4e5f6a7b8c04', '550e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440004', 'Parking is available nearby.', CURRENT_TIMESTAMP),
('0f1a3b5c-7e8f-8a9b-2c3d-4e5f6a7b8c05', '550e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440007', 'Does the cabin have Wi-Fi?', CURRENT_TIMESTAMP),
('0f1a3b5c-7e8f-8a9b-2c3d-4e5f6a7b8c06', '550e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440006', 'Yes, Wi-Fi is included.', CURRENT_TIMESTAMP),
('0f1a3b5c-7e8f-8a9b-2c3d-4e5f6a7b8c07', '550e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440010', 'Is the condo pet-friendly?', CURRENT_TIMESTAMP),
('0f1a3b5c-7e8f-8a9b-2c3d-4e5f6a7b8c08', '550e8400-e29b-41d4-a716-446655440010', '550e8400-e29b-41d4-a716-446655440008', 'Sorry, no pets allowed.', CURRENT_TIMESTAMP),
('0f1a3b5c-7e8f-8a9b-2c3d-4e5f6a7b8c09', '550e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440002', 'Can I check in early for the villa?', CURRENT_TIMESTAMP),
('0f1a3b5c-7e8f-8a9b-2c3d-4e5f6a7b8c10', '550e8400-e29b-41d4-a716-446655440002', '550e8400-e29b-41d4-a716-446655440009', 'Early check-in is possible, please confirm.', CURRENT_TIMESTAMP);