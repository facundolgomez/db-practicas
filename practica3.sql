/*SELECT nro_contrato, DATE_FORMAT(fecha_incorporacion, "%d/%m/%Y") AS fecha_incorporacion, DATE_FORMAT(fecha_finalizacion_contrato, "%d/%m/%Y") AS  fecha_finalizacion_contrato, DATE_FORMAT(ADDDATE(fecha_solicitud, INTERVAL 30 DAY), "%d/%m/%Y")  AS fecha_caducidad
FROM contratos 
WHERE fecha_caducidad IS  NULL*/


/*SELECT nro_contrato, nombre, apellido, razon_social, DATE_FORMAT(fecha_incorporacion, "%d/%m/%Y") AS fecha_incorporacion,  IFNULL(DATE_FORMAT(fecha_caducidad, "%d/%m/%Y"),  "Contrato vigente") AS Fecha_caducidad 
FROM contratos c
INNER JOIN personas p ON c.dni = p.dni
INNER JOIN empresas e ON c.cuit = e.cuit*/



/*SELECT *, DATEDIFF(fecha_finalizacion_contrato, fecha_caducidad) AS dias_antes
FROM contratos
WHERE fecha_caducidad < fecha_finalizacion_contrato;*/


/*SELECT e.cuit, e.razon_social, e.direccion, co.anio_contrato, co.mes_contrato, co.importe_comision, DATE_FORMAT(ADDDATE(CURRENT_DATE(), INTERVAL 2 MONTH), "%d/%m/%Y") AS fecha_vencimiento
FROM empresas e
INNER JOIN contratos c ON e.cuit = c.cuit
INNER JOIN comisiones co ON c.nro_contrato = co.nro_contrato
WHERE co.fecha_pago IS NULL*/


/*SELECT CONCAT(nombre, " ", apellido) AS "Nombre y Apellido", DAY(fecha_nacimiento) AS Dia, MONTH(fecha_nacimiento) AS Mes, YEAR(fecha_nacimiento) AS Anio
FROM personas*/


