DELIMITER //

CREATE PROCEDURE InsertarIngrediente(
  IN p_NombreIngrediente VARCHAR(100),
  IN p_StockIngrediente INT,
  IN p_idUnidad INT,
  OUT p_idIngrediente INT
)
BEGIN
  -- Verificar si el NombreIngrediente ya existe en la tabla Ingredientes
  SELECT idIngrediente INTO p_idIngrediente
  FROM Ingredientes
  WHERE NombreIngrediente = p_NombreIngrediente;

  IF p_idIngrediente IS NULL THEN
    -- El NombreIngrediente no existe, insertar un nuevo registro
    INSERT INTO Ingredientes (NombreIngrediente, StockIngrediente, idUnidad)
    VALUES (p_NombreIngrediente, p_StockIngrediente, p_idUnidad);

    -- Obtener el id insertado
    SET p_idIngrediente = LAST_INSERT_ID();
  END IF;
END //

DELIMITER ;
