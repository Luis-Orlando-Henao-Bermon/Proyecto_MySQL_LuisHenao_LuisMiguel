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


-- 10 Prohibir que se registre un cultivo si el producto asociado no existe en la tabla producto.
drop trigger if exists evitar_registro_cultivo_erroneo;
delimiter //
create trigger evitar_registro_cultivo_erroneo
before insert on cultivo 
for each row
begin
	if (new.id_producto not in (select id from producto))then
		signal sqlstate '45002' set message_text = 'El id producto que se intentó ingresar no existe';
    end if;
end  
// delimiter ;


-- 11 Calcular automáticamente el porcentaje de ganancia en la tabla ingresos_gastos_mensuales
-- al insertar datos

drop trigger if exists porcentaje_ganancia;
delimiter //
create trigger porcentaje_ganancia
after insert on ingresos_gastos_mensuales 
for each row
begin
	declare porcentaje decimal(10,2);
    set porcentaje = (new.ganancia_final / new.ingresos)*100;
    set @id = new.id;
    set @porcentaje = porcentaje;
end  
// delimiter ;

select @id as id_gastos_ingresos , @porcentaje as porcentaje_ganancia;

-- 12 eliminar el id login del cliente si se elimina un login
drop trigger if exists eliminar_id_login_cliente;
delimiter //
create trigger eliminar_id_login_cliente
before delete on login 
for each row
begin
	if (old.rol = 'cliente') then
		update cliente set id_login = null where id_login = old.id;
    end if;
end  
// delimiter ;

delete from login where id = 121;

-- 13 eliminar el id login del proveedor si se elimina un login
drop trigger if exists eliminar_id_login_proveedor;
delimiter //
create trigger eliminar_id_login_proveedor
before delete on login 
for each row
begin
	if (old.rol = 'proveedor') then
		update proveedor set id_login = null where id_login = old.id;
    end if;
end  
// delimiter ;

delete from login where id = 15;

-- 14 eliminar el id login del empleado si se elimina un login
drop trigger if exists eliminar_id_login_empleado;
delimiter //
create trigger eliminar_id_login_empleado
before delete on login 
for each row
begin
	if (old.rol = 'empleado') then
		update empleado set id_login = null where id_login = old.id;
    end if;
end  
// delimiter ;

delete from login where id = 63;

-- 15 agregar a maquinaria_herramienta el producto que se compre
drop trigger if exists agregar_maquinaria_herramienta;
delimiter //
create trigger agregar_maquinaria_herramienta
after insert on compra_producto
for each row
begin
	declare contador int default 1;
    if (new.tipo = 'Herramienta') then
		while (contador <= new.cantidad) do
			insert into maquinaria_herramienta (nombre,id_tipo,id_estado,id_bodega) values (new.producto,2,2,1);
			set contador = contador + 1;
		end while ;
	end if ;
end  
// delimiter ;

-- 16 agregar a insumos el producto que se compre
drop trigger if exists agregar_insumos;
delimiter //
create trigger agregar_insumos
after insert on compra_producto
for each row
begin
    if (new.tipo = 'insumos') then
		insert into insumos (nombre,id_tipo_insumo,cantidad,id_bodega) values (new.producto,1,new.cantidad,1);
	end if ;
end  
// delimiter ;

-- 17 evitar que se registre un cultivo si las hectareas libres de el terreno son menores a las que quiere ingresar
drop trigger if exists evitar_cultivo_incoherente;
delimiter //
create trigger evitar_cultivo_incoherente
before insert on cultivo
for each row
begin
	if (new.hectareas_usadas > (select hectareas_libres from terreno where id = new.id_terreno)) then
		signal sqlstate '45003' set message_text = 'las hectareas que estas ingresando son mas de las que hay disponibles';
	end if;
end  
// delimiter ;

-- 18 borrar las ventas relacionadas con un cliente eliminado
drop trigger if exists borrar_ventas;
delimiter //
create trigger borrar_ventas
before delete on cliente
for each row
begin
	delete from venta_producto where id_venta = (select id from venta where id_cliente = old.id);
    delete from venta where id_cliente = old.id;
end  
// delimiter ;

delete from cliente where id = 48;

-- 19 cuando se elimine un presentacion_producto eliminar las filas en las que aparezca de venta_producto
drop trigger if exists borrar_ventas_producto;
delimiter //
create trigger borrar_ventas_producto
before delete on presentacion_producto
for each row
begin
	delete from venta_producto where id_presentacion_producto = old.id;
end  
// delimiter ;

delete from presentacion_producto where id = 2;



-- 20 eliminar compras realizadas relacionadas con un proveedor eliminado
drop trigger if exists borrar_compras;
delimiter //
create trigger borrar_compras
before delete on proveedor
for each row
begin
	delete from compra_producto where id_compra = (select id from compra where id_proveedor = old.id);
    delete from compra where id_proveedor = old.id;
end  
// delimiter ;

delete from proveedor where id = 3;