-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

select p.productName, c.categoryName
from product as p
join category as c on c.id = p.categoryid;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

select distinct o.id, s.CompanyName, o.OrderDate
from [order] as o 
join shipper as s on o.shipvia = s.id
where o.orderdate < '2012-08-09'
order by o.orderdate;


-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

select o.id, od.Quantity, p.ProductName
from [order] as o 
join orderdetail as od on od.orderid = o.id
join product as p on od.ProductId = p.Id
where o.id = 10251
order by p.ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.


select o.id as OrderID, c.CompanyName as 'Customer Company Name', e.lastname as 'Last Name of Employee'
from [order] as o 
join customer as c on c.Id = o.CustomerId
join employee as e on e.id = o.EmployeeId;