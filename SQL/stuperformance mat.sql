CREATE DATABASE STUPERF;
USE STUPERF;
create table PERF (
    school VARCHAR(10),
    sex VARCHAR(5),
    age INT,
    address VARCHAR(10),
    famsize VARCHAR(10),
    Pstatus VARCHAR(10),
    Medu INT,
    Fedu INT,
    Mjob VARCHAR(30),
    Fjob VARCHAR(30),
    reason VARCHAR(30),
    guardian VARCHAR(20),
    traveltime INT,
    studytime INT,
    failures INT,
    schoolsup VARCHAR(10),
    famsup VARCHAR(10),
    paid VARCHAR(10),
    activities VARCHAR(10),
    nursery VARCHAR(10),
    higher VARCHAR(10),
    internet VARCHAR(10),
    romantic VARCHAR(10),
    famrel INT,
    freetime INT,
    goout INT,
    Dalc INT,
    Walc INT,
    health INT,
    absences INT,
    G1 INT,
    G2 INT,
    G3 INT,
    `Total` INT,
    `Percentage` DECIMAL(10,2)
);
describe perf;
select * from perf;
select count(*) from perf;
ALTER TABLE perf
ADD COLUMN student_id INT FIRST;
ALTER TABLE perf
MODIFY COLUMN student_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY;
-------------------------------------------- 
SET SQL_SAFE_UPDATES = 0;
UPDATE perf
SET Total = G1 + G2 + G3;
UPDATE perf
SET Percentage = (Total / 60) * 100;
SET SQL_SAFE_UPDATES = 1;
-------------------------------------------- 
select avg(G3) as averagegrade from perf;
select max(G3) as maxgrade from perf;
select min(G3) as mingrade from perf;
select * from perf where g3> 15;
select count(*) from perf where g3> 15;
select * from perf where age> 18;
SELECT sex, COUNT(*) AS total FROM perf GROUP BY sex;
SELECT sex, avg(g3) AS avgmark FROM perf GROUP BY sex;
select * from perf order by g3 desc limit 10;
select count(*) as passedstud from perf where g3>= 10;
select count(*) as failedstud from perf where g3< 10;
SELECT studytime, AVG(G3) AS average_grade FROM perf GROUP BY studytime ORDER BY studytime;
select percentage as passpercentage from perf where percentage> 45 ;
select * from perf where percentage> 45 ;
select * from perf where absences>10;
select school, avg(g3) from perf group by school;
select * from perf where failures = 0;
select failures, avg(g3) from perf group by failures;	
select * from perf order by absences desc limit 1;
------------------------------------ 
SELECT
    CASE
        WHEN G3 >= 15 THEN 'Excellent'
        WHEN G3 >= 10 THEN 'Pass'
        ELSE 'Fail'
    END AS performance,
    COUNT(*) AS total_students
FROM perf
GROUP BY performance;
------------------------------------- 
select studytime,avg(g3) from perf group by studytime having avg(g3)>10;
select count(*) from perf where total>15;
------------------------------------- 
SELECT
    school, sex, age, address, famsize, Pstatus,
    Medu, Fedu, Mjob, Fjob, reason, guardian,
    traveltime, studytime, failures, schoolsup,
    famsup, paid, activities, nursery, higher,
    internet, romantic, famrel, freetime, goout,
    Dalc, Walc, health, absences, G1, G2, G3,
    Total, Percentage,
    COUNT(*) AS duplicate_count
FROM perf
GROUP BY
    school, sex, age, address, famsize, Pstatus,
    Medu, Fedu, Mjob, Fjob, reason, guardian,
    traveltime, studytime, failures, schoolsup,
    famsup, paid, activities, nursery, higher,
    internet, romantic, famrel, freetime, goout,
    Dalc, Walc, health, absences, G1, G2, G3,
    Total, Percentage
HAVING COUNT(*) > 1;
------------------------------------------------ 
select count(*) as missinggrade from perf where g3 is null;
---------------------------- 
select count(*) from perf where g3 >12;
select avg(absences) from perf;
select * from perf order by percentage desc limit 5;
select school,count(*)  from perf group by school;
select absences, g3 from perf where g3<10 having absences> 5;
