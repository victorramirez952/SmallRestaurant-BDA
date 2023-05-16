DELIMITER //

CREATE PROCEDURE EditarTipoUsuario(
    IN p_idTipoUsuario INT,
    IN p_TipoUsuario VARCHAR(50)
)
BEGIN
    DECLARE num_rows INT;

    -- Validar si idTipoUsuario existe
    SELECT COUNT(*) INTO num_rows FROM TipoUsuario WHERE idTipoUsuario = p_idTipoUsuario;

    IF num_rows > 0 THEN
        -- Validar que TipoUsuario no exista en la tabla (excepto para idTipoUsuario)
        SELECT COUNT(*) INTO num_rows FROM TipoUsuario WHERE TipoUsuario = p_TipoUsuario AND idTipoUsuario <> p_idTipoUsuario;

        IF num_rows = 0 THEN
            -- Actualizar el registro existente
            UPDATE TipoUsuario SET
                TipoUsuario = p_TipoUsuario
            WHERE idTipoUsuario = p_idTipoUsuario;
        ELSE
            SELECT 'El tipo de usuario ya existe en la base de datos.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el idTipoUsuario buscado.' AS mensaje;
    END IF;
END //

DELIMITER ;
