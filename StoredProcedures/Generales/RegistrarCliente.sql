DELIMITER //

CREATE PROCEDURE RegistrarCliente(
    IN p_Correo VARCHAR(100),
    IN p_Contrasenia VARCHAR(350),
    IN p_Imagen VARCHAR(100),
    IN p_idTipoUsuario INT,
    IN p_Estado VARCHAR(50),
    IN p_Municipio VARCHAR(100),
    IN p_Colonia VARCHAR(100),
    IN p_Calle VARCHAR(100),
    IN p_NumExterior VARCHAR(20),
    IN p_NumInterior VARCHAR(20),
    IN p_CodigoPostal VARCHAR(10),
    IN p_Nombre VARCHAR(100),
    IN p_ApellidoPaterno VARCHAR(100),
    IN p_ApellidoMaterno VARCHAR(100),
    IN p_TelefonoContacto VARCHAR(20),
    OUT p_idCliente INT
)
BEGIN
    DECLARE error_msg VARCHAR(255);
    DECLARE p_idDireccion INT;
    DECLARE p_idUsuario INT;
    DECLARE p_idCliente2 INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        GET DIAGNOSTICS CONDITION 1 error_msg = MESSAGE_TEXT;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_msg;
    END;

    START TRANSACTION;

    -- Insertar el Usuario y obtener el idUsuario
    CALL InsertarUsuario(p_Correo, p_Contrasenia, p_Imagen, p_idTipoUsuario, @p_idUsuario);
    SET p_idUsuario = @p_idUsuario;

    -- Registrar la Dirección y obtener el idDireccion
    CALL RegistrarDireccion(p_Estado, p_Municipio, p_Colonia, p_Calle, p_NumExterior, p_NumInterior, p_CodigoPostal, @p_idDireccion);
    SET p_idDireccion = @p_idDireccion;

    -- Insertar el Cliente y obtener el idCliente
    CALL InsertarCliente(p_Nombre, p_ApellidoPaterno, p_ApellidoMaterno, p_TelefonoContacto, p_idDireccion, p_idUsuario, @p_idCliente2);
    SET p_idCliente = @p_idCliente2;

    COMMIT;

    -- SELECT p_idCliente AS p_idCliente;
END //

DELIMITER ;
