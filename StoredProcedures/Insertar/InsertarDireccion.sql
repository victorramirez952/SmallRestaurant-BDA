DELIMITER //

CREATE PROCEDURE InsertarDireccion(
    IN p_idColonia INT,
    IN p_Calle VARCHAR(100),
    IN p_NumExterior VARCHAR(20),
    IN p_NumInterior VARCHAR(20),
    IN p_CodigoPostal VARCHAR(10),
    OUT p_idDireccion INT
)
SP:BEGIN
    -- Buscar direcciones existentes que coincidan exactamente con la nueva dirección
    SELECT idDireccion INTO p_idDireccion
    FROM Direcciones
    WHERE idColonia = p_idColonia
      AND Calle = p_Calle
      AND NumExterior = p_NumExterior
      AND IFNULL(NumInterior, '') = IFNULL(p_NumInterior, '')
      AND CodigoPostal = p_CodigoPostal
    LIMIT 1;
    
    -- Si se encontraron direcciones iguales, se devuelve el idDireccion
    IF p_idDireccion IS NOT NULL THEN
        -- SELECT p_idDireccion;
        LEAVE SP;
    ELSE
        -- Si no hay direcciones iguales, se inserta la nueva dirección y se devuelve el idDireccion generado
        INSERT INTO Direcciones (idColonia, Calle, NumExterior, NumInterior, CodigoPostal)
        VALUES (p_idColonia, p_Calle, p_NumExterior, p_NumInterior, p_CodigoPostal);
        
        SET p_idDireccion = LAST_INSERT_ID();
    END IF;
END //

DELIMITER ;
