DELIMITER //

CREATE PROCEDURE EditarUsuario(
    IN p_idUsuario INT,
    IN p_Correo VARCHAR(100),
    IN p_Contrasenia VARCHAR(350),
    IN p_Imagen VARCHAR(100),
    IN p_idTipoUsuario INT
)
BEGIN
    DECLARE num_rows INT;

    -- Validar si idUsuario existe
    SELECT COUNT(*) INTO num_rows FROM Usuarios WHERE idUsuario = p_idUsuario;

    IF num_rows > 0 THEN
        -- Validar que Correo no exista en la tabla (excepto para idUsuario)
        SELECT COUNT(*) INTO num_rows FROM Usuarios WHERE Correo = p_Correo AND idUsuario <> p_idUsuario;

        IF num_rows = 0 THEN
            -- Actualizar el registro existente
            UPDATE Usuarios SET
                Correo = p_Correo,
                Contrasenia = p_Contrasenia,
                Imagen = p_Imagen,
                idTipoUsuario = p_idTipoUsuario
            WHERE idUsuario = p_idUsuario;
        ELSE
            SELECT 'El correo ya está siendo utilizado por otro usuario.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el idUsuario buscado.' AS mensaje;
    END IF;
END //

DELIMITER ;
