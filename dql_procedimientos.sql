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

-- 6 asignar productos a una venta
drop procedure if exists asignar_productos_venta;
delimiter //
create procedure asignar_productos_venta (
	 id_ventaF int,
     id_presentacion_productoF int,
     cantidadF int,
    out mensaje varchar(70)
)
begin 
	declare cantidad_kg_vender int;
	declare cantidad_kg_disponibles int;
    declare id_producto_f int;
    set id_producto_f = (select id_producto from presentacion_producto where id = id_presentacion_productoF);
    set cantidad_kg_disponibles = (select cantidad_kg from producto where id = id_producto_f);
    set cantidad_kg_vender = (select cantidad_kg from presentacion_producto where id = id_presentacion_productoF) * cantidadF;
    
	if (cantidad_kg_vender < cantidad_kg_disponibles) then
		insert into venta_producto(id_venta,id_presentacion_producto,cantidad) values (id_ventaF,id_presentacion_productoF,cantidadF);
        update producto set cantidad_kg = cantidad_kg_disponibles - cantidad_kg_vender where id = id_producto_f;
        select 'el producto fue agregado' into mensaje;
	else 
		select 'la cantida de producto que deseas agregar supera la cantidad en stok' into mensaje;
    end if;
end
//delimiter ;


call asignar_productos_venta(51,2,5,@mensaje);
select @mensaje;

-- 7. Insertar un cultivo 

drop procedure if exists insertar_cultivo;
delimiter //
create procedure insertar_cultivo (id_productoF int,id_terrenoF int,hectareas_usadasF int)
begin
	insert into cultivo(id_producto,id_terreno,hectareas_usadas) 
    values (id_productoF,id_terrenoF,hectareas_usadasF);
end
// delimiter ;

call insertar_cultivo(3,7,3);
-- 8. Registrar un nuevo cliente

drop procedure if exists registrar_cliente;
delimiter //
create procedure registrar_cliente (nombre1F varchar(50),nombre2F varchar(50),apellido1F varchar(50),apellido2F varchar(50),cedulaF bigint)
begin
	insert into cliente(nombre1,nombre2,apellido1,apellido2,cedula) 
    values (nombre1F,nombre2F,apellido1F,apellido2F,cedulaF);
end
// delimiter ;

call registrar_cliente('Luis','Orlando','Henao','Bermon',1096852353);

-- 9. Insertar un login para los clientes

drop procedure if exists crear_login_cliente;
delimiter //
create procedure crear_login_cliente (usuarioF varchar(50),contraseñaF varchar(50),id_cliente int)
begin
	declare num_id int;
    
    set num_id =(select count(*) from login)+1;

	set @var_cliente = id_cliente;
	insert into login (usuario,contraseña,rol)
    values (usuarioF,contraseñaF,'cliente');
    
end
// delimiter ;
call crear_login_cliente('pipipi','pipipi',50);

-- 10. Insertar un nuevo empleado

drop procedure if exists registrar_empleado;

delimiter //
create procedure registrar_empleado (nombre1F varchar(50),nombre2F varchar(50),apellido1F varchar(50),apellido2F varchar(50),cedulaF bigint,id_cargoF int)
begin
	insert into empleado(nombre1,nombre2,apellido1,apellido2,cedula,id_cargo) 
    values (nombre1F,nombre2F,apellido1F,apellido2F,cedulaF,id_cargoF);
end
// delimiter ;

call registrar_empleado('Luis','Miguel','Caicedo','Bermon','1253362420',3);

-- 11. Insertar un login para los empleado

drop procedure if exists crear_login_empleado;
delimiter //
create procedure crear_login_empleado (usuarioF varchar(50),contraseñaF varchar(50),id_empleado int)
begin
	declare num_id int;
    
    set num_id =(select count(*) from login)+1;
	set @var_empleado = id_empleado;
	insert into login (usuario,contraseña,rol)
    values (usuarioF,contraseñaF,'empleado');
    
       -- update empleado set id_login=num_id where id=id_empleado; -- Falta hacer trigger
end
// delimiter ;
call crear_login_empleado('luisito9292','contra1014',51);

-- 12. Insertar un nuevo proveedor

drop procedure if exists registrar_proveedor;

delimiter //
create procedure registrar_proveedor (nombre1F varchar(50),nombre2F varchar(50),apellido1F varchar(50),apellido2F varchar(50),cedulaF bigint,direccionF varchar(100))
begin
	insert into proveedor(nombre1,nombre2,apellido1,apellido2,cedula,direccion) 
    values (nombre1F,nombre2F,apellido1F,apellido2F,cedulaF,direccionF);
end
// delimiter ;

call registrar_proveedor('Laura','Patricia','Salamanca','Zuleta','10225365845','Calle 23 #2-12 barrio u');

-- 13. Insertar un login para los proveedor

drop procedure if exists crear_login_proveedor;
delimiter //
create procedure crear_login_proveedor (usuarioF varchar(50),contraseñaF varchar(50),id_proveedor int)
begin
	declare num_id int;
    
    set num_id =(select count(*) from login)+1;
	set @var_proveedor = id_proveedor;
	insert into login (usuario,contraseña,rol)
    values (usuarioF,contraseñaF,'proveedor');
    
       -- update proveedor set id_login=num_id where id=id_empleado; -- Falta hacer trigger
end
// delimiter ;
call crear_login_proveedor('maria','jose',2);

-- 14. Actualizar un login 

drop procedure if exists actualizar_login;
delimiter //
create procedure actualizar_login (usuarioF varchar(50),contraseñaF varchar(50),id_login int)
begin

	update login set usuario=usuarioF, contraseña=contraseñaF where id=id_login;
end
// delimiter ;

call actualizar_login('user1','pasword1',1);

-- 15.  Actualizar el estado de una herramienta/maquinaria

drop procedure if exists actualizar_herramienta;
delimiter //
create procedure actualizar_herramienta (id_nuevo_estado int,id_herramienta int)
begin

	update maquinaria_herramienta set id_estado=id_nuevo_estado where id=id_herramienta;
end
// delimiter ;
call actualizar_herramienta(3,1);

-- 16. Insertar una nueva herramienta/maquina

drop procedure if exists insertar_herramienta;
delimiter //
create procedure insertar_herramienta (nombreF varchar(50),id_tipoF int,id_estadoF int, id_bodegaF int)
begin
	
    insert into maquinaria_herramienta(nombre,id_tipo,id_estado,id_bodega) values (nombreF,id_tipoF,id_estadoF,id_bodegaF);
    
end
// delimiter ;
call insertar_herramienta('Machete',2,3,4);

-- 17. Insertar una cosecha

drop procedure if exists insertar_cosecha;
delimiter //
create procedure insertar_cosecha (fecha_inicioF date,fecha_finF date,id_cultivoF int,cantidad_cosechada_kgF int,cantidad_perdida_kgF int)
begin
	
    declare id_product int;
    declare total int;
    
    set id_product =(select distinct cu.id_producto from cultivo cu inner join cosecha c on cu.id=c.id_cultivo where cu.id=id_cultivoF);
    set total=cantidad_cosechada_kgF+cantidad_perdida_kgF;
    
	insert into cosecha(fecha_inicio,fecha_fin,id_cultivo,cantidad_total_kg,cantidad_cosechada_kg,cantidad_perdida) -- Falta hacer triguer
    values (fecha_inicioF,fecha_finF,id_cultivoF,total,cantidad_cosechada_kgF,cantidad_perdida_kgF);
    
     -- update producto set cantidad_kg=cantidad_kg+total where id=id_product;
end
// delimiter ;
call insertar_cosecha('2024-11-22','2024-11-27',1,5000,500);
call insertar_cosecha('2024-12-22','2024-12-30',1,5000,500);
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

-- 20. Añadir producto a una compra
drop procedure if exists insertar_producto_compra;
delimiter //
create procedure insertar_producto_compra (id_compraF int, precio_unitarioF int, cantidadF int,productoF varchar(50),tipoF varchar(30))
begin
	insert into compra_producto(id_compra, precio_unitario, cantidad,producto,tipo ) values(id_compraF, precio_unitarioF, cantidadF,productoF,tipoF);
    
end
// delimiter ;

call insertar_producto_compra(11,50000,10,'Machete','Herramienta');


-- prueba de trigger #7 'asignar_login_proveedor'
call crear_login_proveedor('lau','salam',21);

-- prueba de trigger #8 'evitar_compras_negativas'
call insertar_producto_compra(11,-34,2,'Machete','Herramienta');


-- prueba de trigger #9 'evitar_ventas_negativas'
call asignar_productos_venta(51,2,-3,@mensaje);