-- Automatically updates room status after booking

DELIMITER //
CREATE TRIGGER after_booking
AFTER INSERT ON Bookings
FOR EACH ROW
BEGIN
    UPDATE Rooms
    SET status = 'Booked'
    WHERE room_id = NEW.room_id;
END;
//
DELIMITER ;