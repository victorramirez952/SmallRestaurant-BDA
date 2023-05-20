DELIMITER //

CREATE PROCEDURE EliminarProducto(
  IN p_idProducto INT
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
  FROM Productos
  WHERE idProducto = p_idProducto;

  IF @contador > 0 THEN
    -- Eliminar el registro
    DELETE FROM Productos
    WHERE idProducto = p_idProducto;
    COMMIT;
  ELSE
    -- Lanzar un error personalizado si el registro no existe
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El registro no existe en la tabla Productos.';
  END IF;

  COMMIT;
END //

DELIMITER ;
