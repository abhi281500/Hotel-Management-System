 -- Get Customer Feedback

SELECT U.name, F.rating, F.comment
FROM Feedback F
JOIN Users U ON F.user_id = U.user_id;