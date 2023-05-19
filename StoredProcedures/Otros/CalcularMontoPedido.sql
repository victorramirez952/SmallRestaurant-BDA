DELIMITER //

CREATE PROCEDURE CalcularMontoPedido(
  IN idPedido INT,
  OUT montoTotal DECIMAL(10, 2)
)
BEGIN
  DECLARE total DECIMAL(10, 2);

  -- Verificar si el idPedido existe en la tabla ProductosPedidos
  SELECT COUNT(*) INTO @pedidoExiste
  FROM ProductosPedidos
  WHERE idPedido = idPedido;

  IF @pedidoExiste = 0 THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El idPedido especificado no existe en la tabla ProductosPedidos.';
  END IF;

  -- Calcular el monto total del pedido
  SELECT SUM(pp.CantidadProducto * p.Precio) INTO total
  FROM ProductosPedidos pp
  INNER JOIN Productos p ON pp.idProducto = p.idProducto
  WHERE pp.idPedido = idPedido;

  SET montoTotal = total;
END //

DELIMITER ;
