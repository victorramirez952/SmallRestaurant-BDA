DELIMITER //

CREATE PROCEDURE EliminarIngrediente(
  IN p_idIngrediente INT
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
  FROM Ingredientes
  WHERE idIngrediente = p_idIngrediente;

  IF @contador > 0 THEN
    -- Eliminar el registro
    DELETE FROM Ingredientes
    WHERE idIngrediente = p_idIngrediente;
    COMMIT;
  ELSE
    -- Lanzar un error personalizado si el registro no existe
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El registro no existe en la tabla Ingredientes.';
  END IF;

  COMMIT;
END //

DELIMITER ;
