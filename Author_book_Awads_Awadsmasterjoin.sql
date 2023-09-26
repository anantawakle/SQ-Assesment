 drop  table Author
 create table Author 
  (
     authorid int primary key,
	 authorname varchar(20),
	 phno varchar(10),
	 email varchar(20),
	 city varchar(10)
	 )


	 select*from Author 
	 insert into Author values(1,'	Vijay Tendulkar',7894561236,'vijay@gmail.com','Akola')
	 insert into Author values(2,'Rabindranath Tagore',9874561236,'rabindra@gmail.com','Pune')
	 insert into Author values(3,'Bal Gangadhar Tilak',8563214789,'balghangha@gmail.com','Nashik')
	 insert into Author values(4,'Jawaharlal Nehru',6985741236,'javharlal2gmail.com','Mumbai')
	 insert into Author values(5,'Chetan Bhagat',7896325412,'chetanbh@gmail.com','Jodhpur')
	 drop table Book
create table Book 
(
  bookid int primary key,
  bookname varchar(20),
  authorid int ,
  price int
   
   constraint fk_book foreign key (authorid) references Author   (authorid)
  )
  select*from Book
  insert into Book values(101,'Making India Awesome',1,499),(102,'One Indian Girl',2,899),(103,'Half Girlfriend',3,599),(104,'Revolution 2020',4,600),(105,'Naked Triangle',5,499)

  
	create table Awardsmaster
(
	   awardtypeid int primary key,
	   awardname varchar(10),
	   awardprice int 
	   
   )
   select*from Awardsmaster
   insert into Awardsmaster values(201,'GeAwards',90000),(202,'NolPrize',500000),(203,'EAward',56000),(204,'HugoAward',65000),(205,'JohMedal',78000)



  create table Awards
 (
    awardid int primary key,
	awardtypeid int,
	authorid int,
	bookid int,
	years varchar(10),
	constraint fk_aw foreign key (authorid) references Author  (authorid),
	constraint fk_boo foreign key(bookid) references Book  (bookid),
	constraint fk_awar foreign key (awardtypeid) references  Awardsmaster (awardtypeid)

	)


	select*from Awards

	insert into Awards values(301,201,1,101,2001),(302,202,2,102,2002),(303,203,3,103,2003),(304,204,4,104,2004),(305,205,5,105,2005)
	
----- find the book which is written by 'xyz'

	select bookname from Book b inner join  author a  on  b.authorid=a.authorid where bookname='Making India Awesome'
	-------------select author name for book 'wings of fire'
	select


	---
	-----find the author name who got awards in 2001---
	select authorname from Author a inner join Awards ab on a.authorid=ab.authorid where years=2001
	-----------
	---find  out the author wise book count----
	select count  (bookid) as count  from author a inner join Book b 
	on a.authorid=b.authorid group by   a.authorname 

	------------    find  e author name who ascar awards-----
 select authorname from author a inner join  Awards d   on a.authorid=d .authorid inner join Awardsmaster m on Awardsmaster  
	
	---- find the author who got awards price 50,000---
	select authorname from Author
	join Awards on Awards.authorid=Author
	.authorid inner join Awardsmaster on Awardsmaster .awardtypeid=Awards.awardtypeid 
	where awardprice>50000
 

	

	





