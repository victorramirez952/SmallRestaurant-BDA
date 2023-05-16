DELIMITER //

CREATE PROCEDURE EditarIngredienteProducto(
    IN p_idProducto INT,
    IN p_idIngrediente INT,
    IN p_Cantidad DECIMAL(5, 3),
    IN p_newIdIngrediente INT
)
BEGIN
    DECLARE num_rows INT;

    -- Validar si idProducto-idIngrediente existe
    SELECT COUNT(*) INTO num_rows FROM IngredientesProductos WHERE idProducto = p_idProducto AND idIngrediente = p_idIngrediente;

    IF num_rows > 0 THEN
        -- Validar que la tupla idProducto-newIdIngrediente no exista en la tabla (excepto para idProducto-idIngrediente)
        SELECT COUNT(*) INTO num_rows FROM IngredientesProductos WHERE idProducto = p_idProducto AND idIngrediente = p_newIdIngrediente;

        IF num_rows = 0 OR (p_idIngrediente = p_newIdIngrediente) THEN
            -- Actualizar el registro existente
            UPDATE IngredientesProductos SET
                idIngrediente = p_newIdIngrediente,
                Cantidad = p_Cantidad
            WHERE idProducto = p_idProducto AND idIngrediente = p_idIngrediente;
        ELSE
            SELECT 'La tupla idProducto-newIdIngrediente ya existe en la tabla.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con la combinación idProducto-idIngrediente buscada.' AS mensaje;
    END IF;
END //

DELIMITER ;
