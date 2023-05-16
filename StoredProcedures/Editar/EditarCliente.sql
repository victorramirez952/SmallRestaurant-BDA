DELIMITER //

CREATE PROCEDURE EditarCliente(
    IN p_idCliente INT,
    IN p_Nombre VARCHAR(100),
    IN p_ApellidoPaterno VARCHAR(100),
    IN p_ApellidoMaterno VARCHAR(100),
    IN p_TelefonoContacto VARCHAR(20),
    IN p_idDireccion INT,
    IN p_idUsuario INT
)
BEGIN
    DECLARE num_rows INT;

    -- Validar si idCliente existe
    SELECT COUNT(*) INTO num_rows FROM Clientes WHERE idCliente = p_idCliente;

    IF num_rows > 0 THEN
        -- Validar que idUsuario no exista en la tabla Repartidores (excepto para idCliente)
        SELECT COUNT(*) INTO num_rows FROM Repartidores WHERE idUsuario = p_idUsuario AND idRepartidor != p_idCliente;

        IF num_rows = 0 THEN
            -- Actualizar el registro existente
            UPDATE Clientes SET
                Nombre = p_Nombre,
                ApellidoPaterno = p_ApellidoPaterno,
                ApellidoMaterno = p_ApellidoMaterno,
                TelefonoContacto = p_TelefonoContacto,
                idDireccion = p_idDireccion,
                idUsuario = p_idUsuario
            WHERE idCliente = p_idCliente;
        ELSE
            SELECT 'El idUsuario ya está asociado a otro repartidor.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el idCliente buscado.' AS mensaje;
    END IF;
END //

DELIMITER ;
