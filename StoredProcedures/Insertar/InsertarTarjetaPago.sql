DELIMITER //

CREATE PROCEDURE InsertarTarjetaPago(
  IN p_idTarjeta INT,
  IN p_NumTransaccion INT
)
BEGIN
  DECLARE v_idPago INT;

  -- Verificar si el NumTransaccion ya existe en la tabla Pagos
  SELECT NumTransaccion INTO v_idPago
  FROM Pagos
  WHERE NumTransaccion = p_NumTransaccion
  LIMIT 1;

  IF v_idPago IS NULL THEN
    -- El NumTransaccion no existe en la tabla Pagos, mostrar un mensaje de error
    SELECT 'No se pudo agregar el registro. NumTransaccion no existe en la tabla Pagos.' AS Mensaje;
  ELSE
    -- El NumTransaccion existe en la tabla Pagos, insertar el registro en TarjetasPagos
    INSERT INTO TarjetasPagos (idTarjeta, idPago)
    VALUES (p_idTarjeta, p_NumTransaccion);

    -- Mostrar mensaje de éxito
    SELECT 'Registro agregado correctamente.' AS Mensaje;
  END IF;
END //

DELIMITER ;
