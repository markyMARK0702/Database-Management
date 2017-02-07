-- Mark Miller -- 
  -- Lab 2 --
 -- 2/7/2017 --

select ordNumber, totalUSD
from orders;


select name, city
from agents
where name = 'Smith';


select pid, name, priceUSD
from products
where quantity > 200100;


select name, city
from customers
where city = 'Duluth';


select name
from agents
where city <> 'New York' and city <> 'Duluth';


select pid, name, city, quantity, priceUSD
from products
where priceUSD >= 1 and city <> 'New York' and city <> 'Duluth';


select ordNumber, month, cid, aid, pid, qty, totalUSD
from orders
where month = 'feb' or month = 'mar';


select ordNumber, month, cid, aid, pid, qty, totalUSD
from orders
where month = 'feb' and totalUSD >= 600;


select ordNumber, month, cid, aid, pid, qty, totalUSD
from orders
where cid = 'c005';