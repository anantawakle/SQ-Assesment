select*from Employee
select e1.name as'earn high',e1.salary,e2.name as 'earn less ',e2.salary
from Employee e1,Employee e2
where e1.salary>e2.salary