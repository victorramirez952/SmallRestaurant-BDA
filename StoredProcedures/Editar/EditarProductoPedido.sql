DELIMITER //

CREATE PROCEDURE EditarProductoPedido(
    IN p_idPedido INT,
    IN p_idProducto INT,
    IN p_CantidadProducto INT,
    IN p_Comentarios TEXT
)
BEGIN
    DECLARE num_rows INT;

    -- Validar si idPedido-idProducto existe
    SELECT COUNT(*) INTO num_rows FROM ProductosPedidos WHERE idPedido = p_idPedido AND idProducto = p_idProducto;

    IF num_rows > 0 THEN
        -- Actualizar el registro existente
        UPDATE ProductosPedidos SET
            CantidadProducto = p_CantidadProducto,
            Comentarios = p_Comentarios
        WHERE idPedido = p_idPedido AND idProducto = p_idProducto;
    ELSE
        SELECT 'No se encontró ningún registro con el idPedido-idProducto buscado.' AS mensaje;
    END IF;
END //

DELIMITER ;
