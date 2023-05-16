DELIMITER //

CREATE PROCEDURE EditarDireccion(
    IN p_idDireccion INT,
    IN p_idColonia INT,
    IN p_Calle VARCHAR(100),
    IN p_NumExterior VARCHAR(20),
    IN p_NumInterior VARCHAR(20),
    IN p_CodigoPostal VARCHAR(10)
)
BEGIN
    DECLARE num_rows INT;

    -- Validar si idDireccion existe
    SELECT COUNT(*) INTO num_rows FROM Direcciones WHERE idDireccion = p_idDireccion;

    IF num_rows > 0 THEN
        -- Actualizar el registro existente
        UPDATE Direcciones SET
            idColonia = p_idColonia,
            Calle = p_Calle,
            NumExterior = p_NumExterior,
            NumInterior = p_NumInterior,
            CodigoPostal = p_CodigoPostal
        WHERE idDireccion = p_idDireccion;
    ELSE
        SELECT 'No se encontró ningún registro con el idDireccion buscado.' AS mensaje;
    END IF;
END //

DELIMITER ;
