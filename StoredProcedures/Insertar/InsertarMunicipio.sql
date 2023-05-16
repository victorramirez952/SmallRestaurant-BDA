DELIMITER //

CREATE PROCEDURE InsertarMunicipio(
    IN p_Municipio VARCHAR(100),
    IN p_idEstado INT,
    OUT p_idMunicipio INT
)
BEGIN
    DECLARE municipioExistente INT;
    
    -- Verificar si la tupla Municipio-idEstado ya existe en la tabla Municipios
    SELECT idMunicipio INTO municipioExistente
    FROM Municipios 
    WHERE Municipio = p_Municipio AND idEstado = p_idEstado
    LIMIT 1;
    
    IF municipioExistente IS NULL THEN
        -- Si la tupla no existe, insertarla en la tabla Municipios
        INSERT INTO Municipios (Municipio, idEstado)
        VALUES (p_Municipio, p_idEstado);
        SET p_idMunicipio = LAST_INSERT_ID();
    ELSE
        -- Si la tupla ya existe, asignar el idMunicipio existente
        SET p_idMunicipio = municipioExistente;
    END IF;
END //

DELIMITER ;
