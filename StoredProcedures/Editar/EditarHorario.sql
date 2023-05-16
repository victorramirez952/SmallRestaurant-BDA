DELIMITER //

CREATE PROCEDURE EditarHorario(
    IN p_idHorario INT,
    IN p_Fecha DATE,
    IN p_Hora TIME
)
BEGIN
    DECLARE num_rows INT;

    -- Verificar si el idHorario existe
    SELECT COUNT(*) INTO num_rows FROM Horarios WHERE idHorario = p_idHorario;

    IF num_rows > 0 THEN
        -- Actualizar el registro existente
        UPDATE Horarios SET Fecha = p_Fecha, Hora = p_Hora WHERE idHorario = p_idHorario;
        SELECT 'Registro actualizado correctamente.' AS mensaje;
    ELSE
        SELECT 'No se encontró ningún registro con el id buscado.' AS mensaje;
    END IF;
END //

DELIMITER ;
