create table studenttable
(
rollno int primary key,
sname varchar(20),
degree varchar(20),
birthdate date,
courseid int,
constraint fk_cid foreign key(courseid) references course(courseid),
batchid int,
feespaid int,
remark varchar(15),
isplaced varchar(10)
)
insert into studenttable values (101,'Shubham Khadke', 'B.E.Comp','1996/10/08',51,1,25000,'Good','Not Yet')
insert into studenttable values (102,'Sumit Dethe', 'B.E.Mech','1996/07/27',52,3,27000,'Good','Not Yet')
insert into studenttable values (103,'Sanket Jadhav', 'B.Tech','1998/03/20',53,2,15000,'Better','Yes')
insert into studenttable values (104,'Karan Shelke', 'BSC Comp','1995/12/28',54,3,35000,'Good','Yes')
insert into studenttable values (105,'Sagar Kardile', 'B.E.Comp','1999/11/18',55,1,7000,'Bad','Not Yet')
insert into studenttable values (106,'Vrushali Shinde', 'MSC','1997/11/19',56,1,10000,'Good','Yes')
insert into studenttable values (107,'Sagar Kardile', 'B.E.Comp','1999/11/18',52,3,28500,'Good','Not Yet')

create table course
(
courseid int primary key,
coursename varchar(20),
duration int,
trainerid int,
constraint fk_tid foreign key(trainerid) references trainer(trainerid),
totalfees int
)
insert into course values(51,'C#', 3, 11, 25000)
insert into course values(52,'Java', 4, 12, 28500)
insert into course values(53,'Python', 2, 13, 20000)
insert into course values(54,'Salesforce', 5, 14, 35000)
insert into course values(55,'Javascript', 2, 15, 10000)
insert into course values(56,'MVC', 1, 12, 10000)
insert into course(courseid,coursename,duration,totalfees) values(57,'SQL', 1, 8000)


create table trainer
(
trainerid int primary key,
trainername varchar(20),
joindate date,
email varchar(20),
experience int 
)

insert into trainer values(11,'Aniket Joshi', '2017/06/22', 'aniket22@gmail.com', 7)
insert into trainer values(12,'Vishakha Shinde', '2020/11/05', 'vishakha22@gmail.com', 4)
insert into trainer values(13,'Nitin Bhusal', '2021/03/19', 'nitin22@gmail.com', 2)
insert into trainer values(14,'Mahesh Shinde', '2012/01/11', 'mahesh22@gmail.com', 10)
insert into trainer values(15,'Ninath Bedekar', '2018/12/15', 'ninath22@gmail.com', 5)


select * from studenttable
select * from course
select * from trainer


--Show list of students. List contains roll no , student name , course name , trainer name 
--in order of course name and student name.
select st.rollno, st.sname, c.coursename, t.trainername 
from studenttable st join course c on st.courseid=c.courseid  join trainer t on t.trainerid=c.trainerid
order by c.coursename, st.sname

--Show list of students who have pending fees more than 1000rs .
--List should have student name , course name , balance fees . 
--Show this list in descending order of balance fees
select s.sname, s.feespaid, c.coursename, (c.totalfees-s.feespaid) as 'balance fees'
from studenttable s join course c on s.courseid=c.courseid where (c.totalfees-s.feespaid)>=1000
order by feespaid desc 

--Create a index to make retrieval faster based on course name
create index a_index on course(coursename)

--List name of course for which more than 20 students are enrolled.
select c.coursename
from course c join studenttable s on s.courseid=c.courseid 
group by c.coursename having COUNT(s.courseid)>1 

--List name of course for which maximum revenue was generated. ( max fee collection)
select top 1 with ties c.coursename ,
sum(s.feespaid) as total 
from course c join studenttable s on s.courseid=c.courseid
group by c.coursename
order by total desc

--Show names of students who are more than 23 years old.
select sname
from studenttable
where year(cast(getdate() as date))-year(cast(birthdate as date)) > 27

-- Show names of students who have paid all the fees. 
select s.sname
from studenttable s
join course c on c.courseid=s.courseid
where (c.totalfees-s.feespaid)=0

--Update table student. Update ‘remark’ field. 
update studenttable set remark='nice' where remark in
(
select remark from studenttable where remark='Good'
)

--Delete all students who are in course which is less than 2 months duration.
delete from studenttable where courseid in
(
select courseid from course where duration<2
)

--Remark should be ‘Eligible for iv’ if fees paid by student is more than 95%.
update studenttable set remark='eligible for iv' where feespaid > any
(
select totalfees*0.95 as '95% of fees' from course 
)

--Delete all students for whom is placed is ‘yes’ and who have paid all the fees of their course.
delete from studenttable where courseid=
(
select courseid from course where (totalfees-feespaid)=0 and isplaced='yes'
)
select*from studenttable

--Create a view which shows name of trainer and number of students he is training.
select t.trainername, 
count (*) from trainer t inner join course c on c.trainerid=t.trainerid inner join 
studenttable st on st.courseid=c.courseid group by trainername 

--Append letter ‘_spl’ to all batch ids of trainer ‘Deepa’
--Write a procedure which accepts student id and returns his balance fees

--Select name of student who are in same batch as ‘Atul’
--Create a trigger to add student data in ex-student table if student is deleted from student table