CREATE  PROCEDURE InsertarProductoPedido(
  IN p_idPedido INT,
  IN p_idProducto INT,
  IN p_CantidadProducto INT,
  IN p_Comentarios TEXT
)
BEGIN

IF NOT EXISTS (
    SELECT 1
        FROM ProductosPedidos
        WHERE idPedido = p_idPedido AND idProducto = p_idProducto
    ) THEN
    INSERT INTO ProductosPedidos (idPedido, idProducto, CantidadProducto, Comentarios)
    VALUES (p_idPedido, p_idProducto, p_CantidadProducto, p_Comentarios);
ELSE

    SELECT 'No se pudo agregar el registro. La tupla idPedido, idProducto ya existe.';
END IF;