select*from Doctor
select*from PatientMaster
select*from AdmittedPatient
select*from Bill
--1)write a queries to create all tables with primary key ,foreign key 
--2)write a query to describe above tables;
--3)	write a query to drop primary key from patientMaster

--4)	Suppose Discharge _date is not present into AdmittedPatient write query to add Discharge_date column into the AdmittedPatient
--5)	write a query to change the data type wardno int to varchar(10)
--6)	 write a query to drop one foreign key from AdmittedPatient

--7)	write a query to add foreign key such that if parent is delete or update child also delete or update 

--8)	write a query to add primary key to patientMaster

--9)	 write a query to insert 5 records into the Doctor table
insert into Doctor values(1006,'Raghav','Thane','MD',3),(1007,'Dilip','Akola','BAMS',1),(1008,'jaya','Pune','MD',5),
(1009,'Ankit','BDS','Dilhi',1),(1010,'Vaibhavi','BHMS','Nagpur',8)
update Doctor set qualification='BHMS' ,daddress='Nagpur' WHERE did=1008
update Doctor SET qualification ='BHMS',daddress='Pune' where did =1001
update Doctor set qualification='BAMS' ,daddress='Thane' WHERE  did =1002
update Doctor set qualification='MD' ,daddress='Akola' WHERE  did=1003 
update Doctor set qualification='MBBS' ,daddress='Mumbai' WHERE did=1004 
update Doctor set qualification='MBBS' ,daddress='Palghar' WHERE  did=1005
update Doctor set qualification='MS' ,daddress='Akola' WHERE  did=1006
update Doctor set qualification='BAMS' ,daddress='Thane' WHERE did=1007
update Doctor set qualification='BAMS' ,daddress='Thane' WHERE did=1009
update Doctor set qualification='MD' ,daddress='KOlkata' WHERE did=1010
--10)	write a query find the no. of doctors as per qualification
select qualification  ,count(did) as 'count' from Doctor group by qualification 

--11)	find the doctors whose qualification is MD or MBBS
select dname ,qualification from Doctor  where qualification in  ('MD' , 'MBBS')
--12)find patients  whose age is between 21to 27    with bloodgroup AB+ 
select *from PatientMaster where age between 21 and 27  and   bloodgroup='AB+'
--13 )find the doctors whose address is Thane and noofpatient_handle are 10
select*from Doctor where daddress='Thane' and  noofpatient_handled =10
--14)find the count of pateint as per the blood group
select  bloodgroup,count (pcode)  as 'count'from PatientMaster group by bloodgroup
--15)	find the maximum bill amount
select top 1 *from Bill order by bill_amount desc
select max (bill_amount) from Bill
--16)	find the doctors who has noofpatient_handle are more than 3;
select *from Doctor where noofpatient_handled>3

--17)	find the number of patients who live in pune;
select Paddress,count (Pcode) as 'count ' from PatientMaster where Paddress='Pune' group by Paddress
--18)find the patients whose bloodgroup is AB+ and gender is the female
select*from PatientMaster where gender ='Female' and bloodgroup='AB+'
--19)find the no of patient with covid 19  as per the ward and display wardno with maxmum patient of covid 19

--20)	delete the patient whose wardno is 4 or 6 and Disease is covid 19  
--21)	remove all records from bill table

--22)	 find the details of doctor who are treating the patient of wardno2003
select *from Doctor d inner join AdmittedPatient A on d.did=A.did where wardno=2003
--23)	find details of patient who are discharge  within the date 2023/04/10 to 2023/05/20
select * from PatientMaster  P inner join AdmittedPatient  A on P.Pcode= A.Pcode where  Entry_date='2023/04/10' and Discharge_date='2023/05/20'

--24)	Give details of patient who are admited in hospital more than 5 days

--25)	find the pa tient who are suffered from Cold and flu   and having age less than 30and bloodgroup is'AB+'
select*from PatientMaster P  inner join AdmittedPatient A  on  P.Pcode= A.Pcode where diasease='Colds and Flu' and age <23 or bloodgroup='AB+'
--26)	find the patient who recover from dengue and  bill amount is greater than 10000
select *from PatientMaster P inner join Bill b on P.Pcode=  b.Pcode where bill_amount >10000
--27)	find Patient  whose doctors  qualifiaction is M.b.b.s  --- ask mam 
select Pcode  from  AdmittedPatient  A inner join Doctor   d  on  A.did = d.did where qualification='MBBS' 

select*from Doctor

select*from AdmittedPatient
select*from Bill
