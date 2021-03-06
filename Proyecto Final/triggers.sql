-- 1.- SE ACTUALIZA LA RESENA SI 
DROP TRIGGER IF EXISTS ACTUALIZAR_RESENA;
DELIMITER //
CREATE TRIGGER ACTUALIZAR_RESENA AFTER INSERT ON RESENA
FOR EACH ROW BEGIN 
 UPDATE ESPECIALISTA 
 SET CALIFICACION = ((calificacion*num_resenas) + new.calificacion) / (num_resenas+1) , num_resenas = num_resenas+1
 WHERE NEW.USU_ESP = USUARIO_ESP ;
 end // 
 delimiter ;
 
 
 
 -- 2 .- SE ACTUALIZA LA RESENA SI 
DROP TRIGGER IF EXISTS CONSULTA_ACABADA;
DELIMITER //
CREATE TRIGGER CONSULTA_ACABADA AFTER INSERT ON RESENA
FOR EACH ROW BEGIN 
 UPDATE CITA
 SET ESTADO = FALSE
 WHERE NEW.ID_CITA = ID_CITA;
 end // 
 delimiter ;
 
 -- 3.- SE ELIMINA AL DOCTOR SE ELIMINAN SUS HORARIOS DISPONIBLES  
DROP TRIGGER IF EXISTS ESP_DESPEDIDO;
DELIMITER //
CREATE TRIGGER ESP_DESPEDIDO AFTER DELETE ON ESPECIALISTA
FOR EACH ROW BEGIN 
DELETE FROM esp_disponible WHERE OLD.USUARIO_ESP = USUARIO_ESP ;
DELETE FROM CITAS WHERE OLD.USUARIO_ESP = USUARIO_ESP AND ESTADO = TRUE;
 end // 
 delimiter ;