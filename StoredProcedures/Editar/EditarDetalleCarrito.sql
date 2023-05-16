DELIMITER //

CREATE PROCEDURE EditarDetalleCarrito(
    IN p_idDetalleCarrito INT,
    IN p_idCarrito INT,
    IN p_idProducto INT,
    IN p_Cantidad INT,
    IN p_Comentarios TEXT
)
BEGIN
    DECLARE num_rows INT;

    -- Validar si idDetalleCarrito junto existe
    SELECT COUNT(*) INTO num_rows FROM DetallesCarritos WHERE idDetalleCarrito = p_idDetalleCarrito;

    IF num_rows > 0 THEN
        -- Validar que la tupla idCarrito-idProducto no exista en la tabla (excepto para idDetalleCarrito)
        SELECT COUNT(*) INTO num_rows FROM DetallesCarritos WHERE idCarrito = p_idCarrito AND idProducto = p_idProducto AND idDetalleCarrito != p_idDetalleCarrito;

        IF num_rows = 0 THEN
            -- Actualizar el registro existente
            UPDATE DetallesCarritos SET
                idCarrito = p_idCarrito,
                idProducto = p_idProducto,
                Cantidad = p_Cantidad,
                Comentarios = p_Comentarios
            WHERE idDetalleCarrito = p_idDetalleCarrito;
        ELSE
            SELECT 'La combinación idCarrito-idProducto ya existe en otro detalle de carrito.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el idDetalleCarrito buscado.' AS mensaje;
    END IF;
END //

DELIMITER ;
