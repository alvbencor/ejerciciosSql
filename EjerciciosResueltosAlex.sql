use dbmx2ffy7molit;

-- 1.muestra el nombre, precio y coste (precio - 10%) de cada producto.

select ProductName, UnitPrice, (UnitPrice*0.9) as coste  from Products;

-- 2.crea una tabla con las unidades que contiene cada producto, otra columna con las unidades -2 debido a la inflacion y otra con el proveedor que las suministra

select ProductName, UnitsInStock -2, SupplierID from Products;

-- 3.Unos clientrs han hecho un pedido desde la misma cuenta, pero lo quieren en paquetes separados, son 5 y el id de pedido es 10250

Select *, (Quantity / 5) as  "Unidades a repartir" from orderdetails where OrderID = 10250;

-- 4.Muestra una tabla con la cantidad de productos que ha pedido cada cliente

Select o.CustomerID,  count(od.ProductID) from orders o, orderdetails od group by o.CustomerID;

-- 5.Muestra la cantidad de empleados que tiene cada territorio

select count(EmployeeID) as "numero de empleados", TerritoryID from employeeterritories group by TerritoryID;
-- 6.Una tabla con la cantidad de territorios que hay por region

select count(TerritoryID), RegionID from territories group by RegionID;

-- 7. El ejercicio 1 pero solo se mostraran los productos que tengan un coste superior a 10

select ProductName, UnitPrice, (UnitPrice*0.9) as coste  from products having (UnitPrice*0.9) > 10;

-- 8. el ejercicio4 pero , como queremos recompensar a los clientes con un vip, solo necesitamos los que han pedido mas de 80 productos

Select o.CustomerID,  count(od.ProductID) from orders o, orderdetails od  group by o.CustomerID having count(od.ProductID)>80;

-- 9. El nombre de los proveedores que suministran mas de 3 productos.

Select s.CompanyName, count(p.ProductID) from suppliers s, products p  where s.SupplierID = p.SupplierID group by s.CompanyName having count(p.ProductID)>3;

-- 10. los nombres de los productos en mayusculas

select upper(ProductName) from products;
-- 11. los dos primeros numeros de las id de los productos
select ProductName, left(ProductID,2) from products;
-- 12. los nombres de los territorios en minusculas

select lower(TerritoryDescription) from territories;

-- 13. sumale 5 dias a las fechas de llegada de los pedidos para pedir valoracion al cliente sobre el producto

select OrderID,RequiredDate, date_add(RequiredDate,interval 5 day) from Orders;

-- 14. muestra el dia que se envió el pedido, el dia que llegó y cuanto tiempo transcurrió entre esas dos fechas

select ShippedDate, RequiredDate, datediff(RequiredDate, ShippedDate) as 'tiempo transcurrido' from Orders;

-- 15. una tabla con los años que tenian los empleados cuando les contrataron y que edad tienen ahora

select FirstName, BirthDate, HireDate, left((datediff(current_date(), birthDate)/365),2) as 'edad hoy',left((datediff(HireDate, birthDate)/365),2) as 'edad contrato'  from Employees;