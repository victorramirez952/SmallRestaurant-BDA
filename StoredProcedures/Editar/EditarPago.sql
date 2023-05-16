DELIMITER //

CREATE PROCEDURE EditarPago(
    IN p_NumTransaccion INT,
    IN p_MontoTotal DECIMAL(10, 2),
    IN p_idMetodoPago INT,
    IN p_idPedido INT
)
BEGIN
    DECLARE num_rows INT;

    -- Validar si NumTransaccion existe
    SELECT COUNT(*) INTO num_rows FROM Pagos WHERE NumTransaccion = p_NumTransaccion;

    IF num_rows > 0 THEN
        -- Actualizar el registro existente
        UPDATE Pagos SET MontoTotal = p_MontoTotal, idMetodoPago = p_idMetodoPago, idPedido = p_idPedido WHERE NumTransaccion = p_NumTransaccion;
    ELSE
        SELECT 'No se encontró ningún registro con el NumTransaccion buscado.' AS mensaje;
    END IF;
END //

DELIMITER ;
