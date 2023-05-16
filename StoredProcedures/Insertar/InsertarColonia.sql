DELIMITER //

CREATE PROCEDURE InsertarColonia(
    IN p_Colonia VARCHAR(100),
    IN p_idMunicipio INT,
    OUT p_idColonia INT
)
BEGIN
    DECLARE coloniaExistente INT;

    -- Verificar si la tupla Colonia-idMunicipio ya existe en la tabla Colonia;
    SELECT idColonia INTO coloniaExistente
    FROM Colonias
    WHERE Colonia = p_Colonia AND idMunicipio = p_idMunicipio
    LIMIT 1;

    -- Si la tupla no existe, insertarla en la tabla Colonias
    IF coloniaExistente IS NULL THEN
        INSERT INTO Colonias (Colonia, idMunicipio)
        VALUES (p_Colonia, p_idMunicipio);
        SET p_idColonia = LAST_INSERT_ID();
    ELSE
        SET p_idColonia = coloniaExistente;
    END IF;
END //

DELIMITER ;
