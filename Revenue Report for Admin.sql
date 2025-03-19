-- Revenue Report for Admin

CREATE VIEW Hotel_Revenue AS
SELECT B.check_in, B.check_out, SUM(B.total_amount) AS Total_Revenue
FROM Bookings B
GROUP BY B.check_in, B.check_out;