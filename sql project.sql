use college_management;

CREATE TABLE admissions(a_id INT,FOREIGN KEY(a_id) REFERENCES students(s_id),s_name VARCHAR(50),mobile_number VARCHAR(90),mail_id VARCHAR(50),city VARCHAR(50) DEFAULT 'Bangalore',state VARCHAR(50) DEFAULT 'Karnataka',course_enrolled VARCHAR(50) ,admission_date DATE,admission_time TIME,entrance_rank INT);
INSERT INTO admissions(a_id,s_name,mobile_number,mail_id,course_enrolled,admission_date,admission_time,entrance_rank) 
VALUES (1,"pavan vaccha","8500311211","pavanvaccha@gmail.com","mba","2015-07-11","11:12:10",324),
	   (2,"purushotham gayam","9870001283","purushotham123@gmail.com","mba","2014-08-12","09:15:55",90),
       (3,"prem kumar","9098087000","premkumar@gmail.com","bsc","2013-06-10","10:15:40",158),
       (4,"karthik tirupati ","8709990004","karthik123@gmail.com","mtech","2015-09-09","14:30:55",674),
       (5,"rahul george","8767819233","rahul111@gmail.com","btech","2014-06-26","15:20:30",1245),
       (6,"tarak kumar","7655678909","tarakkumar@gmail.com","mca","2013-05-07","16:30:42",256),
       (7,"pooja devi","7893450908","pooja123@gmail.com","bzc","2016-04-08","12:10:08",512),
       (8,"hema latha","7655712834","hemalatha1@gmail.com","bcom","2017-08-05","08:10:42",498),
       (9,"vignesh galla","9993331110","vignesh99@gmail.com","mtech","2016-04-17","13:25:35",775),
       (10,"amar ganta","7775553331","amar123@gmail.com","btech","2017-09-19","17:05:32",834);
select * from admissions;
SELECT CONCAT(fname,lname),s_id  FROM students LEFT JOIN admissions ON students.s_id=admissions.a_id;
SELECT CONCAT(fname,lname),s_id FROM students RIGHT JOIN admissions ON students.s_id=admissions.a_id;
SELECT * FROM students UNION  SELECT s_name,a_id FROM admissions;
select * from students right join admissions on students.s_id=admissions.a_id union select * from students left join admissions on students.s_id=admissions.a_id;


create table students(s_id int not null auto_increment,primary key(s_id),fname varchar(50),lname varchar(50),gender varchar(50),degree varchar(50),course varchar(50),attendence int,percentage int,mobile_number varchar(90),mail_id varchar(50));
insert into students(fname,lname,gender,degree,course,attendence,percentage,mobile_number,mail_id)
values("pavan","vaccha","male","pg","mba",88,78,"8500311211","pavanvaccha@gmail.com"),
	  ("purushotham","gayam","male","pg","mba",88,83,"9870001283","purushotham123@gmail.com"),
	  ("prem","kumar","male","ug","bsc",78,84,"9098087000","premkumar@gmail.com"),
	  ("karthik","tirupati","male","pg","mtech",85,74,"8709990004","karthik123@gmail.com"),
	  ("rahul","george","male","ug","btech",85,78,"8767819233","rahul111@gmail.com"),
	  ("tarak","kumar","male","pg","mca",86,83,"7655678909","tarakkumar@gmail.com"),
	  ("pooja","devi","female","ug","bzc",87,93,"7893450908","pooja123@gmail.com"),
	  ("hema","latha","female","ug","bcom",76,89,"7655712834","hemalatha1@gmail.com"),
	  ("vignesh","galla","male","pg","mtech",75,67,"9993331110","vignesh99@gmail.com"),
	  ("amar","ganta","male","ug","btech",82,64,"7775553331","amar123@gmail.com");
select * from students;
INSERT INTO students(fname,lname,gender,degree,course,attendence,percentage,mobile_number,mail_id) 
VALUES ("suriya","sivakumar","male","ug","btech",76,84,"7775553674","suriya123@gmail.com"),
		("vikram","kumar","male","pg","mtech",82,79,"8976943331","vikram546@gmail.com");
select concat_ws(" ",fname,lname) as "students who have 80-90 percentage and attendance more than 80" from students where (percentage between 80 and 90) and attendence>80 ;
select count(fname) as "No. of students who took MBA COURSE" from students where  course="mba";
select gender,count(gender) as "No. of Male & Female students" from students group by gender;
update students set course="Bsc"  where s_id=7;
select fname from students where fname like "p%";


create table teaching_faculty(fid int not null auto_increment,primary key(fid),faculty_name varchar(80),department varchar(90),qualification varchar(90),designation varchar(90),doj date,experiance int,salary int);
insert into teaching_faculty(faculty_name,department,qualification,designation,doj,experiance,salary)
values("N.SUDHAKAR REDDY","CSE","M.Tech.,Ph.D.","PROFESSOR & PRINCIPAL","2015-06-23",10,65000),
	  ("R.SWATHI","EEE","M.Tech., Ph.D.","PROFESSOR","2018-01-12",5,30000),
      ("A.SIVAPRASAD","CSE","M.Tech., Ph.D.","PROFESSOR","2019-03-11",2,25000),
      ("M.VIKRAM","ME","M.Tech.","ASSISTANT PROFESSOR","2020-02-11",1,20000),
      ("V.GOWRI","IT","M.Tech.","ASSISTANT PROFESSOR","2017-03-15",4,27000),
      ("P.LIYAZ","MBA","MBA,(Ph.D)","ASSISTANT PROFESSOR","2023-01-02",0,20000),
      ("N.Venkateswara Reddy","MBA","MBA, (Ph.D)","ASSISTANT PROFESSOR","2010-09-12",10,35000),
      ("P.SAILAKSHMI","MBA","MBA, (Ph.D)","ASSISTANT PROFESSOR","2018-12-03",5,30000),
      ("P. SUBRAMANYACHARY","MBA","MBA,MA,BL,Ph.D","PROFESSOR & HOD","2019-04-26",9,43000),
      ("P.SURESH","EEE","Ph.D","ASSISTANT PROFESSOR","2016-07-27",6,33000);
select * from teaching_faculty;
select faculty_name,doj from teaching_faculty where doj between "2019-01-01" and "2023-01-01";
select faculty_name,designation from teaching_faculty where experiance in (select max(experiance) from teaching_faculty);
select designation,department,salary from teaching_faculty where designation="assistant professor" and department="eee";
select fid,find_in_set(faculty_name,"P. SUBRAMANYACHARY") from teaching_faculty;
select faculty_name,salary from teaching_faculty order by salary desc limit 3;


create table nonteaching_faculty(ntf_id int not null auto_increment,primary key(ntf_id),name varchar(90), department varchar(90),designation varchar(90),salary int);
insert into nonteaching_faculty(name,department,designation,salary)
values("S.RAVI","ADMIN OFFICE","HR MANAGER",23000),
	  ("K.HARSHA","ACCOUNTS OFFICE","ACCOUNTANT",22000),
      ("L.DHAMODHAR","BOYS HOSTEL","WARDEN",21000),
      ("A.TEJASWINI","GIRLS HOSTEL","WARDEN",21000),
      ("L.SUBRAMANYAM","CANTEEN","CANTEEN INCHARGE",25000),
      ("O.VASANTH","TRANSPORT","SUPERVISOR",23000),
      ("M.LAKSHMI","ADMIN OFFICE","RECEPTIONIST",26000),
      ("N.RAJA","ADMIN OFFICE","AO",28000),
      ("T.SUNDAR","BOYS HOSTEL","HOSTEL INCHARGE",23000),
      ("E,VARMA","ADMIN OFFICE","Sr.ASSISTANT",30000);
SELECT * FROM NONTEACHING_FACULTY;
select name,ascii(lower(name)) as "These are the ascii values of NAMES which is in lowercase" from nonteaching_faculty limit 4;
select avg(salary) from nonteaching_faculty where salary<(select avg(salary) from nonteaching_faculty);
select name from nonteaching_faculty where name in ( "O.VASANTH","M.LAKSHMI");
select name,substr(name,char_length(name)/2,1) as "middle of character of NAME who having salary more than 23000" from nonteaching_faculty where salary>23000;
select designation from NONTEACHING_FACULTY where department="admin office";


create table departments(d_id int not null auto_increment,primary key(d_id),degree varchar(90),d_name varchar(90),d_code varchar(90),duration varchar(90),fee int);
insert into departments(degree,d_name,d_code,duration,fee)
values("B.TECH","COMPUTER SCIENCE & ENGINEERING","CSE","4 YEARS",80000),
	  ("B.TECH","ELECTRONIS & COMMUNICATION ENGINEERING","ECE","4 YEARS",75000),
      ("B.TECH","ELECTRICAL & ELECTRONIS ENGINEERING","EEE","4 YEARS",78000),
      ("B.TECH","INFORMATION TECHONOLY","IT","4 YEARS",60000),
      ("B.TECH","MECHANICAL ENGINEERING","ME","4 YEARS",65000),
      ("PG","MASTER OF BUSINESS ADMINISTRATION","MBA","2 YEARS",50000),
      ("PG","MASTER OF COMPUTER APPLICATIONS","MCA","2 YEARS",45000),
      ("M.TECH","COMPUTER SCIENCE & ENGINEERING","CSE","2 YEARS",65000),
      ("B.TECH","CVIL ENGINEERING","CIV","4 YEARS",70000),
      ("B.TECH","COMPUTER SCIENCE & ENGINEERING","CSC","4 YEARS",70000);
SELECT * FROM DEPARTMENTS;
alter table departments add column entrance_rank int;
update departments set entrance_rank=834 where d_id=10;
select degree,fee,entrance_rank, if(entrance_rank between 1 and 150,(30/100*fee),fee) as "30% concession is given for the students who's rank between 1 to 150" from departments;
select distinct(degree),duration from departments;
select distinct(degree),d_name from departments;
select min(fee) from departments;


create table job_openings(j_id int not null auto_increment,primary key(j_id), position varchar(90),qualification varchar(90),experiance int);
insert into job_openings(position,qualification,experiance)
values("DIRECTOR/DEAN/PRINIPAL"," Ph.D./M.Tech./ME & B.Tech./ BE",10),
	  ("TRAINING & PLACEMENT OFFICER","MBA / M.Tech",08),
      ("PROFESSOR/HOD","Ph.D./M.Tech./ME & B.Tech./ BE",05),
      ("ASSOCIATE PROFESSOR","Ph.D./M.Tech./ME & B.Tech./ BE",03),
      ("LIBRARIAN","Ph.D.",02),
      ("PHYSICAL DIRECTOR","DEGREE",03),
      ("ACCOUNTANT","CA/B.Com",05),
      ("RECEPTIONIST","DEGREE",01);
select * from job_openings; 
update job_openings set position="DIRECTOR/DEAN/PRINIPAL" where j_id=1;
select qualification from job_openings where position="associate professor";
select experiance as "DIRECTOR/DEAN/PRINIPAL Experaince" from job_openings  where position = "DIRECTOR/DEAN/PRINIPAL"  ;
select * from job_openings order by experiance desc;

create table transportation(v_id int not null auto_increment,primary key(v_id),van_number int,places varchar(50),morning_timings time, evening_timings time);
insert into transportation(van_number,places,morning_timings,evening_timings)
values(20,"koramangala","07:15:00","04:30:00"),
	  (21,"btm","07:00:00","04:15:00"),
	  (22,"jpnagar","07:45:00","04:45:00"),
	  (23,"jayanagar","08:00:00","05:00:00"),
	  (24,"indiranagar","08:15:00","05:15:00"),
	  (25,"electronic_city","6:45:00","04:00:00"),
	  (26,"gandhinagar","07:30:00","04:20:00"),
	  (27,"btm_2ndstage","09:00:00","05:30:00");
select * from transportation;
select morning_timings,evening_timings from transportation where van_number=24;
select van_number from transportation where morning_timings between "07:00:00" and "08:00:00";
select van_number,morning_timings,evening_timings from transportation where places="jayanagar";






use college_management;
select * from teaching_faculty;
select * from nonteaching_faculty;
select * from departments;
select * from job_openings;
select * from students;
select * from transportation;
select * from admissions;
show databases;
