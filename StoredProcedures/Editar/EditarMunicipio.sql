DELIMITER //

CREATE PROCEDURE EditarMunicipio(
    IN p_idMunicipio INT,
    IN p_Municipio VARCHAR(100)
)
BEGIN
    DECLARE num_rows INT;

    -- Validar si idMunicipio existe
    SELECT COUNT(*) INTO num_rows FROM Municipios WHERE idMunicipio = p_idMunicipio;

    IF num_rows > 0 THEN
        -- Validar que Municipio no exista en la tabla (excepto para idMunicipio)
        SELECT COUNT(*) INTO num_rows FROM Municipios WHERE Municipio = p_Municipio AND idMunicipio <> p_idMunicipio;

        IF num_rows = 0 THEN
            -- Actualizar el registro existente
            UPDATE Municipios SET
                Municipio = p_Municipio
            WHERE idMunicipio = p_idMunicipio;
        ELSE
            SELECT 'El municipio ya existe en la base de datos.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el idMunicipio buscado.' AS mensaje;
    END IF;
END //

DELIMITER ;
