Go
create database Main_UAP
Go
use Main_UAP

go
create table department
(
	dept_name varchar(50),
	building nvarchar(28),
	budget int,
	constraint dept_d_n_pk primary key(dept_name)
);

go
create table instructor
(
	id int primary key,
	name char(50),
	dept_name varchar(50)
	constraint inst_d_n_fk foreign key (dept_name)
	references [dbo].[department] ([dept_name]),
	salary int,
);

go
insert into department values ('Biology', 'Watson', 90000);
insert into department values ('Comp. Sci.', 'Taylor', 100000);
insert into department values ('Elec. Eng.', 'Taylor', 85000);
insert into department values ('Finance', 'Painter', 120000);
insert into department values ('History', 'Painter', 50000);
insert into department values ('Music', 'Packard', 80000);
insert into department values ('Physics', 'Watson', 70000);

go
insert into instructor values ('10101', 'Srinivasan', 'Comp. Sci.', 65000);
insert into instructor values ('12121', 'Wu', 'Finance', 90000);
insert into instructor values ('15151', 'Mozart', 'Music', 40000);
insert into instructor values ('22222', 'Einstein', 'Physics', 95000);
insert into instructor values ('32343', 'El Said', 'History', 60000);
insert into instructor values ('33456', 'Gold', 'Physics',87000);
insert into instructor values ('45565', 'Katz', 'Comp. Sci.', 75000);
insert into instructor values ('58583', 'Califieri', 'History', 62000);
insert into instructor values ('76543', 'Singh', 'Finance', 80000);
insert into instructor values ('76766', 'Crick', 'Biology', 72000);
insert into instructor values ('83821', 'Brandt', 'Comp. Sci.', 92000);
insert into instructor values ('98345', 'Kim', 'Elec. Eng.', 80000);

go
select * from department
select * from instructor

--hoise
create table student
(
	id int primary key,
	name char(50),
	dept_name varchar(50) foreign key (dept_name)
	references [dbo].[department] ([dept_name]),
	tot_cred int,
);
insert into student values ('00128', 'Zhang', 'Comp. Sci.', '102');
insert into student values ('12345', 'Shankar', 'Comp. Sci.', '32');
insert into student values ('19991', 'Brandt', 'History', '80');
insert into student values ('23121', 'Chavez', 'Finance', '110');
insert into student values ('44553', 'Peltier', 'Physics', '56');
insert into student values ('45678', 'Levy', 'Physics', '46');
insert into student values ('54321', 'Williams', 'Comp. Sci.', '54');
insert into student values ('55739', 'Sanchez', 'Music', '38');
insert into student values ('70557', 'Snow', 'Physics', '0');
insert into student values ('76543', 'Brown', 'Comp. Sci.', '58');
insert into student values ('76653', 'Aoi', 'Elec. Eng.', '60');
insert into student values ('98765', 'Bourikas', 'Elec. Eng.', '98');
insert into student values ('98988', 'Tanaka', 'Biology', '120');
select * from student

create table adviser
(
	s_id int,
	i_id int,
	constraint ad_s_id_PK primary key(s_id),
	constraint ad_s_id_FK foreign key(s_id)
	references [dbo].[student] (id),
	constraint ad_i_id_FK foreign key(i_id)
	references [dbo].[instructor] (id)
);
insert into adviser values ('00128', '45565');
insert into adviser values ('12345', '10101');
insert into adviser values ('23121', '76543');
insert into adviser values ('44553', '22222');
insert into adviser values ('45678', '22222');
insert into adviser values ('76543', '45565');
insert into adviser values ('76653', '98345');
insert into adviser values ('98765', '98345');
insert into adviser values ('98988', '76766');
select * from adviser

create table classroom 
(
	building varchar(50),
	room_no int,
	capacity int,
	constraint clsrm_building_room_PK primary key(building, room_no)
)
insert into classroom values ('Packard', 101, 500);
insert into classroom values ('Painter', 514, 10);
insert into classroom values ('Taylor', 3128, 70);
insert into classroom values ('Watson', 100, 30);
insert into classroom values ('Watson', 120, 50);

select * from classroom

create table course
(
	course_id varchar(50),
	title varchar(50),
	dept_name varchar(50),
	credits varchar(50),
	constraint course_PK primary key(course_id),
	constraint course_FK foreign key(dept_name)
	references [dbo].[department] ([dept_name])
)

insert into course values ('BIO-101', 'Intro. to Biology', 'Biology', '4');
insert into course values ('BIO-301', 'Genetics', 'Biology', '4');
insert into course values ('BIO-399', 'Computational Biology', 'Biology', '3');
insert into course values ('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', '4');
insert into course values ('CS-190', 'Game Design', 'Comp. Sci.', '4');
insert into course values ('CS-315', 'Robotics', 'Comp. Sci.', '3');
insert into course values ('CS-319', 'Image Processing', 'Comp. Sci.', '3');
insert into course values ('CS-347', 'Database System Concepts', 'Comp. Sci.', '3');
insert into course values ('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', '3');
insert into course values ('FIN-201', 'Investment Banking', 'Finance', '3');
insert into course values ('HIS-351', 'World History', 'History', '3');
insert into course values ('MU-199', 'Music Video Production', 'Music', '3');
insert into course values ('PHY-101', 'Physical Principles', 'Physics', '4');

select * from course
create table section
(
	course_id varchar(50),
	sec_id varchar(10),
	semester varchar(10),
	year int,
	constraint sctn_PK primary key(course_id, sec_id, semester, year),

	building varchar(50),
	room_no int,
	constraint sctn_building_room_PK foreign key(building, room_no)
	references [dbo].[classroom] ([building],[room_no]),
	constraint sctn_course1_id_FK foreign key (course_id)
	references [dbo].[course] ([course_id])
)

insert into section values ('BIO-101', '1', 'Summer', '2017', 'Painter', '514');
insert into section values ('BIO-301', '1', 'Summer', '2018', 'Painter', '514');
insert into section values ('CS-101', '1', 'Fall', '2017', 'Packard', '101');
insert into section values ('CS-101', '1', 'Spring', '2018', 'Packard', '101');
insert into section values ('CS-190', '1', 'Spring', '2017', 'Taylor', '3128');
insert into section values ('CS-190', '2', 'Spring', '2017', 'Taylor', '3128');
insert into section values ('CS-315', '1', 'Spring', '2018', 'Watson', '120');
insert into section values ('CS-319', '1', 'Spring', '2018', 'Watson', '100');
insert into section values ('CS-319', '2', 'Spring', '2018', 'Taylor', '3128');
insert into section values ('CS-347', '1', 'Fall', '2017', 'Taylor', '3128');
insert into section values ('EE-181', '1', 'Spring', '2017', 'Taylor', '3128');
insert into section values ('FIN-201', '1', 'Spring', '2018', 'Packard', '101');
insert into section values ('HIS-351', '1', 'Spring', '2018', 'Painter', '514');
insert into section values ('MU-199', '1', 'Spring', '2018', 'Packard', '101');
insert into section values ('PHY-101', '1', 'Fall', '2017', 'Watson', '100');

select * from section


create table takes
(
	id int,
	course_id varchar(50),
	sec_id varchar(10),
	semester varchar(10),
	year int,
	constraint takes_PK primary key(id, course_id, sec_id, semester, year),
	constraint takes_id_FK foreign key(id)
	references [dbo].[student] ([id]),
	constraint takes_FK foreign key(course_id, sec_id, semester, year)
	references [dbo].[section] ([course_id],[sec_id],[semester],[year]),
	
	grade varchar(50)
)
insert into takes values ('00128', 'CS-101', '1', 'Fall', '2017', 'A');
insert into takes values ('00128', 'CS-347', '1', 'Fall', '2017', 'A-');
insert into takes values ('12345', 'CS-101', '1', 'Fall', '2017', 'C');
insert into takes values ('12345', 'CS-190', '2', 'Spring', '2017', 'A');
insert into takes values ('12345', 'CS-315', '1', 'Spring', '2018', 'A');
insert into takes values ('12345', 'CS-347', '1', 'Fall', '2017', 'A');
insert into takes values ('19991', 'HIS-351', '1', 'Spring', '2018', 'B');
insert into takes values ('23121', 'FIN-201', '1', 'Spring', '2018', 'C+');
insert into takes values ('44553', 'PHY-101', '1', 'Fall', '2017', 'B-');
insert into takes values ('45678', 'CS-101', '1', 'Fall', '2017', 'F');
insert into takes values ('45678', 'CS-101', '1', 'Spring', '2018', 'B+');
insert into takes values ('45678', 'CS-319', '1', 'Spring', '2018', 'B');
insert into takes values ('54321', 'CS-101', '1', 'Fall', '2017', 'A-');
insert into takes values ('54321', 'CS-190', '2', 'Spring', '2017', 'B+');
insert into takes values ('55739', 'MU-199', '1', 'Spring', '2018', 'A-');
insert into takes values ('76543', 'CS-101', '1', 'Fall', '2017', 'A');
insert into takes values ('76543', 'CS-319', '2', 'Spring', '2018', 'A');
insert into takes values ('76653', 'EE-181', '1', 'Spring', '2017', 'C');
insert into takes values ('98765', 'CS-101', '1', 'Fall', '2017', 'C-');
insert into takes values ('98765', 'CS-315', '1', 'Spring', '2018', 'B');
insert into takes values ('98988', 'BIO-101', '1', 'Summer', '2017', 'A');
insert into takes values ('98988', 'BIO-301', '1', 'Summer', '2018', null);

select * from takes

create table teaches
(
	
	id int,
	course_id varchar(50),
	sec_id varchar(10),
	semester varchar(10),
	year int,
	constraint teaches_PK primary key(id, course_id, sec_id, semester, year),
	constraint teaches_id_FK foreign key(id)
	references [dbo].[instructor] ([id]),
	constraint teaches_FK foreign key(course_id, sec_id, semester, year)
	references [dbo].[section] ([course_id],[sec_id],[semester],[year]),
	
)
insert into teaches values ('10101', 'CS-101', '1', 'Fall', '2017');
insert into teaches values ('10101', 'CS-315', '1', 'Spring', '2018');
insert into teaches values ('10101', 'CS-347', '1', 'Fall', '2017');
insert into teaches values ('12121', 'FIN-201', '1', 'Spring', '2018');
insert into teaches values ('15151', 'MU-199', '1', 'Spring', '2018');
insert into teaches values ('22222', 'PHY-101', '1', 'Fall', '2017');
insert into teaches values ('32343', 'HIS-351', '1', 'Spring', '2018');
insert into teaches values ('45565', 'CS-101', '1', 'Spring', '2018');
insert into teaches values ('45565', 'CS-319', '1', 'Spring', '2018');
insert into teaches values ('76766', 'BIO-101', '1', 'Summer', '2017');
insert into teaches values ('76766', 'BIO-301', '1', 'Summer', '2018');
insert into teaches values ('83821', 'CS-190', '1', 'Spring', '2017');
insert into teaches values ('83821', 'CS-190', '2', 'Spring', '2017');
insert into teaches values ('83821', 'CS-319', '2', 'Spring', '2018');
insert into teaches values ('98345', 'EE-181', '1', 'Spring', '2017');


select * from teaches

create table prereq
(
	course_id varchar(50),
	preq_id varchar(50),
	constraint prereq_PK primary key(course_id, preq_id),
	constraint prereq_course_id_FK foreign key(course_id)
	references [dbo].[course] ([course_id]),
	constraint prereq_preq_id_FK foreign key(preq_id)
	references [dbo].[course] ([course_id])
)

insert into prereq values ('BIO-301', 'BIO-101');
insert into prereq values ('BIO-399', 'BIO-101');
insert into prereq values ('CS-190', 'CS-101');
insert into prereq values ('CS-315', 'CS-101');
insert into prereq values ('CS-319', 'CS-101');
insert into prereq values ('CS-347', 'CS-101');
insert into prereq values ('EE-181', 'PHY-101');

select * from prereq

drop table adviser
drop table prereq
drop table teaches
drop table instructor
drop table takes
drop table student
drop table section
drop table classroom
--drop table timeslot
drop table course
drop table department

select name,id
from instructor
where name like 'El%'

select distinct * 
from instructor as T, instructor as S
where T.salary > S.salary and S.dept_name = 'Comp. Sci.'