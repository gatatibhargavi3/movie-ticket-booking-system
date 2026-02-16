-- BEGINNER LEVEL QUERIES (Basic SELECT, WHERE, ORDER BY)

-- 1.Show all theatres in Mumbai
SELECT * FROM THEATRES WHERE CITY = 'MUMBAI';

-- 2.List shows with ticket price > 300
SELECT show_id, ticket_price
FROM Shows
WHERE ticket_price > 300;

-- 3.Display customers sorted by name
SELECT * FROM Customers
ORDER BY name;

-- 4.Show movies in Hindi
SELECT title FROM Movies
WHERE language = 'Hindi';

-- 5.Show total seats in each screen
SELECT screen_name, total_seats
FROM Screens;

-- 6.Display bookings made on '2024-02-19'
SELECT * FROM Bookings
WHERE booking_date = '2024-02-19';

-- 7.Show distinct languages
SELECT DISTINCT language FROM Movies;

-- 8.Count total customers
SELECT COUNT(*) AS total_customers
FROM Customers;

-- INTERMEDIATE LEVEL QUERIES (JOINS, GROUP BY, Aggregations)

-- 1.Show movie name with show date & price
SELECT m.title, s.show_date, s.ticket_price
FROM Shows s
JOIN Movies m ON s.movie_id = m.movie_id;

-- 2.Show theatre name with screen count
SELECT t.theatre_name, COUNT(s.screen_id) AS total_screens
FROM Theatres t
JOIN Screens s ON t.theatre_id = s.theatre_id
GROUP BY t.theatre_name;

-- 3.Total tickets booked per show
SELECT show_id, SUM(number_of_tickets) AS total_tickets
FROM Bookings
GROUP BY show_id;

-- 4.Total revenue generated
SELECT SUM(total_amount) AS total_revenue
FROM Bookings;

-- 5.Movie with highest ticket price
SELECT m.title, MAX(s.ticket_price) AS highest_price
FROM Shows s
JOIN Movies m ON s.movie_id = m.movie_id
GROUP BY m.title;

-- 6.Customer name with number of bookings
SELECT c.name, COUNT(b.booking_id) AS bookings
FROM Customers c
JOIN Bookings b ON c.customer_id = b.customer_id
GROUP BY c.name;

-- 7.Total tickets booked by each customer
SELECT c.name, SUM(b.number_of_tickets) AS total_tickets
FROM Customers c
JOIN Bookings b ON c.customer_id = b.customer_id
GROUP BY c.name;

-- 8.Show movie with theatre name
SELECT m.title, t.theatre_name
FROM Movies m
JOIN Shows s ON m.movie_id = s.movie_id
JOIN Screens sc ON s.screen_id = sc.screen_id
JOIN Theatres t ON sc.theatre_id = t.theatre_id;

-- ADVANCED LEVEL QUERIES (Subqueries, Analytics, Revenue Logic)

-- 1.Movie generating highest revenue
SELECT m.title, SUM(b.total_amount) AS revenue
FROM Movies m
JOIN Shows s ON m.movie_id = s.movie_id
JOIN Bookings b ON s.show_id = b.show_id
GROUP BY m.title
ORDER BY revenue DESC
LIMIT 1;

-- 2.Top paying customer
SELECT c.name, SUM(b.total_amount) AS total_spent
FROM Customers c
JOIN Bookings b ON c.customer_id = b.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 1;

-- 3.Show occupancy percentage per show
SELECT 
    s.show_id,
    (SUM(b.number_of_tickets) / sc.total_seats) * 100 AS occupancy_percentage
FROM Shows s
JOIN Screens sc ON s.screen_id = sc.screen_id
JOIN Bookings b ON s.show_id = b.show_id
GROUP BY s.show_id, sc.total_seats;

-- 4.Movies with revenue greater than 500
SELECT m.title, SUM(b.total_amount) AS revenue
FROM Movies m
JOIN Shows s ON m.movie_id = s.movie_id
JOIN Bookings b ON s.show_id = b.show_id
GROUP BY m.title
HAVING revenue > 500;

-- 5.Find movies not booked yet
SELECT title
FROM Movies
WHERE movie_id NOT IN (
    SELECT DISTINCT movie_id FROM Shows s
    JOIN Bookings b ON s.show_id = b.show_id
);

-- 6.Total revenue per city
SELECT t.city, SUM(b.total_amount) AS city_revenue
FROM Theatres t
JOIN Screens sc ON t.theatre_id = sc.theatre_id
JOIN Shows s ON sc.screen_id = s.screen_id
JOIN Bookings b ON s.show_id = b.show_id
GROUP BY t.city;

-- 7.Most popular movie (most tickets sold)
SELECT m.title, SUM(b.number_of_tickets) AS tickets_sold
FROM Movies m
JOIN Shows s ON m.movie_id = s.movie_id
JOIN Bookings b ON s.show_id = b.show_id
GROUP BY m.title
ORDER BY tickets_sold DESC
LIMIT 1;

-- 8.Rank movies by revenue
SELECT m.title,
       SUM(b.total_amount) AS revenue
FROM Movies m
JOIN Shows s ON m.movie_id = s.movie_id
JOIN Bookings b ON s.show_id = b.show_id
GROUP BY m.title
ORDER BY revenue DESC;