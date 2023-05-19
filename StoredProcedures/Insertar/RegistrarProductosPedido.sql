DELIMITER //

CREATE PROCEDURE RegistrarProductosPedido(
  IN p_idPedido INT
)
BEGIN
  -- Variables locales
  DECLARE v_idCliente INT;
  DECLARE v_idCarrito INT;
  DECLARE v_idProducto INT;
  DECLARE v_CantidadProducto INT;
  DECLARE v_Comentarios TEXT;
  DECLARE error_msg TEXT;

  -- Manejo de errores
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    GET DIAGNOSTICS CONDITION 1 error_msg = MESSAGE_TEXT;
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_msg;
  END;

  -- Obtener el idCliente a partir del idPedido
  SELECT idCliente INTO v_idCliente FROM Pedidos WHERE idPedido = p_idPedido;

  -- Obtener el idCarrito a partir del idCliente
  SELECT idCarrito INTO v_idCarrito FROM Carritos WHERE idCliente = v_idCliente;

  -- Iniciar transacción
  -- START TRANSACTION;

  -- Insertar los productos del carrito en el pedido
  INSERT INTO ProductosPedidos (idPedido, idProducto, CantidadProducto, Comentarios)
  SELECT p_idPedido, dc.idProducto, dc.Cantidad, dc.Comentarios
  FROM DetallesCarritos dc
  WHERE dc.idCarrito = v_idCarrito
  AND NOT EXISTS (
    SELECT 1
    FROM ProductosPedidos pp
    WHERE pp.idPedido = p_idPedido
    AND pp.idProducto = dc.idProducto
  );

  -- Verificar si se insertaron todos los productos
  IF ROW_COUNT() = 0 THEN
    ROLLBACK;
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error en la transacción. No se pudo registrar los productos del pedido.';
  END IF;

  -- Commit de la transacción
  -- COMMIT;
END //

DELIMITER ;
