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

-- 24 compra mas costosa
select * from compra order by precio_total desc limit 1;

-- 25 compra menos costosa 
select * from compra order by precio_total asc limit 1;

-- 26 total de dinero gastado por cliente 
select c.* , sum(v.precio_total) from venta v inner join cliente c on v.id_cliente = c.id group by 1;

-- 27 empleado que mas salarios ha recibido
select nombre_completo(e.id,'empleado') , count(*) as cantidad_pagos_recibidos from salarios s inner join empleado e on s.id_empleado = e.id group by e.id;

-- 28 cantidad compras por proveedor
select nombre_completo(p.id,'proveedor') , count(*) as cantidad_compras from compra c inner join proveedor p on c.id_proveedor = p.id group by p.id;

-- 29 producto mas cosechado
select p.nombre , sum(c.cantidad_cosechada_kg) cantidad_total_cosechada_kg from cosecha c 
inner join cultivo cul on c.id_cultivo = cul.id 
inner join producto p on cul.id_producto = p.id 
group by p.id order by 2 desc limit 1;

-- 30 dias que faltó un empleado 
select s.inicio_mes_pagado , s.fin_mes_pagado , nombre_completo(e.id,'empleado') as nombre_completo , (c.dias_trabajo - s.dias_trabajados) as dis_que_faltó from empleado e inner join salarios s on e.id = s.id_empleado inner join cargo c on e.id_cargo = c.id;

-- 31 buscar cliente por cedula
select * from cliente where cedula = 1012012012;

-- 32 cargo con mayor numero de empleado
select c.nombre , count(*) as numero_empleados from cargo c inner join empleado e on c.id = e.id_cargo group by 1 order by 2 desc limit 1;

-- 33 mostrar cultivos
select * from cultivo;

-- 34 ver ingresos y gastos mensuales
select * from ingresos_gastos_mensuales;

-- 35 listar insumos en la bodega con el id 1
select b.nombre as bodega , i.* from bodega b inner join insumos i on b.id = i.id_bodega where b.id = 1;

-- 36. mostrar los clientes con los productos y cantidades que han comprado

select nombre_completo(c.id,'cliente'),p.nombre,sum(vp.cantidad) from cliente c inner join venta v on c.id=v.id_cliente 
inner join venta_producto vp on v.id=vp.id_venta
inner join presentacion_producto pp on vp.id_presentacion_producto=pp.id
inner join producto p on pp.id_producto=p.id group by 1,2 order by 1;

-- 37. listar los ingresos por metodo de pago 

select mp.metodo, sum(v.precio_total) as ingresos from metodo_pago mp inner join venta v on mp.id=v.id_metodo_pago group by 1;

-- 38. Listar las herramientas/maquinas que esten dañadas 

select * from maquinaria_herramienta where id_estado=3;

-- 39. Listar el producto que a generado la mayor cantidad de ingresos 

select p.nombre,sum(v.precio_total) ingresos_generados from  venta v inner join venta_producto vp on v.id=vp.id_venta
inner join presentacion_producto pp on vp.id_presentacion_producto=pp.id
inner join producto p on pp.id_producto=p.id group by 1 order by 2 desc limit 1;

-- 40. mostrar los proveedores junto con los productos que se le han comprado

select distinct nombre_completo(p.id,'proveedor'),cp.producto from proveedor p inner join compra c on p.id=c.id_proveedor
inner join compra_producto cp on c.id=cp.id_compra;

-- 41 listar las herramientas/maquinarias que hay en la bodega con id 5 y el nombre de la bodega

select b.nombre,mh.nombre from maquinaria_herramienta mh inner join bodega b on mh.id_bodega=b.id where b.id=5;

-- 42. listar los proveedores

select * from proveedor;

-- 43. listar los cargos de los empleados

select * from cargo;

-- 44. mostrar el cliente que realizo la ultima venta 

select nombre_completo(c.id,'cliente') as nombre_cliente,v.fecha_venta from venta v inner join cliente c on v.id_cliente=c.id order by fecha_venta desc limit 1;

-- 45. listar las cosechas junto con los empleados que participaron en ella

select c.id,nombre_completo(e.id,'empleado') from cosecha c inner join cosecha_empleado ce on c.id=ce.id_cosecha inner join empleado e on ce.id_empleado= e.id ; 

-- 46. listar los proveedores con sus usuarios

select p.*, l.usuario from proveedor p inner join login l on p.id_login=l.id; 

-- 47. listar los empleados con sus usuarios

select e.*, l.usuario from empleado e inner join login l on e.id_login=l.id; 

-- 48. listar los clientes con sus usuarios

select c.*, l.usuario from cliente c inner join login l on c.id_login=l.id; 

-- 49. listar las ventas con su metodo de pago

select v.* , mp.metodo from venta v inner join metodo_pago mp on v.id_metodo_pago=mp.id;

-- 50. listar los cultivos con las corrdenadas de su terreno

select c.*,t.coordenadas as corrden from cultivo c inner join terreno t on c.id_terreno=t.id;

-- 51. mostrar los empleados con su cargo y sueldo 

select nombre_completo(e.id,'empleado'), c.nombre,c.sueldo_mensual from empleado e inner join cargo c on e.id_cargo=c.id;

-- 52. listar las maquinarias/herramientas con el nombre de la bodega donde estan 

select mh.id as id_mh, mh.nombre, b.nombre from maquinaria_herramienta mh inner join bodega b on mh.id_bodega=b.id;

-- 53. Listar las diferentes herramientas/maquinaria con su tipo

select distinct mh.nombre,tmh.nombre from maquinaria_herramienta mh inner join tipo_mh tmh on mh.id_tipo=tmh.id;

-- 54. listar productos con su tipo

select p.nombre,tp.nombre from  producto p inner join tipo_producto tp on p.id_tipo=tp.id;

-- 55. Listar el nombre del producto con mayor stock
select * from producto order by 3 desc limit 1;

-- 56. listar los dias trabajados de un empleado y el mes en el que trabajo esos dias

 select nombre_completo(e.id,'empleado'),s.dias_trabajados,s.inicio_mes_pagado,s.fin_mes_pagado from empleado e inner join salarios s on e.id=s.id_empleado;

-- 57. listar los salarios de los empleados con sus salario, nombre empleado y fecha de salario

select nombre_completo(e.id,'empleado'),s.pago_final,s.inicio_mes_pagado,s.fin_mes_pagado from empleado e inner join salarios s on e.id=s.id_empleado;

-- 58 ver maquinaria/Herramienta con su estado
select mh.id, mh.nombre,e.nombre from maquinaria_herramienta mh inner join estados_mh e on mh.id_estado = e.id;

-- 59. Lista el producto mas vendido

select p.nombre, count(vp.id_presentacion_producto) as cantidad_venta from venta_producto vp 
inner join presentacion_producto pp on vp.id_presentacion_producto=pp.id 
inner join producto p on pp.id_producto=p.id 
group by 1 order by 2 desc limit 1;

-- 60 mostrar el total de ventas de una presentacion de un producto
select p.nombre,pp.presentacion, count(vp.id_presentacion_producto) as cantidad_venta from venta_producto vp 
inner join presentacion_producto pp on vp.id_presentacion_producto=pp.id 
inner join producto p on pp.id_producto=p.id 
group by 1,2;


-- 61. listar los proveedores a los que no se le han realizado compras

select nombre_completo(p.id,'proveedor') from proveedor p where p.id not in (select id_proveedor from compra);

-- 62. listar las ventas realizadas en la fecha 2024-11-08

select * from venta where fecha_venta='2024-11-08';

-- 63. listar los productos y cantidades vendidos en la siguiente fecha 2024-11-22

select p.nombre,v.fecha_venta,sum(pp.cantidad_kg*vp.cantidad) as cantidad from  venta v inner join venta_producto vp on v.id=vp.id_venta
inner join presentacion_producto pp on vp.id_presentacion_producto=pp.id
inner join producto p on pp.id_producto=p.id where v.fecha_venta='2024-11-17' 
group by 1,2;

--  64. listar cosechas realizadas en el mes de julio sin importar el añoptimize

select * from cosecha where month(fecha_inicio)=7 or month(fecha_fin)=7; 

-- 65. Que cultivos se encuentran en el terreno con id 3

select * from cultivo where id_terreno=3;

-- 66. cantidad total de perdidas de un producto

select p.nombre, sum(c.cantidad_perdida) from producto p inner join cultivo cu on p.id=cu.id_producto
inner join cosecha c on cu.id=c.id_cultivo group by 1;

-- 67. Listar empleados que no hayan participado en ninguna cosecha

select nombre_completo(e.id,'empleado') from empleado e where e.id not in (select id_empleado from cosecha_empleado);

-- 68. mostar el metodo de pago que ha generado mas ingresos

select mp.metodo, sum(v.precio_total) as ingresos from metodo_pago mp inner join venta v on mp.id=v.id_metodo_pago group by 1 order by 2 desc limit 1;

-- 69. mostar el metodo de pago que ha generado menos ingresos

select mp.metodo, sum(v.precio_total) as ingresos from metodo_pago mp inner join venta v on mp.id=v.id_metodo_pago group by 1 order by 2  limit 1;

-- 70. mostrar el producto con mayor cosecha total

select p.nombre, sum(c.cantidad_total_kg) from producto p inner join cultivo cu on p.id=cu.id_producto
inner join cosecha c on cu.id=c.id_cultivo group by 1 order by 2 desc limit 1;

-- 71. mostrar el producto con menor cosecha total

select p.nombre, sum(c.cantidad_total_kg) from producto p inner join cultivo cu on p.id=cu.id_producto
inner join cosecha c on cu.id=c.id_cultivo group by 1 order by 2  limit 1;

-- 72. mostrar el producto con menor cantidad de kilos vendidas

select p.nombre,sum(pp.cantidad_kg*vp.cantidad) as cantidad from  venta v inner join venta_producto vp on v.id=vp.id_venta
inner join presentacion_producto pp on vp.id_presentacion_producto=pp.id
inner join producto p on pp.id_producto=p.id group by 1 order by 2 limit 1 ;

-- 73. mostrar el proveedor  que a generado la mayor cantidad de ingresos para el 

select nombre_completo(p.id,'proveedor'), sum(c.precio_total) from proveedor p inner join compra c on p.id=c.id_proveedor group by 1 order by 2 desc limit 1;

-- 74. listar los proveedores que hayan generado para ellos mas de 400000 en ingresos

select nombre_completo(p.id,'proveedor'), sum(c.precio_total) from proveedor p inner join compra c on p.id=c.id_proveedor 
group by 1 
having sum(c.precio_total)<400000;

-- 75. mostrar el proveedor  que a generado la menor cantidad de ingresos para el 

select nombre_completo(p.id,'proveedor'), sum(c.precio_total) from proveedor p inner join compra c on p.id=c.id_proveedor group by 1 order by 2  limit 1;

-- 76. listar los productos  con mas de 5 productos en stock

select * from producto where cantidad_kg>5;

-- 77. listar los terrenos con sus cultivos

select t.id,c.id, p.nombre from terreno t inner join cultivo c on t.id=c.id_terreno inner join producto p on p.id= c.id_producto;

-- 78. listar los terrenos con mas de 2 cultivos

select t.id as id_terreno,count(c.id_terreno) as 'cantidad_cultivos' from terreno t inner join cultivo c on t.id=c.id_terreno 
group by 1 having cantidad_cultivos>2;

-- 79. listar empleados con mas de 1 salario pagado

select nombre_completo(e.id,'empleado') as nombre_empleado,count(s.id_empleado) as 'cantidad_salarios_pagos' from empleado e inner join salarios s on e.id=s.id_empleado 
group by 1 having cantidad_salarios_pagos>1 ;

-- 80. listar el tipo de maquinaria/herramienta con mayor cantidad de maquinaria/herramienta  en estado dañado

select tmh.nombre,count(mh.id_tipo) as cantidad_dañada from tipo_mh tmh 
inner join maquinaria_herramienta mh on tmh.id= mh.id_tipo 
where mh.id_estado=3 group by 1 order by 2 desc limit 1;

-- 81. mostrar la cosecha que a demorado mas tiempo en completarse que los demas

select id, timestampdiff(day,fecha_inicio,fecha_fin) from cosecha order by 2 desc limit 1;

-- 82. mostrar la cosecha que a demorado menos tiempo en completarse que los demas

select id, timestampdiff(day,fecha_inicio,fecha_fin) from cosecha order by 2 limit 1;

-- 83. mostrar las cosechas que se hayan demorado mas de 6 dias en completarse

select id, timestampdiff(day,fecha_inicio,fecha_fin) as 'dias_cosecha' from cosecha having dias_cosecha>6;

-- 84. listar todos los salarios registrados 

select * from salarios;

-- 85. mostrar cuantos insumos hay con el nombre de Abono Orgánico

select sum(cantidad) from insumos where nombre='Abono Orgánico';

-- 86. calcular el total de gastos en salarios de empleados

select sum(pago_final) from salarios;

-- 87. calcular el total de ingresos en ventas

select sum(precio_total) from venta;

-- 88. calcular el total de gastos en compras

select sum(precio_total) from compra;

-- 89. listar los terrenos que hay 

select * from terreno;

-- 90. listar las presentaciones de productos que hayan generado mas de 7 ventas

select pp.id, count(v.id) as 'cantidad_ventas' from presentacion_producto pp 
inner join venta_producto vp on pp.id=vp.id_presentacion_producto 
inner join venta v on vp.id_venta= v.id group by 1 having cantidad_ventas>7;

-- 91. ver ventas con mas de 2 productos vendidos
select v.* ,count(vp.id_presentacion_producto) as 'cantidad_productos' from venta v 
inner join venta_producto vp on v.id = vp.id_venta 
inner join presentacion_producto pp on vp.id_presentacion_producto = pp.id 
inner join producto p on pp.id_producto = p.id group by 1 having cantidad_productos >2 order by v.id;

-- 92. listar los cultivos con mas de 1 cosecha

select cu.id, count(c.id_cultivo) as 'cantidad_cosecha' from cultivo cu inner join cosecha c on cu.id=c.id_cultivo group by 1  having cantidad_cosecha>1;

-- 93. listar los salarios en los cuales el empleado haya faltado mas de 2 dias al trabajo

select s.id,c.dias_trabajo-s.dias_trabajados as 'dias_faltas' from salarios s 
inner join  empleado e on s.id_empleado=e.id 
inner join cargo c on e.id_cargo=c.id where c.dias_trabajo-s.dias_trabajados>2;

-- 94. listar los cargos que ganen mas de 1200000

select * from cargo where sueldo_mensual>1200000;

-- 95. listar los roles con la cantidad de usuarios que tiene ese ron

select rol, count(*) as cantidad_usuarios from login group by 1;

-- 96. listar el rol con la mayor cantidad de usuarios

select rol, count(*) as cantidad_usuarios from login group by 1 order by 2 desc limit 1;

-- 97. listar el rol con la menor cantidad de usuarios

select rol, count(*) as cantidad_usuarios from login group by 1 order by 2  limit 1;

 -- 98. listare el ingreso mensual con la mayor cantidad de ganancias
 
 select max(ganancia_final) from ingresos_gastos_mensuales;
 
-- 99. listare el ingreso mensual con la menor cantidad de ganancias
 
 select max(ganancia_final) from ingresos_gastos_mensuales;
 
 -- 100. listar clientes con los metodos de pago que ha realizado
 
 select distinct nombre_completo(c.id,'cliente') as nombre_cliente,mp.metodo  from cliente c 
 inner join venta v on c.id=v.id_cliente 
 inner join metodo_pago mp on v.id_metodo_pago=mp.id;