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

create table preveedor (
	id int primary key auto_increment,
	nombre1 varchar (50) not null,
    nombre2 varchar (50),
    apellido1 varchar (50) not null,
    apellido2 varchar (50),
    cedula bigint not null,
    direccion varchar(30) not null,
    id_login int,
    foreign key (id_login) references login(id)
);

create table compra (
	id int primary key auto_increment,
	id_proveedor int not null,
    fecha_compra date not null,
    precio_total bigint,
    id_metodo_pago int not null,
    foreign key (id_proveedor) references preveedor(id),
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
    fecha_fin date not null,
    id_cultivo int not null,
    cantidad_total_kg int not null,
    cantidad_cosechada_kg int not null,
    cantidad_perdida int not null,
    foreign key (id_cultivo) references cultivo(id)
);

create table cultivo_empleado (
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