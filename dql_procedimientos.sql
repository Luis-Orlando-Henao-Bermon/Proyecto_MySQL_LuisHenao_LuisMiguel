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


-- 17. Insertar una cosecha

drop procedure if exists insertar_cosecha;
delimiter //
create procedure insertar_cosecha (fecha_inicioF date,fecha_finF date,id_cultivoF int,cantidad_cosechada_kgF int,cantidad_perdida_kgF int)
begin
	
    declare id_product int;
    declare total int;
    
    set id_product =(select distinct cu.id_producto from cultivo cu inner join cosecha c on cu.id=c.id_cultivo where cu.id=id_cultivoF);
    set total=cantidad_cosechada_kgF-cantidad_perdida_kgF;
    
	insert into cosecha(fecha_inicio,fecha_fin,id_cultivo,cantidad_total_kg,cantidad_cosechada_kg,cantidad_perdida)
    values (fecha_inicioF,fecha_finF,id_cultivoF,total,cantidad_cosechada_kgF,cantidad_perdida_kgF);
    
    update producto set cantidad_kg=cantidad_kg+total where id=id_product;
end
// delimiter ;
call insertar_cosecha('2024-11-22','2024-11-27',1,5000,500);
-- 18. Insertar salarios a un cliente

drop procedure if exists insertar_salario;
delimiter //
create procedure insertar_salario (id_empleadoF int, dias_trabajadosF int, inicio_mes_pagadoF date,fin_mes_pagadoF date)
begin
	declare cargo int;
    
    set cargo=(select id_cargo from empleado where id=id_empleadoF);
    
	insert into salarios(id_empleado, dias_trabajados,pago_final, inicio_mes_pagado,fin_mes_pagado) 
    values (id_empleadoF, dias_trabajadosF,calcular_salario_empleado(dias_trabajadosF,cargo), inicio_mes_pagadoF,fin_mes_pagadoF);
end
// delimiter ;
call insertar_salario(1,24,'2024-11-01','2024-11-30');

-- 19. Crear una compra
drop procedure if exists insertar_compra;
delimiter //
create procedure insertar_compra (id_proveedorF int, fecha_compraF date, id_metodo_pagoF int)
begin
	insert into compra(id_proveedor, fecha_compra, id_metodo_pago) values(id_proveedorF, fecha_compraF, id_metodo_pagoF);
end
// delimiter ;
call insertar_compra(1,current_date(),2);

-- 20. Añadir producto a una venta
drop procedure if exists insertar_producto_compra;
delimiter //
create procedure insertar_producto_compra (id_compraF int, precio_unitarioF int, cantidadF int,productoF varchar(50),tipoF varchar(30))
begin
	insert into compra_producto(id_compra, precio_unitario, cantidad,producto,tipo ) values(id_compraF, precio_unitarioF, cantidadF,productoF,tipoF);
    
    update compra set precio_total =precio_total(id_compraF) where id=id_compraF;
end
// delimiter ;

call insertar_producto_compra(11,50000,2,'Pala','Herramienta');

