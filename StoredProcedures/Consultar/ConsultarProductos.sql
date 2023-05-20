DELIMITER //

CREATE PROCEDURE ConsultarProductos ()
BEGIN
    SELECT idProducto, NombreProducto, Comida, Precio, Descripcion, Imagen
    FROM Productos;
END //

DELIMITER ;
