DELIMITER //

CREATE PROCEDURE MostrarProductosPorComida(
    IN p_Comida TINYINT
)
BEGIN
    IF p_Comida = 1 THEN
        SELECT idProducto, NombreProducto, Precio, Descripcion, Imagen
        FROM Productos
        WHERE Comida = 1;
    ELSEIF p_Comida = 0 THEN
        SELECT idProducto, NombreProducto, Precio, Descripcion, Imagen
        FROM Productos
        WHERE Comida = 0;
    END IF;
END //

DELIMITER ;
