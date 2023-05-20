DELIMITER //

CREATE PROCEDURE RegistrarPersonal (
    IN p_nombre VARCHAR(100),
    IN p_apellidoPaterno VARCHAR(100),
    IN p_apellidoMaterno VARCHAR(100),
    IN p_salario DECIMAL(10, 2),
    IN p_correo VARCHAR(100),
    IN p_tipoUsuario VARCHAR(50),
    OUT p_idUsuario INT
)
BEGIN
    DECLARE v_idTipoUsuario INT;
    DECLARE v_idInsertado INT;

    -- Obtener el idTipoUsuario a partir de p_tipoUsuario
    SELECT idTipoUsuario INTO v_idTipoUsuario
    FROM TipoUsuario
    WHERE TipoUsuario = p_tipoUsuario;

    IF v_idTipoUsuario IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El TipoUsuario no existe.';
    ELSE
        -- Iniciar transacción
        START TRANSACTION;

        -- Llamar a InsertarUsuario
        CALL InsertarUsuario(p_correo, '666', 'nombreImagen', v_idTipoUsuario, v_idInsertado);
        SET p_idUsuario = v_idInsertado;

        IF v_idInsertado IS NULL THEN
            -- Rollback y retornar error
            ROLLBACK;
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error al insertar el usuario.';
        ELSE
            -- Llamar al SP correspondiente según el tipoUsuario
            IF p_tipoUsuario = 'Mesero' THEN
                CALL InsertarMesero(p_nombre, p_apellidoPaterno, p_apellidoMaterno, p_salario, v_idInsertado, p_idUsuario);
            ELSEIF p_tipoUsuario = 'Repartidor' THEN
                CALL InsertarRepartidor(p_nombre, p_apellidoPaterno, p_apellidoMaterno, p_salario, NULL, v_idInsertado, p_idUsuario);
            ELSEIF p_tipoUsuario = 'Chef' THEN
                CALL InsertarChef(p_nombre, p_apellidoPaterno, p_apellidoMaterno, p_salario, NULL, v_idInsertado, p_idUsuario);
            END IF;

            IF p_idUsuario IS NULL THEN
                -- Rollback y retornar error
                ROLLBACK;
                SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'Error al insertar el personal.';
            ELSE
                -- Commit y retornar éxito
                COMMIT;
            END IF;
        END IF;
    END IF;
END //

DELIMITER ;
