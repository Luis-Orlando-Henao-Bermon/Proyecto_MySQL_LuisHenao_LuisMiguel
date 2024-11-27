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

