use finca_agricola_LL;


-- 1. Funcion para saber cuantos productos diferentes se vendieron en una venta
drop function if exists cantidad_productos_ventas;
delimiter // 
create function cantidad_productos_ventas(id_ventaF int)
returns int deterministic
begin
	declare cant_productos_venta int;
    
    set cant_productos_venta= (select count(*) from venta_producto where id_venta=id_ventaF);
    
    return cant_productos_venta;
end
// delimiter ;

select cantidad_productos_ventas(1);



-- 2. Funcion para saber el precio_total de una venta
drop function if exists precio_total_venta;
delimiter // 
create function precio_total_venta(id_ventaF int)
returns int deterministic
begin
	declare productos_venta int;
    declare suma_producto int;
    declare contador int default 1;
    
    set productos_venta= (select sum(pp.precio*vp.cantidad) from venta_producto vp inner join presentacion_producto pp on vp.id_presentacion_producto=pp.id where vp.id_venta=id_ventaF);
    
    return productos_venta;
end
// delimiter ;

select precio_total_venta(2) as precio_total;

-- 3. Funcion para calcular el precio total de una compra
drop function if exists precio_total;
delimiter //
create function precio_total (id_compra_i int)
returns bigint deterministic
begin
	declare precio_total bigint;
    set precio_total = (select sum(precio_unitario * cantidad) from compra_producto where id_compra = id_compra_i group by id_compra);
    return precio_total;
end
// delimiter ;

select precio_total (2);
select * from compra_producto;

-- 4. Funcion para mostrar el producto mas caro de una compra
drop function if exists ver_producto_caro;
delimiter //
create function ver_producto_caro (id_compra_i int)
returns varchar(50) deterministic
begin
	declare producto_i varchar(50);
    set producto_i = (select producto from compra_producto where id_compra = id_compra_i order by precio_unitario desc limit 1);
    return producto_i;
end
// delimiter ;

select ver_producto_caro (6);


	
-- 5 nombres completos
drop function if exists nombre_completo;
delimiter //
create function nombre_completo (id_persona int, tipo varchar(20))
returns varchar(50) deterministic
begin
	declare nombre varchar(50);
    if tipo = 'empleado' then
		set nombre = (select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2) from empleado where id = id_persona);
	elseif tipo = 'proveedor' then
		set nombre = (select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2) from preveedor where id = id_persona);
	elseif tipo = 'cliente' then
		set nombre = (select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2) from cliente where id = id_persona);
	else set nombre = 'la tabla que ingresaste no existe';
    end if;
	return nombre;
end
// delimiter ;

select nombre_completo(10,'proveedor');

-- 6 salario diario de un empleado
drop function if exists salario_diario;
delimiter //
create function salario_diario (id_empleado int)
returns decimal(12,2) deterministic
begin
	return (select (c.sueldo_mensual / c.dias_trabajo) from empleado e inner join cargo c on e.id_cargo = c.id where e.id = id_empleado);
end
// delimiter ;

select salario_diario(1);

-- 7 promedio de venta de una presentacion
drop function if exists promedio_presentacion;
delimiter //
create function promedio_presentacion (id_presentacion int)
returns decimal(12,2) deterministic
begin
	return (select avg(cantidad) from venta_producto where id_presentacion_producto = id_presentacion group by id_presentacion);
end
// delimiter ;

select promedio_presentacion(2);

-- 8 total de ingresos por ventas en un rango de fechas.
drop function if exists ventas_fechas;
delimiter //
create function ventas_fechas (fecha1 date , fecha2 date)
returns decimal(12,2) deterministic
begin
	return (select sum(precio_total) from venta where fecha_venta between fecha1 and fecha2);
end
// delimiter ;

select ventas_fechas('2024-11-11','2024-11-23');








select * from empleado;
select * from cargo;
select * from venta_producto;
select * from venta;






























































































-- 16. calcular el porcentaje de ganancia de un mes. la ganacia se calcula restandole los gastos a los ingresos 

drop function if exists porcentaje_ganancia;
delimiter //
create function porcentaje_ganancia (ingresosF int, ganancia_finalF int)
returns varchar(100) deterministic
begin
	declare porcentaje_ganancia bigint;
    declare porcentaje varchar(100);
    
    set porcentaje_ganancia= (ganancia_finalF/ingresosF)*100;
	set porcentaje= concat_ws('',porcentaje_ganancia,'%');
    return porcentaje;
end
// delimiter ;

select id,porcentaje_ganancia(ganancia_final, gastos) as porcentaje_ganancia from ingresos_gastos_mensuales;
-- 17. Calcular la cantidad total de cosecha de un producto

drop function if exists total_cosecha_producto;
delimiter //
create function total_cosecha_producto (id_producto int)
returns int deterministic
begin
	declare total_cosecha int;
    
    set total_cosecha=(select sum(cs.cantidad_total_kg) from cultivo c inner join producto p on c.id_producto=p.id 
    inner join cosecha cs on c.id=cs.id_cultivo 
    where p.id=id_producto);
    return total_cosecha;
end
// delimiter ;

select total_cosecha_producto(3) as total_cosecha;

insert into ingresos_gastos_mensuales(inicio_mes,fin_mes,ingresos,gastos,ganancia_final) 
values ('2024-10-01','2024-10-31',ventas_fechas('2024-10-01','2024-10-31'),gastos_mensuales('2024-10-01','2024-10-31'),0);

-- 18. Calcular los gastos mensuales
-- previamente debes ejecutar los procedimientos #3 y #4 asignar_pago_final() y asignar_salarios()
drop function if exists gastos_mensuales;
delimiter //
create function gastos_mensuales (inicio_mes date, fin_mes date)
returns int deterministic
begin
	declare gastos_compras int;
    declare gastos_salarios int default 0;
    declare gastos_mensuales int default 0;
    
    set gastos_compras = (select sum(precio_total) from compra where fecha_compra between inicio_mes and fin_mes);
    set gastos_salarios = (select sum(pago_final) from salarios where inicio_mes_pagado between inicio_mes and fin_mes or fin_mes_pagado between inicio_mes and fin_mes);
    set gastos_mensuales= gastos_compras+gastos_salarios;
    
    return gastos_mensuales;
end
// delimiter ;
select gastos_mensuales('2024-10-01','2024-10-31') as gastos_mensuales;

-- 19. Calcular el salario total pagado a un empleado en un mes

drop function if exists calcular_salario_empleado;
delimiter //
create function calcular_salario_empleado (dias_trabajadosF int, id_cargoF int)
returns int deterministic
begin
	declare dia_trabajo int;
    declare salario int;
    
    set dia_trabajo =(select sueldo_mensual/dias_trabajo from cargo where id=id_cargoF);
    
    set salario = dia_trabajo*dias_trabajadosF;
    return salario;
end
// delimiter ;

select calcular_salario_empleado(24,1) as sueldo_mes;


-- 20. Calcular el total de ventas hechas por cliente en un mes 

drop function if exists total_ventas_cliente;
delimiter //
create function total_ventas_cliente (id_clienteF int, mes int)
returns int deterministic
begin
	declare total_ventas int;
	set total_ventas = (select count(*) from venta where id_cliente=id_clienteF and month(fecha_venta)=mes);
    
    return total_ventas;
end
// delimiter ;
select total_ventas_cliente(1,11) as numero_ventas;
