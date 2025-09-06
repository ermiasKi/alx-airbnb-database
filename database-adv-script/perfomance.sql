EXPLAIN ANALYZE
SELECT * FROM 
Booking b, User u, Property p, Payment pay
WHERE b.user_id = u.user_id
AND b.property_id = p.property_id
AND b.booking_id = pay.booking_id;