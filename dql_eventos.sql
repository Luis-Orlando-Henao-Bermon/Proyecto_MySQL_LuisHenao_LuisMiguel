SET GLOBAL event_sheduler = ON;

use finca_agricola_LL;

drop event if exists event_ingresos_gastos_mensuales;

create event event_ingresos_gastos_mensuales
on schedule every 1 month
do insert into ingresos_gastos_mensuales(inicio_mes,fin_mes,ingresos,gastos,ganancia_final) 
values (DATE_FORMAT(CURDATE(), '%Y-%m-01'),
LAST_DAY(CURDATE()),
ventas_fechas(DATE_FORMAT(CURDATE(), '%Y-%m-01'),LAST_DAY(CURDATE())),
gastos_mensuales(DATE_FORMAT(CURDATE(), '%Y-%m-01'),LAST_DAY(CURDATE())),
(ventas_fechas(DATE_FORMAT(CURDATE(), '%Y-%m-01'),LAST_DAY(CURDATE()))+gastos_mensuales(DATE_FORMAT(CURDATE(), '%Y-%m-01'),LAST_DAY(CURDATE()))));

show events;
