use `dbvjvjj3tgi1js`;

-- Los pedidos enviados a cada ciudad desde Brasil.

-- Los clientes de Barcelona por barrios.

-- los clientes de London.



-- pedidos retrasados en 1996.

-- Clientes alemanes que han hecho pedido en julio de 1998.

-- Empleados que tengan entre 18 y 25 años



-- La cantidad de envios que han salido desde portugal

-- Nombre del cliente y el número de pedidos del cliente que mas pedidos ha realizado en la empresa.

-- El dia que se envió el pedido, el dia que llegó y cuanto tiempo transcurrió en Francia en 1998.



-- Aumenta el precio de todos los productos un 0.4%

-- Calcula la media del precio de los productos enviados desde Rio de Janeiro

-- Aumenta un 20% el precio de todos los productos que tengan un precio unitario inferior a 10.


-- Nombre de cliente de todos los clientes que han sido atendidos por empleados con una A en su apellido.

-- El nombre de la compañia del cliente, nombre del contacto, código de orden de la compra, decha de la orden de la compra, código de producto y nombre de la compañía proveedora siempre que estas comiencen de por la letra a hasta la letra g. Tienen que haber pedido entre 23 y 187 productos.

-- Número de pedidos que se han realizado por año y meses ordenado por año y por mes. 


-- 1.muestra el nombre, precio y coste (precio - 10%) de cada producto.
-- 2.crea una tabla con las unidades que contiene cada producto, otra columna con las unidades -2 debido a la inflacion y otra con el proveedor que las suministra
-- 3.Unos clientrs han hecho un pedido desde la misma cuenta, pero lo quieren en paquetes separados, son 5 y el id de pedido es 10250

-- 4.Muestra una tabla con la cantidad de productos que ha pedido cada cliente
-- 5.Muestra la cantidad de empleados que tiene cada territorio
-- 6.Una tabla con la cantidad de territorios que hay por region

-- 7. El ejercicio 1 pero solo se mostraran los productos que tengan un coste superior a 10
-- 8. el ejercicio4 pero , como queremos recompensar a los clientes con un vip, solo necesitamos los que han pedido mas de 80 productos
-- 9. El nombre de los proveedores que suministran mas de 3 productos.

-- 10. los nombres de los productos en mayusculas
-- 11. los dos primeros numeros de las id de los productos
-- 12. los nombres de los territorios en minusculas

-- 13. sumale 5 dias a las fechas de llegada de los pedidos para pedir valoracion al cliente sobre el producto
-- 14. muestra el dia que se envió el pedido, el dia que llegó y cuanto tiempo transcurrió entre esas dos fechas
-- 15. una tabla con los años que tenian los empleados cuando les contrataron y que edad tienen ahora
28 de abril

Alex Rubio Bravo
Alex Rubio Bravo
09:40
use northwind;



-- Los pedidos enviados a cada ciudad desde Brasil.
SELECT 
    City, COUNT(orderid) pedidos
FROM
    Customers c,
    Orders o
WHERE
    c.CustomerID = o.CustomerID
HAVING pedidos;


select * from Orders group by ShipCity having ShipCountry = 'Brazil';



-- Los clientes de Barcelona por barrios.
select contactname , PostalCode
from customers
where city = 'Barcelona'
group by contactname;

select CustomerID, CompanyName, City from Customers group by PostalCode having City like '%Barcelona%'; 

-- los clientes de London.
select contactname 
from customers
where city = 'London';

select CustomerID, CompanyName, City from Customers having City like '%London%'; 


-- Pedidos enviados en 1996 agrupados por ShipName.

select OrderID, ShippedDate, ShipName from Orders group by ShipName having ShippedDate like '1996%';


-- Clientes alemanes que han hecho pedido en julio de 1998.
select Contactname, Orderdate
from Customers c, Orders o
where c.CustomerID = o.CustomerID
and Country = 'Germany'
having year(OrderDate) = 1998
and month(OrderDate) = 7;

Select c.CompanyName, c.Country from Customers c, Orders o where c.CustomerID = o.CustomerID  and c.Country like 'Germany%' and OrderDate ='1998-07%' group by c.CompanyName;

-- Empleados que tengan entre 18 y 25 años
select FirstName, truncate(datediff(curdate(), date (BirthDate))/365, 0) Edad
from Employees 
having Edad between 18 and 25;

Select EmployeeID from Employees where left((datediff(current_date(), birthDate)/365),2)>18 and left((datediff(current_date(), birthDate)/365),2) <25;

-- La cantidad de envios que han salido desde portugal
select OrderID , ShipCountry
from Orders 
where ShipCountry = 'portugal';

select count(OrderID) from Orders where ShipCountry like  '%Portugal%';

-- Nombre del cliente y el número de pedidos del cliente que mas pedidos ha realizado en la empresa.
select contactName , count(orderid) pedidos
from customers c, orders o
where c.customerid = o.customerid
having max(pedidos);

select c.CompanyName, count(o.OrderID) as 'numero de pedidos' from Customers c, Orders o where c.CustomerID=o.CustomerID group by c.CompanyName order by count(o.OrderID) desc limit 1;

-- El dia que se envió el pedido, el dia que se estima la llegada y cuanto tiempo transcurrió en Francia en 1998.
select shippeddate, requireddate, datediff(requireddate, shippeddate)
from orders
where shipcountry = 'France'
and year(orderdate) = 1998;

select 

-- Aumenta el precio de todos los productos un 0.4%
select productname, 1.04*unitprice
from products;

-- Calcula la media del precio de los productos enviados desde Rio de Janeiro
select productname, avg(p.unitprice)
from products p, orderdetails od, orders o
where p.productid = od.productid
and od.orderid = o.orderid
and shipcity = 'Rio de Janeiro';

-- Aumenta un 20% el precio de todos los productos que tengan un precio unitario inferior a 10.
select productname, unitprice, 1.2 * unitprice as precio_aumentado
from products
where unitprice < 10;




 







