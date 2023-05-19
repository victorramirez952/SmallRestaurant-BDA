DELIMITER //
CREATE PROCEDURE InsertarProductoPedido(
  IN p_idPedido INT,
  IN p_idProducto INT,
  IN p_CantidadProducto INT,
  IN p_Comentarios TEXT
)
BEGIN
  IF EXISTS (
    SELECT 1
    FROM ProductosPedidos
    WHERE idPedido = p_idPedido AND idProducto = p_idProducto
  ) THEN
    -- La tupla idPedido-idProducto ya existe, arrojar un error mediante SIGNAL
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pudo agregar el registro. La tupla idPedido-idProducto ya existe.';
  ELSE
    -- La tupla idPedido-idProducto no existe, insertar un nuevo registro
    INSERT INTO ProductosPedidos (idPedido, idProducto, CantidadProducto, Comentarios)
    VALUES (p_idPedido, p_idProducto, p_CantidadProducto, p_Comentarios);
  END IF;
END;//
DELIMITER ;