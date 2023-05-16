DELIMITER //

CREATE PROCEDURE EditarEstado(
    IN p_idEstado INT,
    IN p_Estado VARCHAR(50)
)
BEGIN
    DECLARE num_rows INT;

    -- Validar si idEstado existe
    SELECT COUNT(*) INTO num_rows FROM Estados WHERE idEstado = p_idEstado;

    IF num_rows > 0 THEN
        -- Validar que Estado no exista en la tabla (excepto para idEstado)
        SELECT COUNT(*) INTO num_rows FROM Estados WHERE Estado = p_Estado AND idEstado <> p_idEstado;

        IF num_rows = 0 THEN
            -- Actualizar el registro existente
            UPDATE Estados SET
                Estado = p_Estado
            WHERE idEstado = p_idEstado;
        ELSE
            SELECT 'El estado ya existe en la base de datos.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el idEstado buscado.' AS mensaje;
    END IF;
END //

DELIMITER ;
