DELIMITER //

CREATE PROCEDURE LeerProductosCarrito(
    IN p_idCliente INT
)
BEGIN
    SELECT P.idProducto, P.NombreProducto, P.Precio, P.Imagen, DC.Cantidad, DC.Comentarios
    FROM Carritos AS C
    INNER JOIN DetallesCarritos AS DC ON C.idCarrito = DC.idCarrito
    INNER JOIN Productos AS P ON DC.idProducto = P.idProducto
    WHERE C.idCliente = p_idCliente;
END //

DELIMITER ;
