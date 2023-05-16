DELIMITER //
CREATE PROCEDURE InsertarCliente(
    IN p_Nombre VARCHAR(100),
    IN p_ApellidoPaterno VARCHAR(100),
    IN p_ApellidoMaterno VARCHAR(100),
    IN p_TelefonoContacto VARCHAR(20),
    IN p_idDireccion INT,
    IN p_idUsuario INT,
    OUT p_idCliente INT
)
BEGIN
    -- DECLARE clienteExistente INT;

    -- -- Verificar si la tupla Nombre-ApellidoPaterno-ApellidoMaterno ya existe en la tabla Clientes
    -- SELECT idCliente INTO clienteExistente
    -- FROM Clientes
    -- WHERE Nombre = p_Nombre
    --   AND ApellidoPaterno = p_ApellidoPaterno
    --   AND ApellidoMaterno = p_ApellidoMaterno
    -- LIMIT 1;

    -- IF clienteExistente IS NULL THEN
        -- Si la tupla no existe, insertar un nuevo registro en la tabla Clientes
        INSERT INTO Clientes (Nombre, ApellidoPaterno, ApellidoMaterno, TelefonoContacto, idDireccion, idUsuario)
        VALUES (p_Nombre, p_ApellidoPaterno, p_ApellidoMaterno, p_TelefonoContacto, p_idDireccion, p_idUsuario);

        SET p_idCliente = LAST_INSERT_ID();
    -- ELSE
    --     -- Si la tupla ya existe, asignar el idCliente existente
    --     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cliente ya existente';
    -- END IF;
END //
DELIMITER ;
