DELIMITER //

CREATE PROCEDURE EditarIngrediente(
    IN p_idIngrediente INT,
    IN p_NombreIngrediente VARCHAR(100),
    IN p_StockIngrediente INT,
    IN p_idUnidad INT
)
BEGIN
    DECLARE num_rows INT;

    -- Validar si idIngrediente existe
    SELECT COUNT(*) INTO num_rows FROM Ingredientes WHERE idIngrediente = p_idIngrediente;

    IF num_rows > 0 THEN
        -- Actualizar el registro existente
        UPDATE Ingredientes SET
            NombreIngrediente = p_NombreIngrediente,
            StockIngrediente = p_StockIngrediente,
            idUnidad = p_idUnidad
        WHERE idIngrediente = p_idIngrediente;
    ELSE
        SELECT 'No se encontró ningún registro con el idIngrediente buscado.' AS mensaje;
    END IF;
END //

DELIMITER ;