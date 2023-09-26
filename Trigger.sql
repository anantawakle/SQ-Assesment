select*from Employee
insert into Employee values (11,'Jay Patil','jay@gmail.com',25000.00,26,'Akola',101)
delete from Employee where id =10
create table EmployeeTrack
(
   id int primary key identity (1,1),
   description varchar(250)
   )
    Create trigger tr_Employee
   on Employee after insert 
   as begin 
   declare @id int 
   declare @name varchar (25)
   declare @email varchar(30)
   select @id=id,@name=name,@email=email from inserted 
  insert into EmployeeTrack values('new record with details'+cast(@id as varchar)+' name'+
@name+' email '+@email+' date '+ cast( GETDATE() as varchar(20))+' added')
end
select*from Employee
select*from  EmployeeTrack


create trigger tr_Employee_delete
on Employee after delete
as begin 
declare @id int 
declare @name varchar(30)
declare @email varchar(30)
   select @id=id,@name=name,@email=email from deleted 
 insert into EmployeeTrack values('new record with details'+cast(@id as varchar)+' name'+
@name+' email '+@email+' date '+ cast( GETDATE() as varchar(20))+' deleted')
end
 
 select *from Employee 
 select*from EmployeeTrack