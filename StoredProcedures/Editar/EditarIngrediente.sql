DELIMITER //

CREATE PROCEDURE EditarIngrediente(
    IN p_idIngrediente INT,
    IN p_NombreIngrediente VARCHAR(100),
    IN p_StockIngrediente INT,
    IN p_TipoUnidad VARCHAR(255)
)
BEGIN
    DECLARE num_rows INT;
    DECLARE var_idTipoUnidad INT;
    DECLARE error_msg TEXT;

    -- Manejo de errores
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        GET DIAGNOSTICS CONDITION 1 error_msg = MESSAGE_TEXT;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_msg;
    END;

    SELECT idUnidad INTO var_idTipoUnidad
    FROM Unidades
    WHERE TipoUnidad = p_TipoUnidad;

    IF var_idTipoUnidad IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se encontró el tipo de unidad ingresada';
    END IF;

    -- Validar si idIngrediente existe
    SELECT COUNT(*) INTO num_rows FROM Ingredientes WHERE idIngrediente = p_idIngrediente;

    IF num_rows > 0 THEN
        -- Actualizar el registro existente
        UPDATE Ingredientes SET
            NombreIngrediente = p_NombreIngrediente,
            StockIngrediente = p_StockIngrediente,
            idUnidad = var_idTipoUnidad
        WHERE idIngrediente = p_idIngrediente;
        SELECT p_idIngrediente;
        COMMIT;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se encontró ningún registro con el idIngrediente buscado';
    END IF;
END //

DELIMITER ;