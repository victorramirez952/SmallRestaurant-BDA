DELIMITER //

CREATE PROCEDURE EliminarProductoCarrito(
  IN p_idDetalleCarrito INT,
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
  SELECT COUNT(*) INTO @recordCount
  FROM DetallesCarritos
  WHERE idDetalleCarrito = p_idDetalleCarrito AND idProducto = p_idProducto;

  IF @recordCount > 0 THEN
    -- Eliminar el registro
    DELETE FROM DetallesCarritos
    WHERE idDetalleCarrito = p_idDetalleCarrito AND idProducto = p_idProducto;
  ELSE
    -- Lanzar un error personalizado si el registro no existe
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El registro no existe en la tabla DetallesCarritos.';
  END IF;

  COMMIT;
END //

DELIMITER ;
