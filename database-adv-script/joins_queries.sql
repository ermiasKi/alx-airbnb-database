-- Inner join

SELECT * FROM Booking INNER JOIN User ON Booking.user_id = User.user_id;

-- Left join

SELECT * FROM Property Left JOIN Review ON Property.property_id = Review.property_id;

-- Full outer join

SELECT * FROM User Full OUTER JOIN Booking ON User.user_id = Booking.user_id;
