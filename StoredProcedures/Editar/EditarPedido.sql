DELIMITER //

CREATE PROCEDURE EditarPedido(
    IN p_idPedido INT,
    IN p_idCliente INT,
    IN p_FechaPedido DATE,
    IN p_HoraPedido TIME
)
BEGIN
    DECLARE num_rows INT;

    -- Validar si idPedido existe
    SELECT COUNT(*) INTO num_rows FROM Pedidos WHERE idPedido = p_idPedido;

    IF num_rows > 0 THEN
        -- Actualizar el registro existente
        UPDATE Pedidos SET idCliente = p_idCliente, FechaPedido = p_FechaPedido, HoraPedido = p_HoraPedido WHERE idPedido = p_idPedido;
    ELSE
        SELECT 'No se encontró ningún registro con el id buscado.' AS mensaje;
    END IF;
END //

DELIMITER ;
