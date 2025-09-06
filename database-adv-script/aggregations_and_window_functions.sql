SELECT u.user_id, COUNT(b.booking_id) 
FROM User u LEFT JOIN Booking b 
ON u.user_id = b.user_id 
GROUP BY u.user_id;

SELECT p.property_id,
       RANK() OVER (ORDER BY COUNT(b.booking_id) DESC)
FROM Property p LEFT JOIN Booking b 
ON p.property_id = b.property_id
GROUP BY p.property_id;