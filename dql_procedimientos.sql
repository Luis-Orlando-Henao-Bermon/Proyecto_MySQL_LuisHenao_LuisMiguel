use finca_agricola_LL;

-- 1 asignar precio total
-- previemente debes ejecutar la funcion #2 precio_total_venta
drop procedure if exists asignar_precio_total;
delimiter //
create procedure asignar_precio_total (id_venta int , precio_total_i int)
begin
	update venta set precio_total = precio_total_i where id = id_venta;
end
// delimiter ;

-- 2 hacer un bucle para asignar precio total en ventas
drop procedure if exists bucle_precio_total_venta;
delimiter //
create procedure bucle_precio_total_venta ()
begin
	declare contador int;
    set contador = 1;
	while contador <= (select count(*) from venta) do
		call asignar_precio_total (contador , precio_total_venta(contador));
        set contador = contador + 1;
	end while;
end
// delimiter ;

call bucle_precio_total_venta();

-- 3. asignar el pago final al salario de un empleado
-- previamente debes instalar la funcion numero #19 calcular_salario_empleado()
drop procedure if exists asignar_pago_final;
delimiter //
create procedure asignar_pago_final(id_salarioF int)
begin
	declare cargo int;
    declare id_empleado int;
    declare dias_trabajadosF int;
    
    set id_empleado=(select e.id from empleado e inner join salarios s on e.id=s.id_empleado where s.id=id_salarioF);
    set cargo= (select id_cargo from empleado where id= id_empleado);
    set dias_trabajadosF= (select dias_trabajados from salarios where id=id_salarioF);
    
	update salarios set pago_final = calcular_salario_empleado(dias_trabajadosF,cargo) where id = id_salarioF;
end
// delimiter ;
call asignar_pago_final(1);

-- 4. bucle para asignar el pago final a los salarios de los empleados

drop procedure if exists asignar_salarios;
delimiter //
create procedure asignar_salarios ()
begin
	declare contador int;
    set contador = 1;
	while contador <= (select count(*) from salarios) do
		call asignar_pago_final (contador);
        set contador = contador + 1;
	end while;
end
// delimiter ;

call asignar_salarios();


-- 5 hacer una venta 
drop procedure if exists hacer_venta;
delimiter //
create procedure hacer_venta (
    fecha_venta date,
    id_cliente int,
    id_metodo_pago int
)
begin 
	insert into venta(fecha_venta,id_cliente,precio_total,id_metodo_pago) values (fecha_venta,id_cliente,null,id_metodo_pago);
end
//delimiter ;

call hacer_venta (current_date(),4,2);
select * from venta;

-- 6 asignar productos a una venta
drop procedure if exists asignar_productos_venta;
delimiter //
create procedure asignar_productos_venta (
	in id_venta int,
    in id_presentacion_productoF int,
    in cantidad int,
    out mensaje varchar(70)
)
begin 
	declare cantidad_kg_vender int;
	declare cantidad_kg_disponibles int;
    declare id_producto int;
    set id_producto = (select id_producto from presentacion_producto where id = id_presentacion_productoF);
    set cantidad_kg_disponibles = (select cantidad_kg from producto where id = id_producto);
    set cantidad_kg_vender = (select cantidad_kg from presentacion_producto where id = id_presentacion_productoF) * cantidad;
    
	if (cantidad_kg_vender < cantidad_kg_disponibles) then
		insert into venta_producto(id_venta,id_presentacion_producto,cantidad) values (id_venta,id_presentacion_producto,cantidad);
        update producto set cantidad_kg = cantidad_kg_disponibles - cantidad_kg_vender where id = id_producto;
        select 'el producto fue agregado' into mensaje;
	else select 'la cantida de producto que deseas agregar supera la cantidad en stok' into mensaje;
    end if;
end
//delimiter ;



call asignar_productos_venta(51,2,1,@mensaje);
select @mensaje;