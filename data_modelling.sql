CREATE TABLE Delay (
    delay_id INT IDENTITY(1, 1) PRIMARY KEY,
    departure_delay INT,
    arrival_delay INT
);


UPDATE Flight_Data
SET 
    Flight_Data.delay_id = d.delay_id
FROM 
    Delay d
WHERE 
    (Flight_Data.departure_delay = d.departure_delay OR (Flight_Data.departure_delay IS NULL AND d.departure_delay IS NULL)) AND 
    (Flight_Data.arrival_delay = d.arrival_delay OR (Flight_Data.arrival_delay IS NULL AND d.arrival_delay IS NULL));


SELECT * FROM Flight_Data;

SELECT * FROM DELAY;

ALTER TABLE Flight_Data
DROP COLUMN departure_delay, arrival_delay;

CREATE TABLE Airport(
	airport_id INT IDENTITY(1, 1) PRIMARY KEY,
	departure_airport VARCHAR(100),
	arrival_airport VARCHAR(100));


ALTER TABLE Flight_Data ADD airport_id INT;

INSERT INTO Airport(departure_airport, arrival_airport)
SELECT DISTINCT departure_airport, arrival_airport
FROM Flight_Data;

SELECT * FROM Airport;
SELECT DISTINCT * FROM Flight_Data;

UPDATE Flight_Data
SET 
    Flight_Data.airport_id = a.airport_id
FROM 
    Airport a
WHERE 
    (Flight_Data.departure_airport = a.departure_airport OR (Flight_Data.departure_airport IS NULL AND a.departure_airport IS NULL)) AND 
    (Flight_Data.arrival_airport = a.arrival_airport OR (Flight_Data.arrival_airport IS NULL AND a.arrival_airport IS NULL));

ALTER TABLE Flight_Data
DROP COLUMN departure_airport, arrival_airport;

CREATE TABLE Departure (
	departure_id INT IDENTITY(1, 1) PRIMARY KEY,
	departure_continent VARCHAR(100),
	departure_city VARCHAR(100));

ALTER TABLE Flight_Data ADD departure_id INT;

INSERT INTO Departure(departure_continent, departure_city)
SELECT DISTINCT departure_continent, departure_city
FROM Flight_Data;

SELECT * FROM Departure;
SELECT * FROM Flight_Data;

UPDATE Flight_Data
SET 
    Flight_Data.departure_id = d1.departure_id
FROM 
    Departure d1
WHERE 
    (Flight_Data.departure_continent = d1.departure_continent OR (Flight_Data.departure_continent IS NULL AND d1.departure_continent IS NULL)) AND 
    (Flight_Data.departure_city = d1.departure_city OR (Flight_Data.departure_city IS NULL AND d1.departure_city IS NULL));

ALTER TABLE Flight_Data
DROP COLUMN departure_continent, departure_city;

CREATE TABLE Arrival (
	arrival_id INT IDENTITY(1, 1) PRIMARY KEY,
	arrival_continent VARCHAR(100),
	arrival_city VARCHAR(100));

ALTER TABLE Flight_Data ADD arrival_id INT;

INSERT INTO Arrival(arrival_continent, arrival_city)
SELECT DISTINCT arrival_continent, arrival_city
FROM Flight_Data;

SELECT * FROM Arrival;
SELECT * FROM Flight_Data;

UPDATE Flight_Data
SET 
    Flight_Data.arrival_id = a1.arrival_id
FROM 
    Arrival a1
WHERE 
    (Flight_Data.arrival_continent = a1.arrival_continent OR (Flight_Data.arrival_continent IS NULL AND a1.arrival_continent IS NULL)) AND 
    (Flight_Data.arrival_city = a1.arrival_city OR (Flight_Data.arrival_city IS NULL AND a1.arrival_city IS NULL));

ALTER TABLE Flight_Data
DROP COLUMN arrival_continent, arrival_city;

CREATE TABLE Flight (
	flight_id INT IDENTITY(1, 1) PRIMARY KEY,
	flight_date date,
	flight_status VARCHAR(50));

ALTER TABLE Flight_Data ADD flight_id INT;

INSERT INTO Flight(flight_date, flight_status)
SELECT DISTINCT flight_date, flight_status
FROM Flight_Data;

SELECT * FROM Flight;
SELECT * FROM Flight_Data;

UPDATE Flight_Data
SET 
    Flight_Data.flight_id = f.flight_id
FROM 
    Flight f
WHERE 
    (Flight_Data.flight_date = f.flight_date OR (Flight_Data.flight_date IS NULL AND f.flight_date IS NULL)) AND 
    (Flight_Data.flight_status = f.flight_status OR (Flight_Data.flight_status IS NULL AND f.flight_status IS NULL));

ALTER TABLE Flight_Data
DROP COLUMN flight_date, flight_status;

ALTER TABLE Flight_Data
DROP COLUMN departure, arrival, airline, flight, departure_timezone, arrival_timezone;

CREATE TABLE Flight_Final (
    id INT IDENTITY(1, 1) PRIMARY KEY,
	flight_id INT,
	airline_name VARCHAR(50),
	live VARCHAR(200),
	airport_id INT,
	departure_id INT,
	arrival_id INT,
	delay_id INT
);

INSERT INTO Flight_Final(flight_id, airline_name, live, airport_id, departure_id, arrival_id, delay_id)
SELECT flight_id, airline_name, live, airport_id, departure_id, arrival_id, delay_id
FROM Flight_Data;

ALTER TABLE Flight_Final
ADD FOREIGN KEY(flight_id)
REFERENCES Flight(flight_id);

ALTER TABLE Flight_Final
ADD FOREIGN KEY(airport_id)
REFERENCES Airport(airport_id);

ALTER TABLE Flight_Final
ADD FOREIGN KEY(departure_id)
REFERENCES Departure(departure_id);

ALTER TABLE Flight_Final
ADD FOREIGN KEY(arrival_id)
REFERENCES Arrival(arrival_id);

ALTER TABLE Flight_Final
ADD FOREIGN KEY(delay_id)
REFERENCES Delay(delay_id);