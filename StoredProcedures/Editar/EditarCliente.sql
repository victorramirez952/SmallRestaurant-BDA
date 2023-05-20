DELIMITER //

CREATE PROCEDURE EditarCliente(
    IN p_idCliente INT,
    IN p_Nombre VARCHAR(100),
    IN p_ApellidoPaterno VARCHAR(100),
    IN p_ApellidoMaterno VARCHAR(100),
    IN p_TelefonoContacto VARCHAR(20),
    IN p_idUsuario INT
)
BEGIN
    DECLARE num_rows INT;
    DECLARE error_msg TEXT;

    -- Manejo de errores
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        GET DIAGNOSTICS CONDITION 1 error_msg = MESSAGE_TEXT;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_msg;
    END;

    -- Validar si idCliente existe
    SELECT COUNT(*) INTO num_rows FROM Clientes WHERE idCliente = p_idCliente;

    IF num_rows > 0 THEN
        SELECT COUNT(*) INTO num_rows FROM Clientes WHERE idUsuario = p_idUsuario AND idCliente != p_idCliente;

        IF num_rows = 0 THEN
            -- Actualizar el registro existente
            UPDATE Clientes SET
                Nombre = p_Nombre,
                ApellidoPaterno = p_ApellidoPaterno,
                ApellidoMaterno = p_ApellidoMaterno,
                TelefonoContacto = p_TelefonoContacto,
                idUsuario = p_idUsuario
            WHERE idCliente = p_idCliente;
            COMMIT;
        ELSE
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El idUsuario ya está asociado a otro cliente';
        END IF;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se encontró ningún registro con el idCliente buscado';
    END IF;
END //

DELIMITER ;
