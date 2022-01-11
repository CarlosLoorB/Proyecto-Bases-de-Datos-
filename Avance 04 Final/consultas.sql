SELECT * 
FROM PACIENTE
WHERE USUARIO LIKE "CARLOSLOOR";
-- SE MUESTRA LOS ESCPECIALISTAS DISPONIBLES, SU RESENA
SELECT NOMBRE, ESPECIALIDAD
FROM ESPECIALISTA;
-- VER LOS ESPECIALISTAS DISPONLES EN ESE HORARIO 
SELECT E.NOMBRE , ED.HORARIO
FROM ESPECIALISTA E, ESP_DISPONIBLE ED;
-- SE CAMBIA LA DISPONIBILIDAD DE CIERTO HORArio con cierto especialista dispoNIBLE
UPDATE ESP_DISPONIBLE
  SET DISPONIBLE = FALSE 
  WHERE HORARIO = "2021-12-03 12:30:24"; 
 -- MOSTRAR LAS CITAS AGENDADAS 
 SELECT C.FECHA_HORA, E.NOMBRE
 FROM CITA C, ESPECIALISTA E;
 -- MOSTRAR BUSQUEDA DIARIO
 select d.diario_id, d.id_paciente, d.usuario_esp
 from paciente p, diario d
 where p.usuario=d.id_paciente and p.usuario like "carlosloor";
 -- MOSTRAR BUSQUEDA ENTRADA_DIARIO
 select ed.entrada_id, ed.fechahora,ed.nota,ed.diario_id,ed.emocion_id
 from paciente p, diario d, entrada_diario ed
 where p.usuario=d.id_paciente AND d.diario_id=ed.diario_id and p.usuario like "carlosloor";
-- MOSTRAR EMOCION INGRESADA DE DIARIO
select e.emocion_id, e.emocion
 from paciente p, diario d, entrada_diario ed, emocion e
 where p.usuario=d.id_paciente AND d.diario_id=ed.diario_id and ed.emocion_id=e.emocion_id and p.usuario like "carlosloor";
-- MOSTRAR BUSQUEDA ESPECIALISTA
select e.usuario_esp,e.contrasena,e.especialidad,e.dispurg,e.numertotelefono,e.correo,e.nombre,e.apellido
from paciente p, diario d, especialista e
where p.usuario=d.id_paciente AND d.usuario_esp=e.usuario_esp and p.usuario like "carlosloor";
-- MOSTRAR BUSQUEDA ESPECIALISTA DISPONIBLE
select ep.horario, ep.disponible, ep.usuario_esp
from paciente p, diario d, especialista e, esp_disponible ep
where p.usuario=d.id_paciente AND d.usuario_esp=e.usuario_esp and e.usuario_esp=ep.usuario_esp and p.usuario like "carlosloor";
-- MOSTRAR CARACTERISTICA PACIENTE
select c.caracteristica_id, c.caracteristica,c.usua
from paciente p, caracteristica c
where p.usuario=c.usua and p.usuario like "carlosloor";
-- MOSTRAR RESEÑA/PACIENTE
select r.id_resena, r.comentario,r.caracteristica,r.usu,r.usu_esp,r.id_cita
from paciente p, resena r
where p.usuario=r.usu and p.usuario like "carlosloor";
-- MOSTRAR CITA/PACIENTE
select c.id_cita, c.diagnostico, c.precio,c.fecha_hora,c.estado,c.usua,c.usua_esp
from paciente p, cita c
where p.usuario and c.usua and p.usuario like "carlosloor";
-- BUSQUEDA ESPECIFICA PACIENTE
select * from paciente where usuario like "jagarces";
select * from especialista where usuario_esp like 12345671;
select * from cita where id_cita like 2323;
select * from resena where id_resena like 0235671;
select * from diario where diario_id like 1231;
select * from emocion where emocion_id like 1;
select * from entrada_diario where fechahora like "2021-12-04 14:30:24";
select * from caracteristica where caracteristica_id like "12341";
select * from esp_disponible where horario like "2022-01-02 14:30:00";

