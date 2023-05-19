DELIMITER //

CREATE PROCEDURE EditarCantidadProductoCarrito(
  IN p_idDetalleCarrito INT,
  IN p_Cantidad INT,
  IN p_Suma INT
)
BEGIN
  DECLARE v_CantidadExistente INT;
  
  -- Obtener la cantidad existente del producto en el carrito
  SELECT Cantidad INTO v_CantidadExistente
  FROM DetallesCarritos
  WHERE idDetalleCarrito = p_idDetalleCarrito;
  
  -- Verificar si la operación es de suma
  IF p_Suma = 1 THEN
    -- Sumar la cantidad recibida a la cantidad existente
    UPDATE DetallesCarritos
    SET Cantidad = Cantidad + p_Cantidad
    WHERE idDetalleCarrito = p_idDetalleCarrito;
    COMMIT;
  ELSE
    -- Verificar que la operación de resta no resulte en una cantidad menor a 0
    IF v_CantidadExistente - p_Cantidad > 0 THEN
      -- Restar la cantidad recibida a la cantidad existente
      UPDATE DetallesCarritos
      SET Cantidad = Cantidad - p_Cantidad
      WHERE idDetalleCarrito = p_idDetalleCarrito;
      COMMIT;
    ELSE
      -- La operación resultaría en una cantidad menor a 0, no se realiza la resta
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La operación de resta resultaría en una cantidad menor o igual a 0.';
    END IF;
  END IF;
END //

DELIMITER ;
