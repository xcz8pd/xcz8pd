Part 1:
-- World Database

1. SELECT Name FROM country WHERE Continent = 'South America';

2. SELECT Population from country WHERE Name = 'Germany';

3. SELECT Name from city where CountryCode = 'JPN';

4. SELECT Name, Population FROM country WHERE Region = 'Central Africa'
ORDER BY Population DESC
LIMIT 3;

5. SELECT Name, LifeExpectancy FROM country WHERE Population > 1000000 and Population < 5000000;

6. SELECT country.Name FROM country
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'French' AND countrylanguage.IsOfficial = 'T';


-- Chinook Database
7. SELECT Album.Title from Album
JOIN Artist on Album.ArtistID = Artist.ArtistID
WHERE Artist.Name = 'AC/DC';

8. SELECT FirstName, LastName, Email FROM Customer WHERE Country = 'Brazil';

9. SELECT Name FROM Playlist;

10. SELECT COUNT(TrackID) from Track
JOIN Genre ON Track.GenreId = Genre.GenreId
WHERE Genre.Name = 'Rock';

11. SELECT FirstName, LastName FROM Employee WHERE ReportsTo = (SELECT EmployeeId FROM Employee WHERE FirstName = 'Nancy' and LastName = 'Edwards');

12. SELECT Customer.FirstName, Customer.LastName, Sum(Total) AS TotalSales
from Invoice
JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
GROUP BY Invoice.CustomerId;

Part 2:
1. CREATE DATABASE xcz8pd
## my small business is a garden design company and my three tables will provide information about my clients, projects, and plants.

2. CREATE TABLE clients (
    clientID int NOT NULL,
    firstname VARCHAR(40) NOT NULL,
    lastname VARCHAR(40) NOT NULL,
    phonenumber VARCHAR(15),
    email VARCHAR(50),
    PRIMARY KEY (clientID)
);

CREATE TABLE projects (
    projectID int NOT NULL,
    projectname VARCHAR(100) NOT NULL,
    clientID int NOT NULL,
    budget DECIMAL(10,2) NOT NULL,
    deadline DATE,
    surface_area VARCHAR(25)
    PRIMARY KEY (projectID)
    FOREIGN KEY (clientID) REFERENCES clients(clientID)
);

CREATE TABLE plants (
    plantID int NOT NULL,
    plantname VARCHAR(100) NOT NULL,
    projectID int NOT NULL,
    quantity int NOT NULL,
    price_per_plant DECIMAL(10,2) NOT NULL
    PRIMARY KEY (plantID)
    FOREIGN KEY (projectID) REFERENCES projects(projectID)
);

3. INSERT INTO clients (clientID, firstname, lastname, phonenumber, email)
VALUES
(1, 'John', 'Smith', '732-908-7435', 'johnsmith@gmail.com'),
(2, 'Mary', 'Jane', '403-555-5678', 'maryjane@gmail.com'),
(3, 'Michael', 'Johnson', '201-222-8765', 'mikejohnson@gmail.com'),
(4, 'Avery', 'Davis', '802-544-4321', 'averydavis@gmail.com'),
(5, 'Benjamin', 'Clark', '320-1187-6789', 'benclark@gmail.com');

INSERT INTO projects (projectID, projectname, clientID, budget, deadline, surface_area)
VALUES
(1, 'Backyard Garden Design', 1, 5500.00, '2024-09-12', '2,600 sq ft'), 
(2, 'Rooftop Landscaping', 2, 8000, '2025-01-04', '3,500 sq ft'), 
(3, 'Town Park Renovation', 3, 7500, '2024-10-15', '9,000 sq ft'),
(4, 'City Urban Garden', 4, 10000, '2025-06-01', '5,380 sq ft'),
(5, 'Scenic Terrace', 5, 25300.50, '2025-04-10', '6,250 sq ft');

INSERT INTO plants (plantID, projectID, plantname, price_per_plant, quantity)
VALUES
(1, 2, 'Hydrangea', 40.31, 5), 
(2, 3, 'Lavender', 15.50, 10), 
(3, 3, 'Hosta', 30.00, 4),
(4, 5, 'Sunflower', 12.21, 8),
(5, 1, 'Begonia', 36.99, 10);

4. SELECT projectname from projects WHERE budget BETWEEN 7000 and 11000;

SELECT firstname, lastname from clients
JOIN projects on clients.clientID = projects.clientID
WHERE projects.deadline = '2025-01-04';

SELECT plantname, quantity, price_per_plant, (quantity * price_per_plant) AS totalcost
FROM plants;
