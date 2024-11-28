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


