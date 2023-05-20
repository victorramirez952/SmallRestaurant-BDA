DELIMITER //

CREATE PROCEDURE ConsultarProductosIngredientes (IN p_idProducto INT)
BEGIN
    SELECT A.idIngrediente, NombreIngrediente, ip.Cantidad, TipoUnidad
    FROM ingredientesProductos as ip inner join Ingredientes as A inner join Unidades as B on A.idUnidad = B.idUnidad
    where A.idIngrediente in (
        select idIngrediente
        from ingredientesproductos
        where idProducto = p_idProducto
    );
END //

DELIMITER ;
