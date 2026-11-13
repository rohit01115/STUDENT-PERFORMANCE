use stuperf;
create table perf2(
student_id INT AUTO_INCREMENT PRIMARY KEY,
    school VARCHAR(5),
    sex VARCHAR(5),
    age INT,
    address VARCHAR(5),
    famsize VARCHAR(10),
    Pstatus VARCHAR(5),
    Medu INT,
    Fedu INT,
    Mjob VARCHAR(30),
    Fjob VARCHAR(30),
    reason VARCHAR(30),
    guardian VARCHAR(20),
    traveltime INT,
    studytime INT,
    failures INT,
    schoolsup VARCHAR(5),
    famsup VARCHAR(5),
    paid VARCHAR(5),
    activities VARCHAR(5),
    nursery VARCHAR(5),
    higher VARCHAR(5),
    internet VARCHAR(5),
    romantic VARCHAR(5),
    famrel INT,
    freetime INT,
    goout INT,
    Dalc INT,
    Walc INT,
    health INT,
    absences INT,
    G1 INT,
    G2 INT,
    G3 INT
);
select count(*) from perf2;
select * from perf2;
select school ,sex,age,g3 from perf2;
select avg(g3) from perf2;
select max(g3), min(g3) from perf2;
select * from perf2 where age> 18;
select * from perf2 where g3 > 15;
select address from perf2 where address ='U' ;
select * from perf2 where g3>= 10;
select * from perf2 order by student_id desc;
select * from perf2 where absences>5;
select * from perf2 where internet = 'yes';
select * from perf2 where failures=0;
select * from perf2 order by g3 desc limit 10;
select * from perf2 where studytime >=4;
select sex,count(*) from perf2 group by sex;
select sex,avg(g3) from perf2 group by sex;
select school,avg(g3) from perf2 group by school;
select age,count(*) from perf2 group by age;
select studytime, avg(g3) from perf2 group by studytime;
select case when g3>=10 then 'pass' else 'fail'end as result,count(*) from perf2 group by result;
select avg(g3),failures from perf2 group by failures;
select school,avg(g3) from perf2 group by school having avg(g3)>11;
select absences from perf2 order by absences desc limit 5;
select g1,g2,g3 from perf2 where g1>15;
select *from perf2 where absences >10 having g3<10;
select avg(g3) ,internet from perf2 group by internet;
---------------------------------------- 
SELECT
    COUNT(CASE WHEN G3 >= 10 THEN 1 END) * 100.0
    / COUNT(*) AS pass_percentage
FROM perf2;


-- Q28: Categorize students using CASE

SELECT
    student_id,
    G3,
    CASE
        WHEN G3 >= 15 THEN 'Excellent'
        WHEN G3 >= 10 THEN 'Pass'
        ELSE 'Fail'
    END AS performance
FROM perf2;


-- Q30: Find duplicate student records

SELECT
    school, sex, age, address, famsize,
    Pstatus, Medu, Fedu, Mjob, Fjob,
    reason, guardian, traveltime, studytime,
    failures, schoolsup, famsup, paid,
    activities, nursery, higher, internet,
    romantic, famrel, freetime, goout,
    Dalc, Walc, health, absences,
    G1, G2, G3,
    COUNT(*) AS duplicate_count
FROM perf2
GROUP BY
    school, sex, age, address, famsize,
    Pstatus, Medu, Fedu, Mjob, Fjob,
    reason, guardian, traveltime, studytime,
    failures, schoolsup, famsup, paid,
    activities, nursery, higher, internet,
    romantic, famrel, freetime, goout,
    Dalc, Walc, health, absences,
    G1, G2, G3
HAVING COUNT(*) > 1;
