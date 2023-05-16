DELIMITER //

CREATE PROCEDURE EditarColonia(
    IN p_idColonia INT,
    IN p_Colonia VARCHAR(100)
)
BEGIN
    DECLARE num_rows INT;

    -- Validar si idColonia existe
    SELECT COUNT(*) INTO num_rows FROM Colonias WHERE idColonia = p_idColonia;

    IF num_rows > 0 THEN
        -- Validar que Colonia no exista en la tabla (excepto para idColonia)
        SELECT COUNT(*) INTO num_rows FROM Colonias WHERE Colonia = p_Colonia AND idColonia <> p_idColonia;

        IF num_rows = 0 THEN
            -- Actualizar el registro existente
            UPDATE Colonias SET
                Colonia = p_Colonia
            WHERE idColonia = p_idColonia;
        ELSE
            SELECT 'La colonia ya existe en la base de datos.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el idColonia buscado.' AS mensaje;
    END IF;
END //

DELIMITER ;
