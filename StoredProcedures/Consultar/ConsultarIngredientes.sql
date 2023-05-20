DELIMITER //

CREATE PROCEDURE ConsultarIngredientes ()
BEGIN
    SELECT idIngrediente, NombreIngrediente, StockIngrediente, TipoUnidad
    FROM Ingredientes as A inner join Unidades as B on A.idUnidad = B.idUnidad;
END //

DELIMITER ;
