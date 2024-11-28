use finca_agricola_LL;

-- 1 aumentar cantidad de stock de un producto cuando se inserte una nueva cosecha
drop trigger if exists aumentar_cantidad_producto;
delimiter //
create trigger aumentar_cantidad_producto
after insert on cosecha
for each row
begin
	declare id_producto_i int;
    set id_producto_i = (select cul.id_producto from cosecha c inner join cultivo cul on c.id_cultivo = cul.id where c.id = new.id);
	update producto set cantidad_kg = cantidad_kg + new.cantidad_cosechada_kg where id = id_producto_i;
end  
// delimiter ;


-- 2 actualizar precio total de una compra
-- cada que se agregue un producto
drop trigger if exists actualizar_precio_total_compra;
delimiter //
create trigger actualizar_precio_total_compra
after insert on compra_producto
for each row
begin
	update compra set precio_total =precio_total(new.id_compra) where id=new.id_compra;
end  
// delimiter ;


-- 3 actualizar precio total de una venta
-- cada que se agregue un producto
drop trigger if exists actualizar_precio_total_venta;
delimiter //
create trigger actualizar_precio_total_venta
after insert on venta_producto
for each row
begin
	call bucle_precio_total_venta();
end  
// delimiter ;


-- 4 actualizar la cantidad de hectareas libre de los terrenos 
-- cuando se ingrese un nuevo cultivo
drop trigger if exists actualizar_hectareas_libres;
delimiter //
create trigger actualizar_hectareas_libres
after insert on cultivo
for each row
begin
	update terreno set hectareas_libres = hectareas_libres - new.hectareas_usadas where id = new.id_terreno;
end  
// delimiter ;


-- 5 asignar login a un cliente cuando se cree uno nuevo
drop trigger if exists asignar_login_cliente;
delimiter //
create trigger asignar_login_cliente
after insert on login
for each row
begin
	if (new.rol = 'cliente') then
		update cliente set id_login = new.id where id = @var_cliente;
    end if;
end  
// delimiter ;


-- 6 asignar login a un empleado cuando se cree uno nuevo
drop trigger if exists asignar_login_empleado;
delimiter //
create trigger asignar_login_empleado
after insert on login
for each row
begin
	if (new.rol = 'empleado') then
		update empleado set id_login = new.id where id = @var_empleado;
	end if;
end  
// delimiter ;

-- 7 asignar login a un proveedor cuando se cree uno nuevo
drop trigger if exists asignar_login_proveedor;
delimiter //
create trigger asignar_login_proveedor
after insert on login
for each row
begin
	if (new.rol = 'proveedor') then
		update proveedor set id_login = new.id where id = @var_proveedor;
	end if;
end  
// delimiter ;

-- 8 Evitar que se inserten compras con precios negativos en la tabla compra_producto.
drop trigger if exists evitar_compras_negativas;
delimiter //
create trigger evitar_compras_negativas
before insert on compra_producto
for each row
begin
	if (new.precio_unitario <= 0)then
		signal sqlstate '45000' set message_text = 'no se pueden usar valores negativos en el precio de un producto';
    end if;
end  
// delimiter ;

-- 9 Evitar que se inserten ventas con cantidades de cero o negativas en la tabla venta_producto.
drop trigger if exists evitar_ventas_negativas;
delimiter //
create trigger evitar_ventas_negativas
before insert on venta_producto 
for each row
begin
	if (new.cantidad <= 0)then
		signal sqlstate '45001' set message_text = 'no se pueden usar valores negativos en la cantidad de un producto';
    end if;
end  
// delimiter ;