--ÇÓÆáÉ ÇäÊÑÝíæ Question interview 
--1)how find duplicate in given table ? ßíÝ ÇÚÑÝ Ýí ÇáÌÏæá ÇáãÚØì 
--ÊßÑÇÑ Çæ áÇ  
--id number íÊÇßÏ ÇÏÇ Ýí ÊßÑÇÑ
--ÈÇÓÊÎÏÇã ÌãáÉ group by ,having
select enp_id
from enp
group by enp_id 
having count(*) >1  ßÏÇ ÈÌíÈ ÇáÕÝ ÇááíÝíå ÊßÑÇÑ d

--2)how to delete duplicate ßíÝ ÇÍÏÝ ÇáÕÝ ÊßÑÇÑ ¿
with cte as (
select * , row_number () over (partition by enp_id order by enp_id ) as rn 
from enp1 ) 
delete from cte where rn >1
--3)) difference between union and union all 
select manager_id from enp
union
select manager_id from enp1

select enp_id from enp
union all 
select enp_id from enp1
--union return only unique value 
--union all return all values
--4))employess who are not present in department table 
select * from enp 
where department_id not in (select dep_id from dept)

--5) second highest salary in  each dep 
with cte as (
select*,dense_rank () over (partition by dep_id order by salary desc) as rk 
from enp )
select * from cte where rk=2 
--6)find all transuction by shilpa 
select * from orders where upper (customer_name)='shilpa'

--join 
--7) find employee salary > manager salary 
select e.emp_id, e.emp_name,
m.enp_name as manager_name 
e.salary , m.salary  as manager_salary 
from enp n 
join
enp m
on e.manager_id=m.emp_id 
where m.salary<e.salary
---update query to swap gender 
update orders 
set customer_gender=
case when customer_gender='male'then 'female'
when customer_gender ='female' then 'male'
end 

          