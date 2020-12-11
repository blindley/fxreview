DROP TABLE IF EXISTS passengers;
DROP TABLE IF EXISTS flights;

-- 1. Write SQL statements to create flights and passengers tables
CREATE TABLE flights (id SERIAL PRIMARY KEY, origin VARCHAR, destination VARCHAR, duration INTEGER);
INSERT INTO flights (origin, destination, duration) VALUES
    ('New York', 'London', 415), ('Shanghai', 'Paris', 760), ('Istanbul', 'Tokyo', 700),
    ('New York', 'Paris', 435), ('Moscow', 'Paris', 245), ('Lima', 'New York', 455);

CREATE TABLE passengers (id SERIAL PRIMARY KEY, name VARCHAR, flight_id INTEGER,
    FOREIGN KEY(flight_id) REFERENCES flights(id));
INSERT INTO passengers (name, flight_id) VALUES
    ('Alice', 1), ('Bob', 1), ('Charlie', 2), ('Dave', 2),
    ('Erin', 4), ('Frank', 6), ('Grace', 6);

/*
for f in [('New York', 'London', 415), ('Shanghai', 'Paris', 760), ('Istanbul', 'Tokyo', 700), ('New York', 'Paris', 435), ('Moscow', 'Paris', 245), ('Lima', 'New York', 455)]:
    flight = Flight(origin=f[0], destination=f[1], duration=f[2])
    db.session.add(flight)

for p in [('Alice', 1), ('Bob', 1), ('Charlie', 2), ('Dave', 2), ('Erin', 4), ('Frank', 6), ('Grace', 6)]:
    passenger = Passenger(name=p[0], flight_id=p[1])
    db.session.add(passenger)
*/
