CREATE DATABASE MOVIE_TICKETING_SYSTEM;
USE MOVIE_TICKETING_SYSTEM;

-- 1.Theatres Table
CREATE TABLE Theatres (
    theatre_id INT PRIMARY KEY AUTO_INCREMENT,
    theatre_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL
);

-- 2.Screens Table
CREATE TABLE Screens (
    screen_id INT PRIMARY KEY AUTO_INCREMENT,
    theatre_id INT NOT NULL,
    screen_name VARCHAR(50) NOT NULL,
    total_seats INT NOT NULL CHECK (total_seats > 0),
    UNIQUE (theatre_id, screen_name),
    FOREIGN KEY (theatre_id) REFERENCES Theatres(theatre_id)
);

-- 3.Movies Table
CREATE TABLE Movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    duration_minutes INT NOT NULL CHECK (duration_minutes > 0),
    language VARCHAR(30) NOT NULL,
    release_date DATE NOT NULL
);

-- 4.Shows Table
CREATE TABLE Shows (
    show_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_id INT NOT NULL,
    screen_id INT NOT NULL,
    show_date DATE NOT NULL,
    show_time TIME NOT NULL,
    ticket_price DECIMAL(8,2) NOT NULL CHECK (ticket_price > 0),
    UNIQUE (screen_id, show_date, show_time),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (screen_id) REFERENCES Screens(screen_id)
);

-- 5.Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL UNIQUE
);

-- 6.Bookings Table
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    show_id INT NOT NULL,
    customer_id INT NOT NULL,
    booking_date DATE NOT NULL,
    number_of_tickets INT NOT NULL CHECK (number_of_tickets > 0),
    total_amount DECIMAL(10,2) NOT NULL CHECK (total_amount > 0),
    FOREIGN KEY (show_id) REFERENCES Shows(show_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);