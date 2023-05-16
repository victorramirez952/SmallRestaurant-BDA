DELIMITER //

CREATE PROCEDURE InsertarDetalleCarrito(
  IN p_idCarrito INT,
  IN p_idProducto INT,
  IN p_Cantidad INT,
  IN p_Comentarios TEXT,
  OUT p_idDetalleCarrito INT
)
BEGIN
  -- Verificar si la tupla idCarrito, idProducto ya existe en la tabla DetallesCarritos
  IF NOT EXISTS (
    SELECT 1
    FROM DetallesCarritos
    WHERE idCarrito = p_idCarrito AND idProducto = p_idProducto
  ) THEN
    -- La tupla no existe, insertar un nuevo registro
    INSERT INTO DetallesCarritos (idCarrito, idProducto, Cantidad, Comentarios)
    VALUES (p_idCarrito, p_idProducto, p_Cantidad, p_Comentarios);
    
    -- Obtener el idDetalleCarrito insertado
    SET p_idDetalleCarrito = LAST_INSERT_ID();
  ELSE
    -- La tupla ya existe, obtener el idDetalleCarrito existente
    SELECT idDetalleCarrito INTO p_idDetalleCarrito
    FROM DetallesCarritos
    WHERE idCarrito = p_idCarrito AND idProducto = p_idProducto;
  END IF;
END //

DELIMITER ;
