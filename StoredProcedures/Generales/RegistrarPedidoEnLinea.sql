DELIMITER //

CREATE PROCEDURE RegistrarPedidoEnLinea(
  IN p_idUsuario INT,
  IN p_FechaPedido DATE,
  IN p_HoraPedido TIME,
  IN p_idMetodoPago INT,
  IN p_NumeroTarjeta VARCHAR(16),
  IN p_FechaVencimiento DATE,
  IN p_Titular VARCHAR(100),
  OUT p_idPedido INT
)
BEGIN
  -- Variables locales
  DECLARE v_idCarrito INT;
  DECLARE v_idCliente INT;
  DECLARE v_idEntrega INT;
  DECLARE v_numTransaccion INT;
  DECLARE error_msg TEXT;

  -- Manejo de errores
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    GET DIAGNOSTICS CONDITION 1 error_msg = MESSAGE_TEXT;
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_msg;
  END;

  -- Obtener el idCliente a partir del idUsuario
  SELECT idCliente INTO v_idCliente FROM Clientes WHERE idUsuario = p_idUsuario LIMIT 1;

  SELECT idCarrito INTO v_idCarrito FROM Carritos WHERE idCliente = v_idCliente LIMIT 1;
  -- Obtener el idCarrito a partir del idUsuario

  -- Iniciar transacción
  START TRANSACTION;

  -- Insertar el pedido
  CALL InsertarPedido(v_idCliente, p_FechaPedido, p_HoraPedido, p_idPedido);

  -- Insertar el pedido en línea
  CALL InsertarPedidoEnLinea(p_idPedido, 0); -- EstadoOrden: 1 (Preparando)

  -- Insertar la entrega
  CALL InsertarEntrega(p_idPedido, 'En camino', v_idEntrega);

  -- Registrar los productos del pedido
  CALL RegistrarProductosPedido(p_idPedido);

  -- Insertar el pago con tarjeta
  CALL RegistrarPagoTarjeta(p_idPedido, p_idMetodoPago, p_NumeroTarjeta, p_FechaVencimiento, p_Titular, v_numTransaccion);

  -- Obtener el idCarrito a partir del idUsuario
  CALL VaciarCarritoSinCommit(v_idCarrito);
  
  -- Commit de la transacción
  COMMIT;

END //

DELIMITER ;
