CREATE INDEX idx_user_id ON User(user_id);

CREATE INDEX idx_booking_id ON Booking(booking_id);

CREATE INDEX idx_property_id ON Property(property_id);

CREATE INDEX idx_review_id ON Review(review_id);

CREATE INDEX idx_payment_id ON Payment(payment_id);

CREATE INDEX idx_message_id ON Message(message_id);



EXPLAIN ANALYZE
SELECT u.user_id, COUNT(b.booking_id) 
FROM User u 
LEFT JOIN Booking b ON u.user_id = b.user_id 
GROUP BY u.user_id;

EXPLAIN ANALYZE
SELECT p.property_id, COUNT(b.booking_id) AS total_bookings,
       RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.property_id;