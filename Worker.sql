CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY ,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT,
	JOINING_DATE DATE,
	DEPARTMENT CHAR(25)
)

select*from Worker
	
		INSERT INTO Worker VALUES(001, 'Monika', 'Arora', 100000, '2020/02/14 ', 'HR')
		INSERT INTO Worker VALUES(002, 'Niharika', 'Verma', 80000, '2011/06/14 ', 'Admin')
		INSERT INTO Worker VALUES(003, 'Vishal', 'Singhal', 300000, '2020/02/14 ', 'HR')
		INSERT INTO Worker VALUES(004, 'Amitabh', 'Singh', 500000, '2020/02/14 ', 'Admin')
		INSERT INTO Worker VALUES(005, 'Vivek', 'Bhati', 500000, '2011/06/14 ', 'Admin')
		INSERT INTO Worker VALUES(006, 'Vipul', 'Diwan', 200000, '2011/06/14 ', 'Account')
		INSERT INTO Worker VALUES(007, 'Satish', 'Kumar', 75000, '2020/01/14 ', 'Account')
		INSERT INTO Worker VALUES(008, 'Geetika', 'Chauhan', 90000, '2011/04/14 ', 'Admin')
CREATE TABLE Bonus (
	WORKER_ID INT,
	BONUS_AMOUNT INT,
	BONUS_DATE DATE,
	constraint fk_Bonus foreign key (WORKER_ID) references  Worker(WORKER_ID)
     
)
select*from Bonus

		
	INSERT INTO Bonus VALUES(001, 5000, '2020/02/16')
		INSERT INTO Bonus VALUES(002, 3000, '2011/06/16')
		INSERT INTO Bonus VALUES(003, 4000, '2020/02/16')
		INSERT INTO Bonus VALUES(001, 4500, '2020/02/16')
		INSERT INTO Bonus VALUES(002, 3500, '2011/06/16')


		CREATE TABLE Title (
	WORKER_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATE,
	constraint fk_Title foreign key (WORKER_ID ) references Worker(WORKER_ID)
)
INSERT INTO Title 
	 VALUES
 (001, 'Manager', '2016/02/20'),
 (002, 'Executive', '2016/06/11 '),
 (008, 'Executive', '2016/06/11 '),
 (005, 'Manager', '2016/06/11 '),
 (004, 'Asst. Manager', '2016/06/11 '),
 (007, 'Executive', '2016/06/11 '),
 (006, 'Lead', '2016/06/11 '),
 (003, 'Lead', '2016/06/11')

 select*from Worker
 select*from Bonus
  select*from  Title
  ----1Q. Write an SQL query to fetch “FIRST_NAME” from the Worker table using the alias name <WORKER_NAME>.
  select First_name from Worker
  ---------------------------------------------------------------------------------------------------------------------------------------------------
  ---Q-2. Write an SQL query to fetch “FIRST_NAME” from the Worker table in upper case.
  select upper (First_name) from Worker
  --------------------------------------------------------------------------------------------------------------------------------------------------
  ----Q-3. Write an SQL query to fetch unique values of DEPARTMENT from the Worker table.
  -------------------------------------------------------------------------------------------------------------------------------------------------------
  -----Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from the Worker table.
----- Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from the Worker table.
select*from Worker where  FIRST_NAME like 'a%'
-----Q-6. Write an SQL query to print the FIRST_NAME from the Worker table after removing white spaces from the right side.
----Q-7. Write an SQL query to print the DEPARTMENT from the Worker table after removing white spaces from the left side.
-----8. Write an SQL query that fetches the unique values of DEPARTMENT from the Worker table and prints its length.
----Q-9. Write an SQL query to print the FIRST_NAME from the Worker table after replacing ‘a’ with ‘A’.
---Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from the Worker table into a single column COMPLETE_NAME. A space char should separate them.
--------------Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select*from Worker order by FIRST_NAME Asc
------Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select  *from Worker order by FIRST_NAME Asc 
 , DEPARTMENT desc
-------Q-13. Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table.
select * from Worker where  FIRST_NAME in ('vipul','satish')
-------Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from the Worker table.
select*from Worker where FIRST_NAME not  in  ('vipul','satish') 
-----Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
select*from Worker where DEPARTMENT='Admin'
------Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
select*from Worker where FIRST_NAME like 'a%'
------Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
select*from Worker where FIRST_NAME like '%a'
----Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select*from Worker where FIRST_NAME like '_____h'
-------Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select*from Worker where SALARY between 100000 and 500000
-----------Q-20. Write an SQL query to print details of the Workers who joined in Feb’2014.
-------Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
select count(*) AS'COUNT'FROM Worker where DEPARTMENT='Admin'

-----Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
select*from worker where salary >=50000 and salary<=100000
------Q-23. Write an SQL query to fetch the no. of workers for each department in descending order.
-----Q-24. Write an SQL query to print details of the Workers who are also Managers.
select*from Worker w  inner join Title t  on w.WORKER_ID=t.WORKER_ID where WORKER_TITLE='Manager'
----Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.
-----Q-26. Write an SQL query to show only odd rows from a table.
-----Q-27. Write an SQL query to show only even rows from a table.
------28. Write an SQL query to clone a new table from another table.
----Q-29. Write an SQL query to fetch intersecting records of two tables.
----Q-30. Write an SQL query to show records from one table that another table does not have.
----Q-31. Write an SQL query to show the current date and time.
---Q-32. Write an SQL query to show the top n (say 10) records of a table.
select top 10 *from Worker order by SALARY desc 
---------33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
select top 5 *from Worker order by  SALARY desc  
-----Q-35. Write an SQL query to fetch the list of employees with the same salary
---Q-36. Write an SQL query to show the second-highest salary from a table.
select *from Worker order by SALARY desc offset 1 row fetch next 1 row only 
----Q-37. Write an SQL query to show one row twice in the results from a table.

----Q-38. Write an SQL query to fetch intersecting records of two tables.

----Q-39. Write an SQL query to fetch the first 50% of records from a table.
---Q-40. Write an SQL query to fetch the departments that have less than five people in them.
select  DEPARTMENT, count (WORKER_ID) as 'count' from Worker group by DEPARTMENT having count(DEPARTMENT)<5
---Q-41. Write an SQL query to show all departments along with the number of people in there.
select DEPARTMENT , COUNT(*) as 'count'from Worker   group by DEPARTMENT
----Q-42. Write an SQL query to show the last record from a table.
select top 1 * from Worker order by  worker_id desc 
-------Q-43. Write an SQL query to fetch the first row of a table.
select top 1 * from Worker order by  worker_id 
-------Q-44. Write an SQL query to fetch the last five records from a table.
select top 5  * from Worker order by  worker_id desc
--------Q-45. Write an SQL query to print the name of employees having the highest salary in each department. 
select top 1 * from Worker    order by salary desc 
-------Q-46. Write an SQL query to fetch three max salaries from a table.
select  top 3 *from Worker order by SALARY desc 
------Q-47. Write an SQL query to fetch three min salaries from a table.
select top 3 *from Worker order by SALARY asc
---Q-48. Write an SQL query to fetch nth max salaries from a table.
----Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
select  DEPARTMENT , sum (salary) from Worker group by  DEPARTMENT
----------Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
select top 1 *from Worker order by SALARY desc 
-------------------------------