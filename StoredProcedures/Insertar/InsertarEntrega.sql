DELIMITER //

CREATE PROCEDURE InsertarEntrega(
  IN p_idPedido INT,
  IN p_EstadoEntrega VARCHAR(50),
  OUT p_IdInsertado INT
)
BEGIN
  DECLARE v_Encontrado INT;

  -- Verificar si el idEntrega existe
  SELECT idEntrega INTO v_Encontrado
  FROM Entregas
  WHERE idPedido = p_idPedido
  LIMIT 1;

  IF v_Encontrado IS NOT NULL THEN
    -- El idEntrega ya existe, arrojar un error mediante SIGNAL
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pudo agregar el registro. La entrega ya existe.';
  ELSE
    -- El idEntrega no existe, insertar un nuevo registro
    INSERT INTO Entregas (EstadoEntrega, idPedido)
    VALUES (p_EstadoEntrega, p_idPedido);

    SET p_IdInsertado = LAST_INSERT_ID();
  END IF;
END //

DELIMITER ;
