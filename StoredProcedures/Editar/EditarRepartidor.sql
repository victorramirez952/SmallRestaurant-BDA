DELIMITER //

CREATE PROCEDURE EditarRepartidor(
    IN p_idRepartidor INT,
    IN p_Nombre VARCHAR(100),
    IN p_ApellidoPaterno VARCHAR(100),
    IN p_ApellidoMaterno VARCHAR(100),
    IN p_Salario DECIMAL(10, 2),
    IN p_MatriculaVehiculo VARCHAR(20),
    IN p_idUsuario INT
)
BEGIN
    DECLARE num_rows INT;

    -- Validar si idRepartidor existe
    SELECT COUNT(*) INTO num_rows FROM Repartidores WHERE idRepartidor = p_idRepartidor;

    IF num_rows > 0 THEN
        -- Validar que idUsuario no exista en la tabla Repartidores
        SELECT COUNT(*) INTO num_rows FROM Repartidores WHERE idUsuario = p_idUsuario AND idRepartidor != p_idRepartidor;

        IF num_rows = 0 THEN
            -- Actualizar el registro existente
            UPDATE Repartidores SET
                Nombre = p_Nombre,
                ApellidoPaterno = p_ApellidoPaterno,
                ApellidoMaterno = p_ApellidoMaterno,
                Salario = p_Salario,
                MatriculaVehiculo = p_MatriculaVehiculo,
                idUsuario = p_idUsuario
            WHERE idRepartidor = p_idRepartidor;
        ELSE
            SELECT 'El idUsuario ya está asociado a otro repartidor.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el idRepartidor buscado.' AS mensaje;
    END IF;
END //

DELIMITER ;
