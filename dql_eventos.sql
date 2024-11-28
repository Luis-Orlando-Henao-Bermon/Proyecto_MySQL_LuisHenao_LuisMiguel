-- en caso de que tu computador no pueda ejecutar las funciones descomenta la siguiente linea
-- SET GLOBAL event_sheduler = ON;

use finca_agricola_LL;

-- 1. evento para registro de ingresos y gastos en un mes cada mes

drop event if exists event_ingresos_gastos_mensuales;

create event event_ingresos_gastos_mensuales
on schedule every 1 month
do insert into ingresos_gastos_mensuales(inicio_mes,fin_mes,ingresos,gastos,ganancia_final) 
values (DATE_FORMAT(CURDATE(), '%Y-%m-01'),
LAST_DAY(CURDATE()),
ventas_fechas(DATE_FORMAT(CURDATE(), '%Y-%m-01'),LAST_DAY(CURDATE())),
gastos_mensuales(DATE_FORMAT(CURDATE(), '%Y-%m-01'),LAST_DAY(CURDATE())),
(ventas_fechas(DATE_FORMAT(CURDATE(), '%Y-%m-01'),LAST_DAY(CURDATE()))+gastos_mensuales(DATE_FORMAT(CURDATE(), '%Y-%m-01'),LAST_DAY(CURDATE()))));

-- 2. evento para ingresar  los precios totales a la tabla venta todos los dias

drop event if exists ingresar_precios_total_venta;

create event ingresar_precios_total_venta
on schedule every 1 day
do call bucle_precio_total_venta();
show events;

-- 3. evnto para asignar los pagos finales de la tabla salarios todos los dias

drop event if exists asignar_precio_salarios;

create event asignar_precio_salarios
on schedule every 1 day
do call asignar_salarios();
show events;drop event if exists asignar_precio_salarios;

-- 4. evento para insertar una venta en 10 segundos

drop event if exists insertar_venta;

create event insertar_venta
on schedule at current_timestamp + interval 10  second
do call hacer_venta(current_date(),25,3);
show events;

-- 5. crear un nuevo login despues de 10s

drop event if exists insertar_login;

create event insertar_login
on schedule at current_timestamp + interval 10  second
do insert into login(usuario,contraseña, rol) values ('userI','PasswordI','cliente');

-- 6. eliminar el ultimo login

drop event if exists eliminar_login;

delimiter //
create event eliminar_login
on schedule at current_timestamp + interval 20  second
do 
begin
	declare num_login int;
    set num_login=(select max(id) from login);
    
    delete from login where id=num_login;
end;
// delimiter ;


-- 7. añadir metodo_pago

drop event if exists insertar_metodo_pago;

delimiter //
create event insertar_metodo_pago
on schedule at current_timestamp + interval 5  second
do insert into metodo_pago(metodo) values('paypal');
// delimiter ;

-- 8. insertar un nuevo empleado

drop event if exists insertar_empleado;

delimiter //
create event insertar_empleado
on schedule at current_timestamp + interval 5  second
do call registrar_empleado('salome','samantha','gomez','bermon',15235468,3);
// delimiter ;

-- 9. actualizar un login

drop event if exists evento_actualizar_login;

delimiter //
create event evento_actualizar_login
on schedule at current_timestamp + interval 20  second
do call actualizar_login('nuevoLoginEvento','password_evento',5);
// delimiter ;

-- 10. sumar 1 a la cantidad de un producto una vez al dia

drop event if exists sumar_producto;

delimiter //
create event sumar_producto
on schedule every 1 day
do update producto set cantidad_kg=cantidad_kg+1;
// delimiter ;

-- 11. crear una cosecha para los tomates cada 70 dias

drop event if exists cosecha_tomate;

delimiter //
create event cosecha_tomate
on schedule every 70 day
do call insertar_cosecha(current_date(),null,8,null,null);
// delimiter ;

-- 12. insertar un salario a un empleado cada mes

drop event if exists insertar_salario;

delimiter //
create event insertar_salario
on schedule every 1 month
do call insertar_salario(5,24,DATE_FORMAT(CURDATE(), '%Y-%m-01'),LAST_DAY(CURDATE()));
// delimiter ;

-- 13. crear una compra

drop event if exists insertar_compra;

delimiter //
create event insertar_compra
on schedule at current_timestamp + interval 20  second
do call insertar_compra(5,current_date(),3);
// delimiter ;

-- 14. Añadir un producto a una compra 

drop event if exists añadir_producto_compra;

delimiter //
create event añadir_producto_compra
on schedule at current_timestamp + interval 20  second
do call insertar_producto_compra(12,50000,10,'Machete','Herramienta');
// delimiter ;

-- 15. Insertar un cultivo 

drop event if exists insertar_cultivo;

delimiter //
create event insertar_cultivo
on schedule at current_timestamp + interval 20  second
do call insertar_cultivo(7,3,1);
// delimiter ;

-- 16. Insertar un producto a una venta 

drop event if exists insertar_producto_venta;

delimiter //
create event insertar_producto_venta
on schedule at current_timestamp + interval 20  second
do call asignar_productos_venta(52,4,2,@mensaje);
// delimiter ;

-- 17. Insertar un cliente 

drop event if exists insertar_cliente;

delimiter //
create event insertar_cliente
on schedule at current_timestamp + interval 20  second
do call registrar_cliente('Franklin',null,'Henao','Merlano',885132151);
// delimiter ;

-- 18. Insertar un proveedor 

drop event if exists insertar_proveedor;

delimiter //
create event insertar_proveedor
on schedule at current_timestamp + interval 20  second
do call registrar_proveedor('pepe','francisco','mendoza','gonzales',8522215,'Calle 23 #2-12 barrio u');
// delimiter ;

-- 19. cambiar el segundo nombre de un cliente

drop event if exists cambiar_nombre2_cliente;

delimiter //
create event cambiar_nombre2_cliente
on schedule at current_timestamp + interval 20  second
do update cliente set nombre2='Manuel' where id=52;
// delimiter ;

-- 20. cambiar la contraseña de un login 

drop event if exists cambiar_contraseña_login;

delimiter //
create event cambiar_contraseña_login
on schedule at current_timestamp + interval 20  second
do update login set contraseña='pasword1234' where id=52;
// delimiter ;
