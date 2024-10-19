/*SELECT e.razon_social, SUM(co.importe_comision)
FROM empresas e
INNER JOIN contratos c ON e.cuit = c.cuit
INNER JOIN comisiones co ON c.nro_contrato = co.nro_contrato
WHERE e.razon_social = 'Traigame eso' AND co.fecha_pago IS NOT NULL
GROUP BY e.razon_social;*/

/*SELECT e.razon_social, SUM(co.importe_comision)
FROM empresas e
INNER JOIN contratos c ON e.cuit = c.cuit
INNER JOIN comisiones co ON c.nro_contrato = co.nro_contrato
WHERE co.fecha_pago IS NOT NULL
GROUP BY e.razon_social;*/

/*SELECT e.nombre_entrevistador, en_ev.cod_evaluacion, AVG(en_ev.resultado), STD(en_ev.resultado), VARIANCE(en_ev.resultado)
FROM entrevistas e
INNER JOIN entrevistas_evaluaciones en_ev ON e.nro_entrevista = en_ev.nro_entrevista
GROUP BY en_ev.cod_evaluacion, e.nombre_entrevistador
ORDER BY AVG(en_ev.resultado) ASC, STD(en_ev.resultado) DESC;*/

/*SELECT e.nombre_entrevistador, en_ev.cod_evaluacion, AVG(en_ev.resultado), STD(en_ev.resultado), VARIANCE(en_ev.resultado)
FROM entrevistas e
INNER JOIN entrevistas_evaluaciones en_ev ON e.nro_entrevista = en_ev.nro_entrevista
GROUP BY en_ev.cod_evaluacion, e.nombre_entrevistador
HAVING e.nombre_entrevistador = 'Angelica Doria' AND AVG(en_ev.resultado) > 71
ORDER BY en_ev.cod_evaluacion;*/

/*SELECT nombre_entrevistador, COUNT(nombre_entrevistador) AS "Cantidad de Entrevistas"
FROM entrevistas e
WHERE YEAR(e.fecha_entrevista) = 2014 AND MONTH(e.fecha_entrevista) = 10
GROUP BY nombre_entrevistador;*/


/*SELECT  e.nombre_entrevistador, en_ev.cod_evaluacion, AVG(en_ev.resultado), STD(en_ev.resultado), COUNT(e.nombre_entrevistador)
FROM entrevistas e
INNER JOIN entrevistas_evaluaciones en_ev ON e.nro_entrevista = en_ev.nro_entrevista
GROUP BY en_ev.cod_evaluacion, e.nombre_entrevistador
HAVING AVG(en_ev.resultado) > 71
ORDER BY COUNT(e.nombre_entrevistador);*/


/*SELECT  e.nombre_entrevistador, en_ev.cod_evaluacion, AVG(en_ev.resultado), STD(en_ev.resultado), COUNT(en_ev.cod_evaluacion)
FROM entrevistas e
INNER JOIN entrevistas_evaluaciones en_ev ON e.nro_entrevista = en_ev.nro_entrevista
GROUP BY en_ev.cod_evaluacion, e.nombre_entrevistador
HAVING COUNT(en_ev.cod_evaluacion) > 1
ORDER BY e.nombre_entrevistador DESC, en_ev.cod_evaluacion ASC;*/


/*SELECT nro_contrato, COUNT(importe_comision) AS Total, COUNT(fecha_pago) AS pagadas, (COUNT(importe_comision) - COUNT(fecha_pago)) AS "a pagar"
FROM comisiones
GROUP BY nro_contrato*/


/*SELECT 
    con.nro_contrato, 
    COUNT(com.importe_comision) AS total_comisiones,
    SUM(CASE WHEN com.fecha_pago IS NOT NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(com.importe_comision) AS porcentaje_pagas,
    SUM(CASE WHEN com.fecha_pago IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(com.importe_comision) AS porcentaje_impagas
FROM contratos con
INNER JOIN comisiones com ON con.nro_contrato = com.nro_contrato
GROUP BY con.nro_contrato;*/


/*SELECT COUNT(DISTINCT e.razon_social) AS Cantidad, (COUNT(se.cuit) - COUNT(DISTINCT e.razon_social)) AS Diferencia
FROM empresas e
INNER JOIN solicitudes_empresas se ON e.cuit = se.cuit*/

/*SELECT e.cuit, e.razon_social, COUNT(se.cuit)
FROM empresas e
INNER JOIN solicitudes_empresas se ON e.cuit = se.cuit
GROUP BY e.cuit, e.razon_social*/

/*SELECT e.cuit, e.razon_social, c.cod_cargo, COUNT(se.cuit) AS cantidad_solicitudes
FROM empresas e
INNER JOIN solicitudes_empresas se ON e.cuit = se.cuit
INNER JOIN contratos con ON se.cuit = con.cuit AND se.fecha_solicitud = con.fecha_solicitud
INNER JOIN cargos c ON con.cod_cargo = c.cod_cargo
GROUP BY e.cuit, e.razon_social, c.cod_cargo*/


/*SELECT e.cuit, e.razon_social, IFNULL(COUNT(DISTINCT a.dni), 0) AS cantidad_personas
FROM empresas e
LEFT JOIN antecedentes a ON e.cuit = a.cuit
LEFT JOIN personas p ON a.dni = p.dni
GROUP BY e.cuit, e.razon_social*/

/*SELECT c.cod_cargo, c.desc_cargo, IFNULL(COUNT(se.fecha_solicitud), 0) AS cantidad_solicitudes
FROM cargos c 
LEFT JOIN solicitudes_empresas se ON c.cod_cargo = se.cod_cargo
GROUP BY c.cod_cargo, c.desc_cargo
ORDER BY cantidad_solicitudes DESC*/


/*SELECT c.cod_cargo, c.desc_cargo, COUNT(se.fecha_solicitud)
FROM cargos c
LEFT JOIN solicitudes_empresas se ON c.cod_cargo = se.cod_cargo
GROUP BY c.cod_cargo, c.desc_cargo
HAVING COUNT(se.fecha_solicitud) < 2*/




































































































































































