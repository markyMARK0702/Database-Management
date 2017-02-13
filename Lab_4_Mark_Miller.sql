--Mark Miller--
  --Lab 4--

-- Question 1--
select city
from agents
where aid in 
			(select aid
             from orders
             where cid = 'c006'
             );

			 
--Question 2--
select distinct pid
from orders
where aid in 
			(select aid
             from orders
             where cid in
            			(select cid
           				 from customers
            			 where city = 'Kyoto'
            			 )
             )
order by pid DESC;


--Question 3--
select cid, name
from customers
where cid not in 
			(select cid
             from orders
			 where aid = 'a01'
             );
			 
			 
--Question 4--		 
select cid
from customers
where cid in 
			(select cid
             from orders
             where pid = 'p01'
             INTERSECT
             select cid
             from orders
             where pid = 'p07'
             );
            
			
--Question 5--			
select pid
from products
where pid not in
			    (select pid
                 from orders
                 where cid in
             			     (select cid
                              from orders
                              where aid = 'a08'
                             )
             );
			 
			 
--Question 6--			 
select name, discount, city
from customers
where cid in 
			(select cid
             from orders
             where aid in 
             		     (select aid
                          from agents
                          where city = 'Tokyo' or city = 'New York'
                          )
             );

			 
--Question 7--
select *
from customers
where discount in 
				(select discount
                 from customers
                 where city in ('Dallas', 'London')
                 );
				 
				 
--Question 8--
/*A check constraint is used to limit the value range that can be placed in a column
A check constraint is good for providing data integrity and in general helps to
increase application development productivity and is also helpful in error checking.
A good example could be used for a database in a store dealing with inventory.
In this case you cannot have a negative amount of inventory, therefore placing a 
check constraint for that database. There are many other cases in which this can be
used. A bad example would be using a check in a database for bank. You don't want
to place a restrcited value range on a bank database due to constant changing
to make it usable. Since the amount of money a bank has is always changing it would be
less productive to add a check constraint becasue that would mean there would need to 
be a constant update on the check constraint.
*/

