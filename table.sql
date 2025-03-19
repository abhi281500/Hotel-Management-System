create database HotelManagementSystem;
use HotelManagementSystem;
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    role ENUM('Admin', 'Guest', 'Receptionist') NOT NULL
);
CREATE TABLE Rooms (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(50),
    price DECIMAL(10,2),
    status ENUM('Available', 'Booked') DEFAULT 'Available'
);
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    room_id INT,
    check_in DATE,
    check_out DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    method ENUM('Credit Card', 'Debit Card', 'Cash', 'UPI'),
    status ENUM('Pending', 'Completed') DEFAULT 'Pending',
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);
CREATE TABLE Feedback (
    feedback_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);