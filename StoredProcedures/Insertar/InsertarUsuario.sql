DELIMITER //

CREATE PROCEDURE InsertarUsuario (
    IN p_Correo VARCHAR(100),
    IN p_Contrasenia VARCHAR(350),
    IN p_Imagen VARCHAR(100),
    IN p_idTipoUsuario INT,
    OUT p_IdInsertado INT
)
BEGIN
    DECLARE v_Encontrado INT;

    SELECT idUsuario INTO v_Encontrado FROM Usuarios WHERE Correo = p_Correo LIMIT 1;

    IF v_Encontrado IS NULL THEN
        INSERT INTO Usuarios (Correo, Contrasenia, Imagen, idTipoUsuario)
        VALUES (p_Correo, p_Contrasenia, p_Imagen, p_idTipoUsuario);
        SET p_IdInsertado = LAST_INSERT_ID();
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El correo ingresado ya está en uso';
        -- SET p_IdInsertado = v_Encontrado;
    END IF;
END //

DELIMITER ;
