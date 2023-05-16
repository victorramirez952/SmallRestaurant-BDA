DELIMITER //

CREATE PROCEDURE InsertarMetodoPago(
  IN p_MetodoPago VARCHAR(50),
  OUT p_idMetodoPago INT
)
BEGIN
  DECLARE v_idMetodoPago INT;

  -- Verificar si el Método de Pago ya existe
  SELECT idMetodoPago INTO v_idMetodoPago
  FROM MetodosPagos
  WHERE MetodoPago = p_MetodoPago;

  IF v_idMetodoPago IS NULL THEN
    -- El Método de Pago no existe, insertar un nuevo registro
    INSERT INTO MetodosPagos (MetodoPago)
    VALUES (p_MetodoPago);

    -- Obtener el idMetodoPago insertado
    SET p_idMetodoPago = LAST_INSERT_ID();
  ELSE
    -- El Método de Pago ya existe
    SET p_idMetodoPago = -1;
  END IF;
END //

DELIMITER ;
