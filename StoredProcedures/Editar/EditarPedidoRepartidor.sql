DELIMITER //

CREATE PROCEDURE EditarPedidoRepartidor(
    IN p_idPedido INT,
    IN p_idRepartidor INT
)
BEGIN
    DECLARE num_rows INT;

    -- Validar si idPedido existe
    SELECT COUNT(*) INTO num_rows FROM PedidosRepartidores WHERE idPedido = p_idPedido;

    IF num_rows > 0 THEN
        -- Actualizar el registro existente
        UPDATE PedidosRepartidores SET idRepartidor = p_idRepartidor WHERE idPedido = p_idPedido;
    ELSE
        SELECT 'No se encontró ningún registro con el idPedido buscado.' AS mensaje;
    END IF;
END //

DELIMITER ;
