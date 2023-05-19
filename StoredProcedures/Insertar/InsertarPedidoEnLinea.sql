DELIMITER //

CREATE PROCEDURE InsertarPedidoEnLinea(
  IN p_idPedido INT,
  IN p_EstadoOrden INT
)
BEGIN
  DECLARE v_Encontrado INT;

  -- Verificar si el idPedido existe
  SELECT idPedido INTO v_Encontrado
  FROM PedidosEnLinea
  WHERE idPedido = p_idPedido
  LIMIT 1;

  IF v_Encontrado IS NOT NULL THEN
    -- El idPedido ya existe, arrojar un error mediante SIGNAL
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pudo agregar el registro. El pedido ya existe.';
  ELSE
    -- El idPedido no existe, insertar un nuevo registro
    INSERT INTO PedidosEnLinea (idPedido, EstadoOrden)
    VALUES (p_idPedido, p_EstadoOrden);
  END IF;
END //

DELIMITER ;
