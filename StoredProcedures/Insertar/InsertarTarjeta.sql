DELIMITER //

CREATE PROCEDURE InsertarTarjeta(
  IN p_NumeroTarjeta VARCHAR(16),
  IN p_FechaVencimiento DATE,
  IN p_Titular VARCHAR(255),
  OUT p_idTarjeta INT
)
BEGIN
  DECLARE v_idTarjeta INT;

  -- Verificar si el NumeroTarjeta ya existe
  SELECT idTarjeta INTO v_idTarjeta
  FROM Tarjetas
  WHERE NumeroTarjeta = p_NumeroTarjeta;

  IF v_idTarjeta IS NULL THEN
    -- El NumeroTarjeta no existe, insertar un nuevo registro
    INSERT INTO Tarjetas (NumeroTarjeta, FechaVencimiento, Titular)
    VALUES (p_NumeroTarjeta, p_FechaVencimiento, p_Titular);

    -- Obtener el idTarjeta insertado
    SET p_idTarjeta = LAST_INSERT_ID();
  ELSE
    -- El NumeroTarjeta ya existe
    SET p_idTarjeta = v_idTarjeta;
  END IF;
END //

DELIMITER ;
