DELIMITER //

CREATE PROCEDURE InsertarPedido (
  IN p_idCliente INT,
  IN p_FechaPedido DATE,
  IN p_HoraPedido TIME,
  OUT p_IdInsertado INT
)
BEGIN
  DECLARE v_Encontrado INT;
  
  -- Verificar si el idPedido existe
  SELECT idPedido INTO v_Encontrado
  FROM Pedidos
  WHERE idCliente = p_idCliente
    AND FechaPedido = p_FechaPedido
    AND HoraPedido = p_HoraPedido
  LIMIT 1;
  
  IF v_Encontrado IS NOT NULL THEN
    -- El idPedido ya existe, arrojar un error mediante SIGNAL
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se pudo agregar el registro. El pedido ya existe.';
  ELSE
    -- El idPedido no existe, insertar un nuevo registro
    INSERT INTO Pedidos (idCliente, FechaPedido, HoraPedido)
    VALUES (p_idCliente, p_FechaPedido, p_HoraPedido);
    
    SET p_IdInsertado = LAST_INSERT_ID();
  END IF;
  
END //

DELIMITER ;
