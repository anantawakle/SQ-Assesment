create table Doctors
(
   doctor_id int  primary key,
   First_name varchar(25),
   Last_name varchar(30),
   speciality varchar(30)
   )
   select*from Doctors
   insert into Doctors values (1001,'Jay','Shukla','Cardiologist')
   insert into Doctors values(1002,'Dipti ','Sharma','Family Physicians')
   insert into doctors values(1003,'Dipak', 'Patil','Nephrologists')
   insert into Doctors values(1004,'Rahul','Deshmukh','Neurologists')
   insert into Doctors values(1005,'Kiran','Deshpande','Pediatricians')
   create table Provincenames
		(
		   provience_id char(2) primary key,
		   province_name varchar(30)
		   )
		   select*from Provincenames
		   insert into Provincenames values('10','Maharashtra'),('20','Goa'),('30','Karnataka'),('40','Kerla'),('50','Rajsthan')

     create table Patient 
		   (
		     patient_id int primary key,
			 first_name varchar(30),
			 Last_name varchar(30),
			 gender varchar(30),
			 birth_date date ,
			 city varchar(30),
			 province_id char(2),
			 allergies varchar(80),
			 height decimal (3,0),
			 weights decimal(4,0)
			 constraint fk_Patient   foreign key ( province_id) references   Provincenames (  provience_id)
			 )
     select*from Patient 
	 insert into Patient values(1,'Kunal','Dhage','Male','2001/05/30','Pune','10','Allergy in Children',6.0,56.00)
	 insert into patient values(2,'Tushar','Tayde','Male','2002/03/06','Mumbai','20','Asthama',5.6,65.00)
	 insert into patient values(3,'Dipika ', 'Sangmwar','Female','2005/06/01','Thane','30','DrugAllergy',6.2,36.00)
	 insert into Patient values(4,'Vaibhavi','nemkar', 'female','2001/06/03','Palghar','40','Food Allergy',6.9,66.00)
	 insert into patient values(5,'Rakhi','Patil','Female','2002/03/01','Jodhpur','50','Rhinitis',7.2,69.00)
	 drop table Admissions
	 create table Admissions
	 (
	    patient_id int ,
		admission_date date,
		discharge_date date,
		diagnosis varchar(50),
		attending_doctor_id int
		constraint fk_Admissions foreign key (patient_id) references  Patient  (patient_id),
		constraint fk_Admissio foreign key ( attending_doctor_id) references Doctors( doctor_id)
		)
		select*from Admissions
		select*from Doctors
		insert into Admissions values(1,'2023/05/12','2023/05/24','Blood count',1001)
		insert into Admissions values(2,'2023/06/23','2023/06/25','Enzyme analysis',1002)
		insert into Admissions values (3,'2022/09/02','2022/09/25','Hematocrit',1003)
		insert into Admissions values(4,'2019/05/03','2019/08/06','Inulin',1004)
		insert into Admissions values(5,'2020/08/23','2020/12/12','Thymol turbidity',1005)
		
		
		select*from Doctors
		select*from Patient
	
		select*from Admissions
	
---1.	Show the first name, last name and gender of patients who’s gender is ‘M’
select first_name , Last_name from Patient p join Admissions  A on p.patient_id=A.patient_id where gender='Male'
---2.	Show the first name & last name of patients who does not have any allergies
select  first_name, Last_name  from  Patient where allergies=Null
-----3.	Show the patients details that start with letter ‘C’
select*from Patient where first_name like 'c%'
------4.	Show the patients details that height range 100 to 200
select *from Patient where height  <7.00  and height >5.00
----5.	Update the patient table for the allergies column. Replace ‘NKA’ where allergies is null
update Patient set allergies='NKA' where patient_id =1
select*from Patient
-----6.	Show how many patients have birth year is 2001 ask the aniket sir

select count  (patient_id)  as 'count' from  Patient where year  ( birth_date) = '2001' 
 
----7.	Show the patients details who have greatest height
select top 1 *from Patient order by height desc 
-----8.	Show the total amount of male patients and the total amount of female patients in the patients table.
alter table Patient add Total_Amount varchar(10)
select*from Patient
alter table Patient  drop   column   total_amount

select  gender  , count ( gender ) as 'count' from Patient  group by gender 
------9.	Show first and last name, allergies from patients which have allergies to either 'NKA' or 'Asthama'. 
---Show results ordered ascending by allergies then by first_name then by last_name.----
select*from patient 
select first_name , Last_name from patient where allergies ='NkA' or  allergies='Asthama'
-------10.	Show first_name, last_name, and the total number of admissions attended for each doctor.
select*from patient
select*from Admissions
-----Every admission has been attended by a doctor.
select concat (d.First_name , d.Last_name) ,count(*) from Patient P  join Admissions A on A.patient_id=P.patient_id inner join Doctors d on d.doctor_id=A.attending_doctor_id
group by  concat (d.First_name , d.Last_name)
select*from Doctors
----11.	For every admission, display the patient's full name, their admission diagnosis, and their doctor's full name who diagnosed their problem.
select   concat(p.First_name , p.Last_name) , CONCAT(d.First_name , d.Last_name), diagnosis from Patient p join Admissions A on p.patient_id=A.patient_id inner join Doctors D on d.doctor_id=A.attending_doctor_id
 

 select*from Doctors
 select*from Admissions
 select*from Patient