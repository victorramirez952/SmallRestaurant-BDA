DELIMITER //

CREATE PROCEDURE InsertarProductoPedido(
  IN p_idPedido INT,
  IN p_idProducto INT,
  IN p_CantidadProducto INT,
  IN p_Comentarios TEXT
)
BEGIN
  -- Verificar si la tupla idPedido, idProducto ya existe en la tabla ProductosPedidos
  IF NOT EXISTS (
    SELECT 1
    FROM ProductosPedidos
    WHERE idPedido = p_idPedido AND idProducto = p_idProducto
  ) THEN
    -- La tupla no existe, insertar un nuevo registro
    INSERT INTO ProductosPedidos (idPedido, idProducto, CantidadProducto, Comentarios)
    VALUES (p_idPedido, p_idProducto, p_CantidadProducto, p_Comentarios);
  ELSE
    -- La tupla ya existe, mostrar un mensaje de error
    SELECT 'No se pudo agregar el registro. La tupla idPedido, idProducto ya existe.';
  END IF;
END //

DELIMITER ;
