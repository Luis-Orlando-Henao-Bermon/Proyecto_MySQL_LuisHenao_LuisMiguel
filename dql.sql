use finca_agricola_LL;

-- 1 ver todas las ventas realizadas
select * from venta;

-- 2 ver todos los clientes
select * from cliente;

-- 3 ver compras realizadas
select * from compra;

-- 4 ver la cosecha con mayor cantidad producida
select * from cosecha order by cantidad_total_kg desc limit 1;

-- 5 venta mas reciente 
select * from venta order by fecha_venta desc;

-- 6 venta mas antigua
select * from venta order by fecha_venta asc;

-- 7 ordenar los terrenos por tamaño
select * from terreno order by tamaño desc;

-- 8 ordenar terrenos por hectareas libres
select * from terreno order by hectareas_libres desc;

-- 9 numero de empleados por cargo
select c.nombre , count(*) as cantidad_empleados from empleado e inner join cargo c on e.id_cargo = c.id group by 1;

-- 10 ver maquinaria/Herramienta libre
select * from maquinaria_herramienta mh inner join estados_mh e on mh.id_estado = e.id where e.nombre = 'Libre';

-- 11 ver maquinaria/Herramienta libre y que esté en una bodega especifica
select * from maquinaria_herramienta mh inner join estados_mh e on mh.id_estado = e.id where e.nombre = 'Libre' and id_bodega = 2;

-- 12 ver frutas y su cantidad en stock
select p.nombre , p.cantidad_kg from producto p inner join tipo_producto t on p.id_tipo = t.id where t.nombre = 'Fruta';

-- 13 ver verduras y su cantidad en stock
select p.nombre , p.cantidad_kg from producto p inner join tipo_producto t on p.id_tipo = t.id where t.nombre = 'Verdura';

-- 14 ver cuantas hectareas de terreno hay en total
select sum(tamaño) from terreno;

-- 15 ver cantidad de hectareas libres
select sum(hectareas_libres) as total_hectareas_libres from terreno;

-- 16 ver cantidad de hectareas acupadas
select sum(tamaño - hectareas_libres) as total_hectareas_libres from terreno;

-- 17 ver ventas junto con los productos vendidos
select v.* , p.nombre , pp.presentacion , vp.cantidad from venta v 
inner join venta_producto vp on v.id = vp.id_venta 
inner join presentacion_producto pp on vp.id_presentacion_producto = pp.id 
inner join producto p on pp.id_producto = p.id order by v.id;

-- 18 ver el empleado que ha tenido un mayor salario
select s.id , nombre_completo(e.id,'empleado') , s.pago_final from salarios s inner join empleado e on s.id_empleado = e.id order by s.pago_final desc limit 1;

-- 19 ver compras junto con los productos 
select * from compra c inner join compra_producto cp on c.id = cp.id_compra;

-- 20 ver compra y su metodo de pago
select c.* , m.metodo from compra c inner join metodo_pago m on c.id_metodo_pago = m.id;

-- 21 ver insumos y su tipo
select i.* , t.nombre as tipo_insumo from insumos i inner join tipo_insumo t on i.id_tipo_insumo = t.id;

-- 22 venta con el nombre de el proveedor
select c.* , nombre_completo(p.id,'proveedor') as nombre_completo from compra c inner join proveedor p on c.id_proveedor = p.id; 

-- 23 cantidad de empleados por cosecha
select c.* , count(*) from cosecha c inner join cosecha_empleado ce on c.id = ce.id_cosecha group by 1; 
select * from cultivo_empleado;