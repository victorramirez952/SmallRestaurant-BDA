DELIMITER //

CREATE PROCEDURE EditarMesero(
    IN p_idMesero INT,
    IN p_Nombre VARCHAR(100),
    IN p_ApellidoPaterno VARCHAR(100),
    IN p_ApellidoMaterno VARCHAR(100),
    IN p_Salario DECIMAL(10, 2),
    IN p_idUsuario INT
)
BEGIN
    DECLARE num_rows INT;

    -- Validar si idMesero existe
    SELECT COUNT(*) INTO num_rows FROM Meseros WHERE idMesero = p_idMesero;

    IF num_rows > 0 THEN
        -- Validar que idUsuario no exista en la tabla Meseros (excepto para idMesero)
        SELECT COUNT(*) INTO num_rows FROM Meseros WHERE idUsuario = p_idUsuario AND idMesero <> p_idMesero;

        IF num_rows = 0 THEN
            -- Actualizar el registro existente
            UPDATE Meseros SET
                Nombre = p_Nombre,
                ApellidoPaterno = p_ApellidoPaterno,
                ApellidoMaterno = p_ApellidoMaterno,
                Salario = p_Salario,
                idUsuario = p_idUsuario
            WHERE idMesero = p_idMesero;
        ELSE
            SELECT 'El idUsuario ya está siendo utilizado por otro registro.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el idMesero buscado.' AS mensaje;
    END IF;
END //

DELIMITER ;
