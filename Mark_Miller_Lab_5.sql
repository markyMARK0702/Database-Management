--Mark Miller--
  --Lab 5--
 --2/21/2017--


--q1--
select city
from agents 
	 inner join orders on agents.aid = orders.aid
     where orders.cid = 'c006';
	 
	 
--q2--	 
select distinct orders2.pid
from orders orders1 inner join customers on orders1.cid = customers.cid
					inner join orders orders2 on orders1.aid = orders2.aid
where customers.city = 'Kyoto'
order by orders2.pid DESC


--q3--
select name
from customers
where cid not in 
				(select cid
                 from orders);
				 
				 
--q4--
select name
from customers
	full outer join orders
	on customers.cid = orders.cid
	where orders.cid is null;
	
	
--q5--
select distinct customers.name, 
				agents.name
from orders	 
	inner join agents on agents.aid = orders.aid
	inner join customers on customers.cid =o rders.cid
	where agents.city = customers.city;
	
	
--q6--
select customers.name, 
	   agents.name, 
	   customers.city
from customers, 
	 agents
where customers.city = .city;


--q7--
select name, 
	   city
from customers
where city in (select city
			   from products
			   group by city
			   order by count(pid) ASC
			   limit 1);




