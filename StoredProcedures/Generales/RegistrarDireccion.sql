DELIMITER //

CREATE PROCEDURE RegistrarDireccion(
    IN p_Estado VARCHAR(50),
    IN p_Municipio VARCHAR(100),
    IN p_Colonia VARCHAR(100),
    IN p_Calle VARCHAR(100),
    IN p_NumExterior VARCHAR(20),
    IN p_NumInterior VARCHAR(20),
    IN p_CodigoPostal VARCHAR(10),
    OUT p_idDireccion INT
)
BEGIN
    DECLARE p_idEstado INT;
    DECLARE p_idMunicipio INT;
    DECLARE p_idColonia INT;
    DECLARE p_idDireccionB INT;
    -- DECLARE error_msg VARCHAR(255);
    
    -- DECLARE EXIT HANDLER FOR SQLEXCEPTION
    -- BEGIN
    --     ROLLBACK;
    --     GET DIAGNOSTICS CONDITION 1 error_msg = MESSAGE_TEXT; -- Capturar el mensaje de error
    --     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_msg;
    -- END;
    
    -- START TRANSACTION;
    
    -- Insertar el Estado y obtener el idEstado
    CALL InsertarEstado(p_Estado, @p_idEstado);
    SET p_idEstado = @p_idEstado;
    
    -- Insertar el Municipio y obtener el idMunicipio
    CALL InsertarMunicipio(p_Municipio, p_idEstado, @p_idMunicipio);
    SET p_idMunicipio = @p_idMunicipio;
    
    -- Insertar la Colonia y obtener el idColonia
    CALL InsertarColonia(p_Colonia, p_idMunicipio, @p_idColonia);
    SET p_idColonia = @p_idColonia;
    
    -- Insertar la Dirección y obtener el idDireccion
    CALL InsertarDireccion(p_idColonia, p_Calle, p_NumExterior, p_NumInterior, p_CodigoPostal, @p_idDireccionB);
    SET p_idDireccion = @p_idDireccionB;
        
    -- COMMIT;
    
    -- SELECT p_idDireccion AS idDireccion;
    
END //

DELIMITER ;
