DROP TABLE IF EXISTS alamoclass;

CREATE TABLE alamoclass (
    id SERIAL PRIMARY KEY,
    coursenumber VARCHAR,
    classname VARCHAR,
    campus VARCHAR,
    capacity INTEGER
);

INSERT INTO alamoclass (coursenumber, classname, campus, capacity) VALUES
    ('CS1001', 'Java Programming', 'San Antonio College', 80),
    ('CS1002', 'Java Programming', 'Northwest Vista College', 500),
    ('CS1003', 'Java Programming', 'Palo Alto College', 40),
    ('CS1004', 'Java Programming', 'St. Philips College', 20),
    ('CS1005', 'Java Programming', 'Northeast Lakeview College', 10),

    ('CS1006', 'Intro to C++', 'San Antonio College', 60),
    ('CS1007', 'Intro to C++', 'Northwest Vista College', 20),
    ('CS1008', 'Intro to C++', 'Northeast Lakeview College', 20),
    ('CS1009', 'Intro to C++', 'St. Philips College', 20),
    
    ('CS10010', 'Software Engineering', 'San Antonio College', 20),
    ('CS10011', 'Software Engineering', 'Palo Alto College', 20),
    ('CS10012', 'Software Engineering', 'Northeast Lakeview College', 10),
    
    ('CS10013', 'Web Design', 'San Antonio College', 20),
    ('CS10014', 'Web Design', 'Palo Alto College', 30),
    ('CS10015', 'Web Design', 'Northwest Vista College', 40),
    
    ('CS10016', 'Networking', 'San Antonio College', 20),
    ('CS10017', 'Networking', 'St. Philips College', 20),

    ('CS10018', 'Python', 'Northwest Vista College', 20),
    ('CS10019', 'Python', 'Northwest Vista College', 20),
    
    ('CS10020', 'Intro to Database', 'Palo Alto College', 20),
    ('CS10021', 'Intro to Database', 'Northeast Lakeview College', 20),
    ('CS10022', 'Intro to Database', 'Northeast Lakeview College', 20),

    ('CS10023', 'Cyber Security', 'San Antonio College', 100)
;
