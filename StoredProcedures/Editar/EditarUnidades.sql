DELIMITER //

CREATE PROCEDURE EditarUnidad(
    IN p_idUnidad INT,
    IN p_TipoUnidad VARCHAR(50)
)
BEGIN
    DECLARE num_rows INT;

    -- Validar si idUnidad existe
    SELECT COUNT(*) INTO num_rows FROM Unidades WHERE idUnidad = p_idUnidad;

    IF num_rows > 0 THEN
        -- Validar que TipoUnidad no exista en la tabla (excepto para idUnidad)
        SELECT COUNT(*) INTO num_rows FROM Unidades WHERE TipoUnidad = p_TipoUnidad AND idUnidad <> p_idUnidad;

        IF num_rows = 0 THEN
            -- Actualizar el registro existente
            UPDATE Unidades SET
                TipoUnidad = p_TipoUnidad
            WHERE idUnidad = p_idUnidad;
        ELSE
            SELECT 'El TipoUnidad ya está siendo utilizado por otro registro.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el idUnidad buscado.' AS mensaje;
    END IF;
END //

DELIMITER ;
