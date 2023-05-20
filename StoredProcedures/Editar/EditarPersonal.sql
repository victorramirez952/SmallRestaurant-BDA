DELIMITER //

CREATE PROCEDURE EditarPersonal(
    IN p_idUsuario INT,
    IN p_Nombre VARCHAR(100),
    IN p_ApellidoPaterno VARCHAR(100),
    IN p_ApellidoMaterno VARCHAR(100),
    IN p_Salario DECIMAL(10, 2),
    IN p_correo VARCHAR(100),
    IN p_TipoUsuario VARCHAR(50)
)
BEGIN
    DECLARE tipoUsuarioExistente INT;
    
    -- Verificar si el TipoUsuario es válido
    SELECT COUNT(*) INTO tipoUsuarioExistente
    FROM TipoUsuario
    WHERE TipoUsuario = p_TipoUsuario;
    
    IF tipoUsuarioExistente = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'TipoUsuario inválido.';
    END IF;
    
    -- Actualizar los datos según el TipoUsuario
    IF p_TipoUsuario = 'Repartidor' THEN
        UPDATE Repartidores
        SET Nombre = p_Nombre,
            ApellidoPaterno = p_ApellidoPaterno,
            ApellidoMaterno = p_ApellidoMaterno,
            Salario = p_Salario
        WHERE idUsuario = p_idUsuario;
        
        UPDATE Usuarios
        SET Correo = p_correo,
            idTipoUsuario = (SELECT idTipoUsuario FROM TipoUsuario WHERE TipoUsuario = p_TipoUsuario)
        WHERE idUsuario = p_idUsuario;
        
    ELSEIF p_TipoUsuario = 'Chef' THEN
        UPDATE Chefs
        SET Nombre = p_Nombre,
            ApellidoPaterno = p_ApellidoPaterno,
            ApellidoMaterno = p_ApellidoMaterno,
            Salario = p_Salario
        WHERE idUsuario = p_idUsuario;
        
        UPDATE Usuarios
        SET Correo = p_correo,
            idTipoUsuario = (SELECT idTipoUsuario FROM TipoUsuario WHERE TipoUsuario = p_TipoUsuario)
        WHERE idUsuario = p_idUsuario;
        
    ELSEIF p_TipoUsuario = 'Mesero' THEN
        UPDATE Meseros
        SET Nombre = p_Nombre,
            ApellidoPaterno = p_ApellidoPaterno,
            ApellidoMaterno = p_ApellidoMaterno,
            Salario = p_Salario
        WHERE idUsuario = p_idUsuario;
        
        UPDATE Usuarios
        SET Correo = p_correo,
            idTipoUsuario = (SELECT idTipoUsuario FROM TipoUsuario WHERE TipoUsuario = p_TipoUsuario)
        WHERE idUsuario = p_idUsuario;
        
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'TipoUsuario no válido para editar personal.';
    END IF;
    
    SELECT 'Personal actualizado correctamente.' AS mensaje;
END //

DELIMITER ;
