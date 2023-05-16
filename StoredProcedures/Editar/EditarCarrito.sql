DELIMITER //

CREATE PROCEDURE EditarCarrito(
    IN p_idCarrito INT,
    IN p_idCliente INT
)
BEGIN
    DECLARE num_rows INT;

    -- Validar si idCarrito existe
    SELECT COUNT(*) INTO num_rows FROM Carritos WHERE idCarrito = p_idCarrito;

    IF num_rows > 0 THEN
        -- Validar que idCliente no exista en la tabla (excepto para idCarrito)
        SELECT COUNT(*) INTO num_rows FROM Carritos WHERE idCliente = p_idCliente AND idCarrito != p_idCarrito;

        IF num_rows = 0 THEN
            -- Actualizar el registro existente
            UPDATE Carritos SET
                idCliente = p_idCliente
            WHERE idCarrito = p_idCarrito;
        ELSE
            SELECT 'El idCliente ya está asociado a otro carrito.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el idCarrito buscado.' AS mensaje;
    END IF;
END //

DELIMITER ;
