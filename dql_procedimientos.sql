-- 1 asignar precio total
drop procedure if exists asignar_precio_total;
delimiter //
create procedure asignar_precio_total (id_venta int , precio_total_i int)
begin
	update venta set precio_total = precio_total_i where id = id_venta;
end
// delimiter ;

-- 2 hacer un bucle para asignar precio total en ventas
drop procedure if exists bucle;
delimiter //
create procedure bucle ()
begin
	declare contador int;
    set contador = 1;
	while contador <= (select count(*) from venta) do
		call asignar_precio_total (contador , precio_total_venta(contador));
        set contador = contador + 1;
	end while;
end
// delimiter ;

call bucle();
