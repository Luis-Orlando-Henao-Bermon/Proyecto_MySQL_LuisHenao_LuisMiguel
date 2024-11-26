use finca_agricola_LL;


-- Funcion para saber cuantos productos diferentes se vendieron en una venta
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



-- Funcion para saber el precio_total de una venta
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

