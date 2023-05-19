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
  WHERE idPedido = p_idPedido
  LIMIT 1;

  IF v_numTransaccion IS NOT NULL THEN
    -- El NumTransaccion ya existe, lanzar un error mediante SIGNAL
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El NumTransaccion ya existe en la tabla Pagos.';
  ELSE
    -- El Pedido no existe, insertar un nuevo registro
    INSERT INTO Pagos (MontoTotal, idMetodoPago, idPedido)
    VALUES (p_MontoTotal, p_idMetodoPago, p_idPedido);

    -- Obtener el numTransaccion insertado
    SET p_numTransaccion = LAST_INSERT_ID();
  END IF;
END //

DELIMITER ;
