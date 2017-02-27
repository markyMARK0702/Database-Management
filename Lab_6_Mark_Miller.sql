-- Mark Miller --
   -- Lab 6--
 -- 2/26/2017--
 
 
--q1-- 
select name, 
	   city
from customers
where city in (select city
			   from products
		       group by city
		       order by count(city)
		       limit 1
		      );


			  
--q2--
select name
from products
where priceUSD > (select avg(priceUSD)
			      from products
		          )
order by name DESC;



--q3--
select customers.name, 
	   orders.pid, 
	   orders.totalUSD
from customers inner join orders on customers.cid = orders.cid
order by orders.totalUSD ASC;



--q4--
select c.name, 
	   coalesce(sum(o.totalUSD),0) as totalDollars
from orders o right outer join customers c on c.cid = o.cid
group by c.name
order by c.name ASC;



--q5--
select products.name, 
	   agents.name, 
	   customers.name
from orders inner join customers on customers.cid = orders.cid
			inner join agents on agents.aid = orders.aid
			inner join products on products.pid = orders.pid
where agents.city = 'Newark';



--q6--
select *
from (select o.*, p.priceUSD* o.qty* (1-(c.discount/100)) as CheckAccuracy
     from orders o inner join products p on o.pid = p.pid
				   inner join customers c on o.cid = c.cid) as selectStatement
where totalUSD != CheckAccuracy;



--q7--
/*The difference between left and right outer join is very simple. when we say that the table in "table1 left outer join table2 on ..." we are stating that 
the left table, in this case table1 takes priority over table2, so if there are values that don't match in table1, they are still displayed. In a Right outer join, it is
just the opposite of a left outer join. An example could be "Customers left outer join Orders." When we execute this query each customer is going to be matched with
an order. Any customer that didn't place a order is still going to be displayed, but a null will be displayed as its output. Left and right outer joins are very useful
when it comes to querying results. 
