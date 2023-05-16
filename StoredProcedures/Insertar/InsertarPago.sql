DELIMITER //

CREATE PROCEDURE InsertarPago(
  IN p_MontoTotal DECIMAL(10, 2),
  IN p_idMetodoPago INT,
  IN p_idPedido INT,
  OUT p_numTransaccion INT
)
BEGIN
  DECLARE v_numTransaccion INT;

  -- Verificar si el Pedido existe
  SELECT NumTransaccion INTO v_numTransaccion
  FROM Pagos
  WHERE idPedido = p_idPedido;

  IF v_numTransaccion IS NULL THEN
    -- El Pedido no existe, insertar un nuevo registro
    INSERT INTO Pagos (MontoTotal, idMetodoPago, idPedido)
    VALUES (p_MontoTotal, p_idMetodoPago, p_idPedido);

    -- Obtener el numTransaccion insertado
    SET p_numTransaccion = LAST_INSERT_ID();
  ELSE
    -- El Pedido ya existe, retornar el numTransaccion encontrado
    SET p_numTransaccion = v_numTransaccion;
  END IF;
END //

DELIMITER ;
