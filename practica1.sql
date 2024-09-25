-- SELECT * FROM empresas

-- SELECT apellido, nombre, fecha_registro_agencia FROM personas


/*SELECT * FROM titulos
ORDER BY desc_titulo*/


/*SELECT nombre, apellido, fecha_nacimiento, telefono, direccion FROM personas
WHERE dni = 28675888*/


/*SELECT nombre, apellido, fecha_nacimiento, telefono, direccion FROM personas
WHERE dni IN (27890765, 29345777, 31345778)
ORDER BY fecha_nacimiento*/

/*SELECT * FROM personas
WHERE apellido LIKE 'G%'*/


/*SELECT nombre, apellido, fecha_nacimiento FROM personas
WHERE YEAR(fecha_nacimiento) BETWEEN 1980 AND 2000*/


/*SELECT * FROM solicitudes_empresas
ORDER BY fecha_solicitud*/

/*SELECT * FROM antecedentes
WHERE fecha_hasta IS NULL
ORDER BY fecha_desde*/

/*SELECT * FROM antecedentes
WHERE fecha_hasta IS NOT NULL
AND fecha_hasta NOT  
BETWEEN '2013-06-01' AND '2013-12-31'
ORDER BY dni*/



/*SELECT * FROM contratos
WHERE sueldo > 2000
AND cuit IN ('30-10504876-5', '30-21098732-4');*/

/*SELECT * FROM titulos
WHERE desc_titulo LIKE 'Tecnico%'*/



/*SELECT * FROM solicitudes_empresas
WHERE fecha_solicitud > '2013-09-21'
AND (cod_cargo = 6) OR (sexo = 'femenino')*/


/*SELECT * FROM contratos
WHERE sueldo > 2000 
AND fecha_caducidad IS NULL*/




