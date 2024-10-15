SELECT * FROM Flight_Final AS f
INNER JOIN Flight AS f1 ON f.flight_id = f1.flight_id
INNER JOIN Airport AS a ON f.airport_id = a.airport_id
INNER JOIN Departure AS d ON f.departure_id = d.departure_id
INNER JOIN Arrival AS a1 ON f.arrival_id = a1.arrival_id
INNER JOIN Delay AS d1 ON f.delay_id = d1.delay_id;

-- E.g if we wanna retrieve data back from other ile we can do like that below.
SELECT f.flight_id, flight_date, flight_status, airline_name, live, airport_id, departure_id, arrival_id, delay_id FROM Flight_Final AS f
INNER JOIN Flight AS f1 ON f.flight_id = f1.flight_id;