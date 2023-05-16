DELIMITER //

CREATE PROCEDURE EliminarProductoCarrito(
  IN p_idCliente INT,
  IN p_idProducto INT
)
BEGIN
  DELETE FROM DetallesCarritos
  WHERE idCarrito IN (
    SELECT idCarrito
    FROM Carritos
    WHERE idCliente = p_idCliente
  ) AND idProducto = p_idProducto;

  SELECT 'El producto ha sido eliminado del carrito.' AS mensaje;
END //

DELIMITER ;
