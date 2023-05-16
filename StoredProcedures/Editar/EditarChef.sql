DELIMITER //

CREATE PROCEDURE EditarChef(
    IN p_idChef INT,
    IN p_Nombre VARCHAR(100),
    IN p_ApellidoPaterno VARCHAR(100),
    IN p_ApellidoMaterno VARCHAR(100),
    IN p_Salario DECIMAL(10, 2),
    IN p_idEspecialidad INT,
    IN p_idUsuario INT
)
BEGIN
    DECLARE num_rows INT;

    -- Validar si idChef existe
    SELECT COUNT(*) INTO num_rows FROM Chefs WHERE idChef = p_idChef;

    IF num_rows > 0 THEN
        -- Validar que idUsuario no exista en la tabla Chefs (excepto para idChef)
        SELECT COUNT(*) INTO num_rows FROM Chefs WHERE idUsuario = p_idUsuario AND idChef <> p_idChef;

        IF num_rows = 0 THEN
            -- Actualizar el registro existente
            UPDATE Chefs SET
                Nombre = p_Nombre,
                ApellidoPaterno = p_ApellidoPaterno,
                ApellidoMaterno = p_ApellidoMaterno,
                Salario = p_Salario,
                idEspecialidad = p_idEspecialidad,
                idUsuario = p_idUsuario
            WHERE idChef = p_idChef;
        ELSE
            SELECT 'El idUsuario ya está siendo utilizado por otro registro.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el idChef buscado.' AS mensaje;
    END IF;
END //

DELIMITER ;
