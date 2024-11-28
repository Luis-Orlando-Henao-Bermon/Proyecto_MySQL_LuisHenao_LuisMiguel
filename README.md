# Proyecto_MySQL_LuisHenao_LuisMiguel
La finca L&L solicito una base de datos para el manejo de su finca, para la entrega de la base de datos se realizó la base de datos con posibles consultas, eventos, triggers, funciones y procedimientos que podría usar para el manejo de su base de datos. En este repositorio se encuentran todos los archivos necesarios para poder ejecutar la base de datos en cualquier sistema, así como el link al Notion en el cual se encuentra la documentación de la misma.

## Documentacion 
[Notion](https://spangle-apple-c4a.notion.site/Finca-agricola-L-L-1496a54c497a80adae0dc6231e0c2393)

[Video Explicacion](https://youtu.be/1qcDM8oOFIQ)

## Requisitos del sistema
Para poder ejecutar este proyecto necesitas tener instalado la aplicacion de escritorio workbech 8.0, git bash

### Orden de ejecucion de archivos
para que la base de datos pueda tener todas sus funciones, procedimientos, etc. debes ejecutar los archivos en el siguiente orden:
1. ddl.sql
2. dml.sql
3. dql_funciones.sql
4. dql_triggers.sql
5. dql_procedimientos.sql
6. dql_eventos
7. dql.sql
8. usuarios.sql
Despues de esto ya puedes ejecutar cualquiera de las funciones, procedimiento, etc.

## Modo de uso
Para poder usar la base de datos necesitar seguir una serie de pasos 

1. Descargar el repositorio: para esto debes entra a la carpeta en donde quieras guardar el proyecto y abrir git bash en ese proyecto y escribir el siguiente comando

   ``` bash
     git clone https://github.com/Luis-Orlando-Henao-Bermon/Proyecto_MySQL_LuisHenao_LuisMiguel
   ```
   con esto se clonara el repositorio en tu computador
   
3.  Abrir workbench y sus archivos: para esto abre workbech y arrastra los archivos que hay dentro del repositorio a la aplicacion de workbech
4.  Ejecutar los archivos: para esto da clic en el boton con el rayo que se encuentra en la parte superior izquierda
   ![image](https://github.com/user-attachments/assets/04897531-7b1e-44e7-80e1-67c1a653511f)

con esto ya puedes ejecutar los archivos y usar las consultas, funciones, procedimientos, triggers,eventos y usuarios.

## Creacion de tablas de la base de datos

``` sql
drop database if exists finca_agricola_LL;
create database finca_agricola_LL;
use finca_agricola_LL;

create table tipo_producto (
	id int primary key auto_increment,
    nombre varchar(20)
);

create table producto (
	id int primary key auto_increment,
	nombre varchar(50) not null,
    cantidad_kg int not null,
    id_tipo int not null,
    foreign key (id_tipo) references tipo_producto(id)
);

create table presentacion_producto (
	id int primary key auto_increment,
	id_producto int not null,
    presentacion varchar(50) not null,
    cantidad_kg int not null,
    precio int not null,
    foreign key (id_producto) references producto(id)
);

create table login (
	id int primary key auto_increment,
	usuario varchar(50) not null,
    contraseña varchar(50) not null,
    rol varchar(20) not null
);

create table cargo (
	id int primary key auto_increment,
	nombre varchar(50) not null,
    dias_trabajo int not null,
    sueldo_mensual bigint not null
);

create table empleado (
	id int primary key auto_increment,
	nombre1 varchar (50) not null,
    nombre2 varchar (50),
    apellido1 varchar (50) not null,
    apellido2 varchar (50),
    cedula bigint not null,
    id_cargo int not null,
    id_login int,
    foreign key (id_cargo) references cargo(id),
    foreign key (id_login) references login(id)
);

create table salarios (
	id int primary key auto_increment,
    id_empleado int not null,
    dias_trabajados int not null,
    pago_final bigint,
    inicio_mes_pagado date not null,
    fin_mes_pagado date not null,
    foreign key (id_empleado) references empleado(id)
);

create table cliente (
	id int primary key auto_increment,
	nombre1 varchar (50) not null,
    nombre2 varchar (50),
    apellido1 varchar (50) not null,
    apellido2 varchar (50),
    cedula bigint not null,
    id_login int,
    foreign key (id_login) references login(id)
);

create table metodo_pago (
	id int primary key auto_increment,
	metodo varchar(20) not null
);

create table venta (
	id int primary key auto_increment,
    fecha_venta date not null,
    id_cliente int not null,
    precio_total int,
    id_metodo_pago int not null,
	foreign key (id_cliente) references cliente(id),
    foreign key (id_metodo_pago) references metodo_pago(id)
);

create table venta_producto (
	id int primary key auto_increment,
	id_venta int not null,
    id_presentacion_producto int not null,
    cantidad int not null,
    foreign key (id_venta) references venta(id),
    foreign key (id_presentacion_producto) references presentacion_producto(id)
);

create table proveedor (
	id int primary key auto_increment,
	nombre1 varchar (50) not null,
    nombre2 varchar (50),
    apellido1 varchar (50) not null,
    apellido2 varchar (50),
    cedula bigint not null,
    direccion varchar(100) not null,
    id_login int,
    foreign key (id_login) references login(id)
);

create table compra (
	id int primary key auto_increment,
	id_proveedor int not null,
    fecha_compra date not null,
    precio_total bigint,
    id_metodo_pago int not null,
    foreign key (id_proveedor) references proveedor(id),
    foreign key (id_metodo_pago) references metodo_pago(id)
);

create table compra_producto (
	id int primary key auto_increment,
	id_compra int not null,
    precio_unitario int not null,
    cantidad int not null,
    producto varchar(50) not null,
    tipo varchar(30) not null,
    foreign key (id_compra) references compra(id)
);

create table terreno (
	id int primary key auto_increment,
	coordenadas varchar(50) not null,
    tamaño int not null,
    hectareas_libres int not null
);

create table cultivo (
	id int primary key auto_increment,
	id_producto int not null,
    id_terreno int not null,
    hectareas_usadas int not null,
    foreign key (id_producto) references producto(id),
    foreign key (id_terreno) references terreno(id)
);

create table cosecha (
	id int primary key auto_increment,
	fecha_inicio date not null,
    fecha_fin date,
    id_cultivo int not null,
    cantidad_total_kg int,
    cantidad_cosechada_kg int,
    cantidad_perdida int,
    foreign key (id_cultivo) references cultivo(id)
);

create table cosecha_empleado (
    id_cosecha int not null,
    id_empleado int not null,
    foreign key (id_cosecha) references cosecha(id),
    foreign key (id_empleado) references empleado(id)
);

create table bodega (
	id int primary key auto_increment,
	nombre varchar(50) not null,
    ubicacion varchar(30) not null
);

create table estados_mh (
	id int primary key auto_increment,
	nombre varchar(50) not null
);

create table tipo_mh (
	id int primary key auto_increment,
	nombre varchar(50) not null
);

create table maquinaria_herramienta (
	id int primary key auto_increment,
	nombre varchar(50) not null,
    id_tipo int not null,
    id_estado int not null,
    id_bodega int not null,
	foreign key (id_tipo) references tipo_mh(id),
    foreign key (id_estado) references estados_mh(id),
    foreign key (id_bodega) references bodega(id)
);

create table tipo_insumo (
	id int primary key auto_increment,
	nombre varchar(50) not null
);

create table insumos(
	id int primary key auto_increment,
	nombre varchar(50) not null,
    id_tipo_insumo int not null,
    cantidad int not null,
    id_bodega int not null,
	foreign key (id_tipo_insumo) references tipo_insumo(id),
    foreign key (id_bodega) references bodega(id)
);

create table ingresos_gastos_mensuales (
	id int primary key auto_increment,
	inicio_mes date not null,
    fin_mes date not null,
    ingresos bigint not null,
    gastos bigint not null,
    ganancia_final bigint not null
);
```

## Ejemplos de funciones
```sql
-- Funcion para saber el precio_total de una venta
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

-- Funcion para calcular el precio total de una compra
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

-- Funcion para mostrar el producto mas caro de una compra
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


	
-- Funcion para concatenar nombres completos
drop function if exists nombre_completo;
delimiter //
create function nombre_completo (id_persona int, tipo varchar(20))
returns varchar(50) deterministic
begin
	declare nombre varchar(50);
    if tipo = 'empleado' then
		set nombre = (select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2) from empleado where id = id_persona);
	elseif tipo = 'proveedor' then
		set nombre = (select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2) from proveedor where id = id_persona);
	elseif tipo = 'cliente' then
		set nombre = (select concat_ws('',nombre1,' ',nombre2,' ',apellido1,' ',apellido2) from cliente where id = id_persona);
	else set nombre = 'la tabla que ingresaste no existe';
    end if;
	return nombre;
end
// delimiter ;
```
## Ejemplo de procedimientos

```sql
-- Asignar productos a una venta
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


-- Asignar el pago final al salario de un empleado
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

-- Insertar un cultivo 

drop procedure if exists insertar_cultivo;
delimiter //
create procedure insertar_cultivo (id_productoF int,id_terrenoF int,hectareas_usadasF int)
begin
	insert into cultivo(id_producto,id_terreno,hectareas_usadas) 
    values (id_productoF,id_terrenoF,hectareas_usadasF);
end
// delimiter ;

call insertar_cultivo(3,7,3);
-- Registrar un nuevo cliente

drop procedure if exists registrar_cliente;
delimiter //
create procedure registrar_cliente (nombre1F varchar(50),nombre2F varchar(50),apellido1F varchar(50),apellido2F varchar(50),cedulaF bigint)
begin
	insert into cliente(nombre1,nombre2,apellido1,apellido2,cedula) 
    values (nombre1F,nombre2F,apellido1F,apellido2F,cedulaF);
end
// delimiter ;

call registrar_cliente('Luis','Orlando','Henao','Bermon',1096852353);

```

## Ejemplos de triggers

```sql
-- aumentar cantidad de stock de un producto cuando se inserte una nueva cosecha
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


-- actualizar precio total de una compra
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


-- actualizar la cantidad de hectareas libre de los terrenos 
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

-- Evitar que se inserten compras con precios negativos en la tabla compra_producto.
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

```
## Ejemplos de eventos

```sql
-- Evento para registro de ingresos y gastos en un mes cada mes

drop event if exists event_ingresos_gastos_mensuales;

create event event_ingresos_gastos_mensuales
on schedule every 1 month
do insert into ingresos_gastos_mensuales(inicio_mes,fin_mes,ingresos,gastos,ganancia_final) 
values (DATE_FORMAT(CURDATE(), '%Y-%m-01'),
LAST_DAY(CURDATE()),
ventas_fechas(DATE_FORMAT(CURDATE(), '%Y-%m-01'),LAST_DAY(CURDATE())),
gastos_mensuales(DATE_FORMAT(CURDATE(), '%Y-%m-01'),LAST_DAY(CURDATE())),
(ventas_fechas(DATE_FORMAT(CURDATE(), '%Y-%m-01'),LAST_DAY(CURDATE()))+gastos_mensuales(DATE_FORMAT(CURDATE(), '%Y-%m-01'),LAST_DAY(CURDATE()))));


-- Evento para ingresar  los precios totales a la tabla venta todos los dias

drop event if exists ingresar_precios_total_venta;

create event ingresar_precios_total_venta
on schedule every 1 day
do call bucle_precio_total_venta();
show events;


-- Evnto para asignar los pagos finales de la tabla salarios todos los dias

drop event if exists asignar_precio_salarios;

create event asignar_precio_salarios
on schedule every 1 day
do call asignar_salarios();
show events;drop event if exists asignar_precio_salarios;
```

## Ejemplos de consultas

```sql
-- ver verduras y su cantidad en stock
select p.nombre , p.cantidad_kg from producto p inner join tipo_producto t on p.id_tipo = t.id where t.nombre = 'Verdura';

-- ver cuantas hectareas de terreno hay en total
select sum(tamaño) from terreno;

-- ver cantidad de hectareas libres
select sum(hectareas_libres) as total_hectareas_libres from terreno;

-- ver cantidad de hectareas acupadas
select sum(tamaño - hectareas_libres) as total_hectareas_libres from terreno;

-- ver ventas junto con los productos vendidos
select v.* , p.nombre , pp.presentacion , vp.cantidad from venta v 
inner join venta_producto vp on v.id = vp.id_venta 
inner join presentacion_producto pp on vp.id_presentacion_producto = pp.id 
inner join producto p on pp.id_producto = p.id order by v.id;

-- ver el empleado que ha tenido un mayor salario
select s.id , nombre_completo(e.id,'empleado') , s.pago_final from salarios s inner join empleado e on s.id_empleado = e.id order by s.pago_final desc limit 1;

-- ver compras junto con los productos 
select * from compra c inner join compra_producto cp on c.id = cp.id_compra;

-- ver compra y su metodo de pago
select c.* , m.metodo from compra c inner join metodo_pago m on c.id_metodo_pago = m.id;

-- 21 ver insumos y su tipo
select i.* , t.nombre as tipo_insumo from insumos i inner join tipo_insumo t on i.id_tipo_insumo = t.id;

-- 22 venta con el nombre de el proveedor
select c.* , nombre_completo(p.id,'proveedor') as nombre_completo from compra c inner join proveedor p on c.id_proveedor = p.id; 

-- 23 cantidad de empleados por cosecha
select c.* , count(*) from cosecha c inner join cosecha_empleado ce on c.id = ce.id_cosecha group by 1; 
```
## Usuarios

```sql
create user 'Admin'@'localhost'
identified with mysql_native_password by 'password_admin';

grant all privileges on *.* to 'Admin'@'localhost';

create user 'dueño_finca'@'localhost'
identified with mysql_native_password by 'password_dueño';

grant all privileges on finca_agricola_ll.* to 'dueño_finca'@'localhost';

create user 'cliente'@'localhost'
identified with mysql_native_password by 'password_cliente';

grant select on finca_agricola_ll.producto to 'cliente'@'localhost';
grant select on finca_agricola_ll.presentacion_producto to 'cliente'@'localhost';
grant select on finca_agricola_ll.tipo_producto to 'cliente'@'localhost';
grant select on finca_agricola_ll.cliente to 'cliente'@'localhost';

create user 'proveedor'@'localhost'
identified with mysql_native_password by 'password_proveedor';

grant select on finca_agricola_ll.compra to 'proveedor'@'localhost';
grant select on finca_agricola_ll.compra_producto to 'proveedor'@'localhost';
grant select on finca_agricola_ll.metodo_pago to 'proveedor'@'localhost';
grant select on finca_agricola_ll.proveedor to 'proveedor'@'localhost';

create user 'empleado'@'localhost'
identified with mysql_native_password by 'password_empleado';

grant select on finca_agricola_ll.salarios to 'empleado'@'localhost';
grant select on finca_agricola_ll.cargo to 'empleado'@'localhost';
grant select on finca_agricola_ll.cosecha_empleado to 'empleado'@'localhost';
grant select on finca_agricola_ll.empleado to 'empleado'@'localhost';
```

## Desarrollado por 
[Luis Orlando Henao](https://github.com/Luis-Orlando-Henao-Bermon) , [Luis Miguel Caicedo](https://github.com/Luis-Miguel-Caicedo-Bermon)
