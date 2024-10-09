
/*SELECT p.nombre, p.apellido, c.sueldo, c.dni  
FROM contratos c
INNER JOIN personas p ON  c.dni = p.dni  
WHERE c.nro_contrato = 5*/


/*SELECT p.dni, c.nro_contrato, c.fecha_incorporacion, c.fecha_solicitud, IFNULL(c.fecha_caducidad, 'Sin Fecha') "Fecha de caducidad"
FROM contratos c
INNER JOIN empresas e ON c.cuit = e.cuit 
INNER JOIN personas p ON c.dni = p.dni
WHERE e.razon_social IN ('Viejos Amigos', 'Tráigame eso')
ORDER BY c.fecha_incorporacion, e.razon_social;*/


/*SELECT e.razon_social, e.direccion, e.e_mail, c.desc_cargo, s.anios_experiencia
FROM empresas e
INNER JOIN solicitudes_empresas s ON e.cuit = s.cuit
INNER JOIN cargos c ON s.cod_cargo = c.cod_cargo
ORDER BY s.fecha_solicitud, c.desc_cargo*/


/*SELECT  p.dni, p.nombre, p.apellido, t.desc_titulo 
FROM personas p
INNER JOIN personas_titulos pt ON p.dni = pt.dni
INNER JOIN titulos t ON pt.cod_titulo = t.cod_titulo
WHERE t.tipo_titulo IN ('Secundario', 'Educacion no formal')*/


/*SELECT p.nombre, p.apellido, t.desc_titulo 
FROM personas p
INNER JOIN personas_titulos pt ON p.dni = pt.dni
INNER JOIN titulos t ON pt.cod_titulo = t.cod_titulo*/


/*SELECT DISTINCT CONCAT(p.apellido, ' ', p.nombre, ' tiene como referencia a ', IFNULL(a.persona_contacto, 'No tiene contacto ') , 'cuando trabajo en ', e.razon_social) AS "Datos de empleados"
FROM personas p
INNER JOIN antecedentes a ON p.dni = a.dni 
INNER JOIN empresas e ON a.cuit = e.cuit
WHERE a.persona_contacto IS NULL OR a.persona_contacto IN ('Armando Esteban Quito', 'Felipe Rojas')*/




/*SELECT e.razon_social AS Empresa, se.fecha_solicitud AS "Fecha Solicitud", c.desc_cargo AS Cargo, IFNULL(se.edad_minima, "Sin especificar") AS "Edad Minima", IFNULL(se.edad_maxima, "Sin especificar") AS "Edad Maxima"
FROM empresas e 
INNER JOIN solicitudes_empresas se ON e.cuit = se.cuit
INNER JOIN cargos c ON se.cod_cargo = c.cod_cargo
WHERE e.razon_social = 'Viejos Amigos'*/


/*SELECT CONCAT(p.nombre, p.apellido) AS Postulante, c.desc_cargo AS Cargo
FROM personas p 
INNER JOIN antecedentes a ON p.dni = a.dni
INNER JOIN cargos c ON a.cod_cargo = c.cod_cargo*/


/*SELECT DISTINCT e.razon_social AS Empresa, c.desc_cargo AS Cargo, ev.desc_evaluacion AS "Desc Evaluacion", en_ev.resultado AS Resultado
FROM empresas e
INNER JOIN solicitudes_empresas se ON e.cuit = se.cuit
INNER JOIN cargos c ON se.cod_cargo = c.cod_cargo
INNER JOIN entrevistas en ON c.cod_cargo = en.cod_cargo
INNER JOIN entrevistas_evaluaciones en_ev ON en.nro_entrevista = en_ev.nro_entrevista
INNER JOIN evaluaciones ev ON en_ev.cod_evaluacion = ev.cod_evaluacion
ORDER BY e.razon_social ASC, c.desc_cargo DESC;*/


-- LEFT/RIGHT JOIN

/*SELECT e.cuit, e.razon_social, IFNULL(se.fecha_solicitud, "Sin Solicitudes") AS "Fecha Solicitud", IFNULL(c.desc_cargo, "Sin Solicitudes") AS "Cargo"
FROM empresas e
LEFT JOIN solicitudes_empresas se ON e.cuit = se.cuit
LEFT JOIN cargos c ON se.cod_cargo = c.cod_cargo*/



/*SELECT e.cuit, e.razon_social, c.desc_cargo, IFNULL(p.dni, 'Sin contrato') AS Dni, IFNULL(p.apellido , 'Sin contrato') AS Apellido, IFNULL(p.nombre, 'Sin contrato') AS Nombre
FROM solicitudes_empresas se
INNER JOIN empresas e ON se.cuit = e.cuit
INNER JOIN cargos c ON se.cod_cargo = c.cod_cargo
LEFT JOIN contratos con ON con.cuit = se.cuit AND con.cod_cargo = se.cod_cargo AND con.fecha_solicitud = se.fecha_solicitud
LEFT JOIN personas p ON p.dni = con.dni*/


/*SELECT e.cuit, e.razon_social, c.desc_cargo
FROM solicitudes_empresas se
INNER JOIN empresas e ON se.cuit = e.cuit
INNER JOIN cargos c ON se.cod_cargo = c.cod_cargo
LEFT JOIN contratos co ON c.cod_cargo = co.cod_cargo AND co.fecha_solicitud = se.fecha_solicitud
WHERE co.nro_contrato IS NULL*/


/*SELECT c.desc_cargo, IFNULL(p.dni, "Sin antecedente") AS DNI, IFNULL(p.apellido, "Sin antecedente") AS Apellido, e.razon_social
FROM cargos c
LEFT JOIN antecedentes a ON c.cod_cargo = a.cod_cargo
LEFT  JOIN personas p ON a.dni = p.dni 
LEFT JOIN empresas e ON a.cuit = e.cuit*/


-- BASE DE DATOS: AFATSE
-- SELF JOIN

/*SELECT i.cuil AS "Cuil instructor", i.nombre AS "Nombre instructor", i.apellido AS "Apellido instructor", i.cuil_supervisor AS "Cuil supervisor", s.nombre AS "Nombre supervisor", s.apellido AS "Apellido supervisor"
FROM instructores i
INNER JOIN instructores s ON i.cuil_supervisor = s.cuil*/


/*SELECT i.cuil AS "Cuil Instructor", i.nombre AS "Nombre Instructor", i.apellido AS "Apellido Instructor", IFNULL(i.cuil_supervisor, '') AS "Cuil Supervisor", IFNULL(s.nombre, '') AS "Nombre Supervisor", IFNULL(s.apellido, '') AS "Apellido Supervisor"
FROM instructores i
LEFT JOIN instructores s ON i.cuil_supervisor = s.cuil*/


/*SELECT DISTINCT S.cuil AS "Cuil Supervisor", 
    s.nombre AS "Nombre Supervisor", 
    s.apellido AS "Apellido Supervisor", 
    i.nombre AS "Nombre Instructor", 
    i.apellido AS "Apellido Instructor", 
    p.nom_plan AS "Plan de Capacitación", 
    c.nro_curso AS "Curso", 
    a.nombre AS "Nombre Alumno", 
    a.apellido AS "Apellido Alumno", 
    e.nro_examen AS "Examen", 
    e.fecha_evaluacion AS "Fecha de Evaluación", 
    e.nota AS "Nota"
FROM instructores i
LEFT JOIN instructores s ON i.cuil_supervisor = s.cuil 
INNER JOIN evaluaciones e ON i.cuil = e.cuil 
INNER JOIN alumnos a ON e.dni = a.dni 
INNER JOIN plan_capacitacion p ON e.nom_plan = p.nom_plan 
INNER JOIN cursos c ON e.nro_curso = c.nro_curso 
WHERE YEAR(e.fecha_evaluacion) = 2014
ORDER BY s.apellido ASC, s.nombre ASC, e.fecha_evaluacion DESC;*/




