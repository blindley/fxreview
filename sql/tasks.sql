-- 1. Display distinct classname.
SELECT DISTINCT classname FROM alamoclass;

-- 2. Display distinct classname & number of provided classes.
SELECT classname, COUNT(*) FROM alamoclass GROUP BY classname;

-- 3. Display distinct classname & total capacity from largest to smallest.
SELECT classname, SUM(capacity) FROM alamoclass GROUP BY classname;

-- 4. Display campus with total capacity > 50.
SELECT campus FROM alamoclass GROUP BY campus HAVING SUM(capacity) > 50;

-- 5. Display campus provide more than 3 class.
SELECT campus FROM alamoclass GROUP BY campus HAVING COUNT(*) > 3;

-- 6. Display maximum capacity of coursenumber.
SELECT coursenumber, capacity FROM alamoclass
    WHERE capacity = (SELECT MAX(capacity) FROM alamoclass);

-- 7. Add a new course with {coursenumber: CS10024, classname: Cyber Security, campus: Palo Alto College, capacity: 50}.
INSERT INTO alamoclass (coursenumber, classname, campus, capacity)
    VALUES ('CS10024', 'Cyber Security', 'Palo Alto College', 50);

-- 8. Increase capacity of Northeast Lakeview College's 'Intro to Database' classes to 50.
UPDATE alamoclass SET capacity=50 WHERE campus='Northeast Lakeview College' AND classname='Intro to Database'; 

-- 9. Remove 'Intro to Database' from Palo Alto College.
DELETE FROM alamoclass WHERE classname='Intro to Database' AND campus='Palo Alto College';

-- 10. Add new 'Semester' column with length of 20 and default value of 'Fall 2020'.
ALTER TABLE alamoclass ADD Semester VARCHAR(20) DEFAULT 'Fall 2020';
