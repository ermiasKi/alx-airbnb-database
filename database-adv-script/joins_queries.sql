-- Inner join

SELECT * FROM Booking INNER JOIN User ON Booking.user_id = User.user_id;

-- Left join

SELECT * FROM Property LEFT JOIN Review ON Property.property_id = Review.property_id ORDER BY Property.property_id;

-- Full outer join

SELECT * FROM User FULL OUTER JOIN Booking ON User.user_id = Booking.user_id ORDER BY User.user_id;
