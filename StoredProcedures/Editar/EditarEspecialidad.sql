DELIMITER //

CREATE PROCEDURE EditarEspecialidad(
    IN p_idEspecialidad INT,
    IN p_Especialidad VARCHAR(100)
)
BEGIN
    DECLARE num_rows INT;

    -- Validar si idEspecialidad existe
    SELECT COUNT(*) INTO num_rows FROM Especialidades WHERE idEspecialidad = p_idEspecialidad;

    IF num_rows > 0 THEN
        -- Validar que Especialidad no exista en la tabla (excepto para idEspecialidad)
        SELECT COUNT(*) INTO num_rows FROM Especialidades WHERE Especialidad = p_Especialidad AND idEspecialidad <> p_idEspecialidad;

        IF num_rows = 0 THEN
            -- Actualizar el registro existente
            UPDATE Especialidades SET
                Especialidad = p_Especialidad
            WHERE idEspecialidad = p_idEspecialidad;
        ELSE
            SELECT 'La especialidad ya está siendo utilizada por otro registro.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el idEspecialidad buscado.' AS mensaje;
    END IF;
END //

DELIMITER ;
