# 1. Write a query to create a database named FilmFlex (Database)

create database if not exists Film_Flex;

as 

create database Film_Flex;

# 2. Write a query to redirect to database (Redirect Database)

use Film_Flex;

# 3. Write a query to create tables under the database Film_Flex (Create Tables)
CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    Title VARCHAR(100),
    Genre VARCHAR(50),
    Duration INT, -- in minutes
    Language VARCHAR(50),
    ReleaseDate DATE
);

CREATE TABLE Theaters (
    TheaterID INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(100)
);

CREATE TABLE Shows (
    ShowID INT PRIMARY KEY,
    MovieID INT,
    TheaterID INT,
    ShowDate DATE,
    ShowTime TIME,
    TicketPrice DECIMAL(10, 2),  -- Added TicketPrice
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (TheaterID) REFERENCES Theaters(TheaterID)
);

CREATE TABLE Seats (
    SeatID INT PRIMARY KEY,
    TheaterID INT,
    SeatNumber VARCHAR(10),
    IsAvailable BOOLEAN,
    FOREIGN KEY (TheaterID) REFERENCES Theaters(TheaterID)
);

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    UserID INT,
    ShowID INT,
    SeatID INT,
    BookingTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ShowID) REFERENCES Shows(ShowID),
    FOREIGN KEY (SeatID) REFERENCES Seats(SeatID)
);



# 4. Write a query to insert values into the table (Insert Command)
INSERT INTO Movies (MovieID, Title, Genre, Duration, Language, ReleaseDate) VALUES
(1, 'Inception', 'Sci-Fi', 148, 'English', '2010-07-16'),
(2, 'KGF Chapter 2', 'Action', 168, 'Kannada', '2022-04-14'),
(3, '3 Idiots', 'Comedy-Drama', 170, 'Hindi', '2009-12-25'),
(4, 'Bahubali: The Beginning', 'Epic Action', 159, 'Telugu', '2015-07-10'),
(5, 'Avengers: Endgame', 'Superhero', 181, 'English', '2019-04-26'),
(6, 'Vikram', 'Action Thriller', 175, 'Tamil', '2022-06-03'),
(7, 'Jailer', 'Action', 169, 'Tamil', '2023-08-10'),
(8, 'Spirited Away', 'Animation', 125, 'Japanese', '2001-07-20'),
(9, 'Interstellar', 'Sci-Fi', 169, 'English', '2014-11-07'),
(10, 'Dangal', 'Biography', 161, 'Hindi', '2016-12-23');

INSERT INTO Theaters (TheaterID, Name, Location) VALUES
(1, 'PVR Cinemas', 'Chennai'),
(2, 'INOX', 'Bangalore'),
(3, 'SPI Sathyam', 'Chennai'),
(4, 'Carnival Cinemas', 'Mumbai'),
(5, 'AGS Cinemas', 'Coimbatore'),
(6, 'Luxe Cinemas', 'Chennai'),
(7, 'Raj Cinemas', 'Trichy'),
(8, 'Vetri Theatres', 'Madurai'),
(9, 'Escape Cinemas', 'Chennai'),
(10, 'Fun Cinemas', 'Hyderabad');

INSERT INTO Shows (ShowID, MovieID, TheaterID, ShowDate, ShowTime, TicketPrice)
VALUES
(1, 1, 1, '2025-04-15', '14:00:00', 350.00),
(2, 1, 2, '2025-04-15', '17:00:00', 380.00),
(3, 2, 1, '2025-04-16', '10:30:00', 400.00),
(4, 2, 3, '2025-04-16', '13:00:00', 420.00),
(5, 3, 2, '2025-04-17', '12:00:00', 300.00),
(6, 3, 3, '2025-04-17', '15:30:00', 320.00),
(7, 4, 1, '2025-04-18', '11:00:00', 350.00),
(8, 5, 2, '2025-04-18', '16:00:00', 280.00),
(9, 6, 3, '2025-04-19', '18:30:00', 310.00),
(10, 7, 1, '2025-04-19', '20:00:00', 450.00);

INSERT INTO Seats (SeatID, TheaterID, SeatNumber, IsAvailable) VALUES
(1, 1, 'A1', TRUE),
(2, 1, 'A2', TRUE),
(3, 1, 'A3', FALSE),
(4, 2, 'B1', TRUE),
(5, 2, 'B2', TRUE),
(6, 2, 'B3', FALSE),
(7, 3, 'C1', TRUE),
(8, 3, 'C2', TRUE),
(9, 3, 'C3', TRUE),
(10, 4, 'D1', FALSE),
(11, 4, 'D2', TRUE),
(12, 4, 'D3', TRUE),
(13, 5, 'E1', TRUE),
(14, 5, 'E2', TRUE),
(15, 5, 'E3', FALSE),
(16, 6, 'F1', TRUE),
(17, 6, 'F2', TRUE),
(18, 7, 'G1', TRUE),
(19, 7, 'G2', FALSE),
(20, 8, 'H1', TRUE);

INSERT INTO Users (UserID, UserName, Email, Phone) VALUES
(1, 'Rixi', 'rixi@example.com', '9876543210'),
(2, 'Aarav', 'aarav123@gmail.com', '9123456780'),
(3, 'Meera', 'meera.k@outlook.com', '9988776655'),
(4, 'John', 'john.doe@example.com', '9090909090'),
(5, 'Anika', 'anika_01@yahoo.com', '9876512345'),
(6, 'Rahul', 'rahul.x@gmail.com', '9012345678'),
(7, 'Sahana', 'sahana@gmail.com', '9988123456'),
(8, 'David', 'david007@protonmail.com', '8901234567'),
(9, 'Priya', 'priya_b@gmail.com', '9098765432'),
(10, 'Karan', 'karan_kr@gmail.com', '9876001122');

INSERT INTO Bookings (BookingID, UserID, ShowID, SeatID, BookingTime) VALUES
(1, 1, 1, 3, '2025-04-14 10:15:00'),  -- Rixi booked A3 for Inception
(2, 2, 2, 6, '2025-04-14 11:00:00'),  -- Aarav booked B3 for KGF
(3, 3, 3, 7, '2025-04-14 11:30:00'),  -- Meera booked C1 for 3 Idiots
(4, 4, 4, 10, '2025-04-14 12:00:00'), -- John booked D1 for Bahubali
(5, 5, 5, 15, '2025-04-14 13:45:00'), -- Anika booked E3 for Avengers
(6, 6, 6, 16, '2025-04-14 14:00:00'), -- Rahul booked F1 for Vikram
(7, 7, 7, 18, '2025-04-14 15:10:00'), -- Sahana booked G1 for Jailer
(8, 8, 8, 20, '2025-04-14 15:45:00'), -- David booked H1 for Spirited Away
(9, 9, 9, 9,  '2025-04-14 16:30:00'), -- Priya booked C3 for Interstellar
(10, 10, 10, 14, '2025-04-14 17:00:00'); -- Karan booked E2 for Dangal

#5. Write a query to update values into the table (Update Command)

UPDATE Shows SET TicketPrice = 400.00
 WHERE ShowID = 3;

#6. Write a query to delete data from the table.
DELETE FROM Bookings 
WHERE BookingID = 5;
 
#7. Write a query to display the ShowID and calculate the PremiumPrice by adding 50 to the TicketPrice.
SELECT ShowID, TicketPrice + 50 AS PremiumPrice
FROM Shows;

#8. Write a query to display the MovieID and calculate the ExtendedDuration by doubling the Duration of Sci-Fi movies.
SELECT MovieID, Duration * 2 AS ExtendedDuration 
FROM Movies 
WHERE Genre = 'Sci-Fi';

#9.Write a query to display all records from the Shows table where the ShowDate is '2025-04-15' and the TicketPrice is greater than 300.
SELECT * FROM Shows 
WHERE ShowDate = '2025-04-15' AND TicketPrice > 300;

#10. Retrieve all user details where the phone number starts with '98'.
SELECT * FROM Users 
WHERE Phone LIKE '98%';

#11. Retrieve all user details where the username starts with the letter 'A' using a regular expression.
SELECT * FROM Users 
WHERE UserName REGEXP '^A.*';

#12. Retrieve all show details and sort them in descending order of ticket price.
SELECT * FROM Shows 
ORDER BY TicketPrice DESC;

#13. Count the number of shows where the ticket price is greater than 350.
SELECT COUNT(*) AS ExpensiveShows 
FROM Shows 
WHERE TicketPrice > 350;

#14. Find the average ticket price of shows scheduled on '2025-04-15'.
SELECT AVG(TicketPrice) 
FROM Shows 
WHERE ShowDate = '2025-04-15';

#15. Retrieve the title and duration (with an alias as 'MovieDuration') of all Sci-Fi movies.
SELECT Title, Duration AS MovieDuration 
FROM Movies 
WHERE Genre = 'Sci-Fi';

#16. Group the movies by genre and count the number of movies in each genre
SELECT Genre, COUNT(*) 
FROM Movies 
GROUP BY Genre;

#17. Group the shows by ShowID and find the average ticket price for each show, but only include shows where the average ticket price is greater than 300.
SELECT ShowID, AVG(TicketPrice) 
FROM Shows 
GROUP BY ShowID 
HAVING AVG(TicketPrice) > 300;

#18. Retrieve all movie details where the MovieID exists in the list of shows with a ticket price greater than 350.
SELECT * FROM Movies 
WHERE MovieID IN 
(SELECT MovieID FROM Shows WHERE TicketPrice > 350);

#19. Retrieve the title of each movie along with the average ticket price for the corresponding shows of that movie.
SELECT Title, (SELECT AVG(TicketPrice) 
FROM Shows 
WHERE MovieID = Movies.MovieID) AS AveragePrice 
FROM Movies;

#20. Retrieve the ShowID, Movie Title, and TicketPrice by performing an inner join between the Shows and Movies tables based on the MovieID.
SELECT Shows.ShowID, Movies.Title, Shows.TicketPrice
FROM Shows
INNER JOIN Movies ON Shows.MovieID = Movies.MovieID;

#21. Retrieve show details along with the number of days left until the show, for shows scheduled in the future.
SELECT ShowID, ShowDate, 
DATEDIFF(ShowDate, CURRENT_DATE) AS DaysLeft
FROM Shows
WHERE ShowDate >= CURRENT_DATE;

#22. Retrieve the UserID and the username in uppercase for all users.
SELECT UserID, UPPER(UserName) AS UpperCaseName 
FROM Users;

#23. Retrieve the minimum and maximum ticket prices from the Shows table.
SELECT 
MIN(TicketPrice) AS MinPrice,
MAX(TicketPrice) AS MaxPrice
FROM Shows;

#24. Retrieve seat numbers and mark them as "Booked" or "Available" based on the availability status.
SELECT SeatNumber,
    CASE 
        WHEN IsAvailable = TRUE THEN 'Available'
        ELSE 'Booked'
    END AS SeatStatus
FROM Seats;

#25. Rank shows based on their ticket price, from highest to lowest.
SELECT 
    ShowID,
    MovieID,
    TheaterID,
    TicketPrice,
    RANK() OVER (ORDER BY TicketPrice DESC) AS PriceRank
FROM Shows;















