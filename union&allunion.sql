create table Customerdetails
(
id int ,
name varchar (30),
city varchar (30),
State varchar(30)

)

insert into Customerdetails values (1,'Akshay','Pune','MH'),
(2,'Jay ','Nagpur','MH'),
(3,'Akashay','Pune','MH'),
(4,'Raj ','Solapur','MH'),
(5,'Tanvi','Satara','MH')

create table Supplier1 
(
id int,
name varchar(30),
city varchar (30),
State varchar (30)
)
insert into Supplier1  values 
(1,'Akshay','Pune','MH'),
(2,'Jay ','Nagpur','MH'),
(3,'Akash','Pune','MH'),
(4,'Raj ','Solapur','MH'),
(5,'Tanvi','Satara','MH')

select  id , name ,city , state from Customerdetails  union select id , name , city , state from Supplier1
select  id , name ,city , state from Customerdetails  union all select id , name , city , state from Supplier1

