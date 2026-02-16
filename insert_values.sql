-- INSERT SAMPLE DATA (DML)

-- Insert into Theatres
INSERT INTO Theatres (theatre_name, city) VALUES
('PVR Cinemas', 'Delhi'),
('INOX', 'Mumbai'),
('Cinepolis', 'Bangalore'),
('Miraj Cinemas', 'Hyderabad'),
('Asian Cinemas', 'Chennai');

-- Insert into Screens
INSERT INTO Screens (theatre_id, screen_name, total_seats) VALUES
(1, 'Screen 1', 150),
(2, 'Screen 1', 180),
(3, 'Screen 2', 200),
(4, 'Screen 1', 120),
(5, 'Screen 3', 160);

-- Insert into Movies
INSERT INTO Movies (title, genre, duration_minutes, language, release_date) VALUES
('Leo', 'Action', 160, 'Tamil', '2023-10-19'),
('Jawan', 'Action', 170, 'Hindi', '2023-09-07'),
('Avengers: Endgame', 'Superhero', 180, 'English', '2019-04-26'),
('KGF Chapter 2', 'Action', 165, 'Kannada', '2022-04-14'),
('Pushpa 2', 'Action/Drama', 155, 'Telugu', '2024-01-10');

-- Insert into Shows
INSERT INTO Shows (movie_id, screen_id, show_date, show_time, ticket_price) VALUES
(1, 1, '2024-02-20', '18:00:00', 250),
(2, 2, '2024-02-20', '21:00:00', 300),
(3, 3, '2024-02-21', '19:00:00', 350),
(4, 4, '2024-02-21', '16:00:00', 280),
(5, 5, '2024-02-22', '20:00:00', 320);

-- Insert into Customers
INSERT INTO Customers (name, email, phone) VALUES
('Rahul Sharma', 'rahul@gmail.com', '9876543210'),
('Priya Mehta', 'priya@gmail.com', '9876543222'),
('Arjun Verma', 'arjun@gmail.com', '9876543333'),
('Sneha Reddy', 'sneha@gmail.com', '9876544444'),
('Karan Patel', 'karan@gmail.com', '9876545555');

-- Insert into Bookings
INSERT INTO Bookings (show_id, customer_id, booking_date, number_of_tickets, total_amount) VALUES
(1, 1, '2024-02-19', 2, 500),
(2, 2, '2024-02-19', 3, 900),
(3, 3, '2024-02-20', 1, 350),
(4, 4, '2024-02-20', 4, 1120),
(5, 5, '2024-02-21', 2, 640);  )