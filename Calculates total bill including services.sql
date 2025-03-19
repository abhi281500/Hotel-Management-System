-- Calculates total bill including services

DELIMITER //
CREATE FUNCTION calculate_total_bill(bookingID INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE room_cost DECIMAL(10,2);
    DECLARE service_cost DECIMAL(10,2);
    
    SELECT total_amount INTO room_cost FROM Bookings WHERE booking_id = bookingID;
    
    SELECT SUM(price) INTO service_cost
    FROM Services
    WHERE service_id IN (SELECT service_id FROM Payments WHERE booking_id = bookingID);
    
    RETURN room_cost + IFNULL(service_cost, 0);
END;
//
DELIMITER ;