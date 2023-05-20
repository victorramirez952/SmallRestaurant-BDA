DELIMITER //

CREATE PROCEDURE EliminarMesa(
  IN p_NumMesa INT
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    RESIGNAL;
  END;

  START TRANSACTION;

  -- Verificar si el registro existe en la tabla DetallesCarritos
  SELECT COUNT(*) INTO @contador
  FROM Mesas
  WHERE numMesa = p_NumMesa;

  IF @contador > 0 THEN
    -- Eliminar el registro
    DELETE FROM Mesas
    WHERE numMesa = p_NumMesa;
    COMMIT;
  ELSE
    -- Lanzar un error personalizado si el registro no existe
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El registro no existe en la tabla Mesas.';
  END IF;

  COMMIT;
END //

DELIMITER ;
