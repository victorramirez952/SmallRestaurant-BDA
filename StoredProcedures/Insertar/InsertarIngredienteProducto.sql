DELIMITER //

CREATE PROCEDURE InsertarIngredienteProducto(
  IN p_idProducto INT,
  IN p_idIngrediente INT,
  IN p_Cantidad DECIMAL(5, 3)
)
BEGIN
  -- Verificar si la tupla idProducto, idIngrediente ya existe en la tabla IngredientesProductos
  IF NOT EXISTS (
    SELECT 1
    FROM IngredientesProductos
    WHERE idProducto = p_idProducto AND idIngrediente = p_idIngrediente
  ) THEN
    -- La tupla no existe, insertar un nuevo registro
    INSERT INTO IngredientesProductos (idProducto, idIngrediente, Cantidad)
    VALUES (p_idProducto, p_idIngrediente, p_Cantidad);
  ELSE
    -- La tupla ya existe, mostrar un mensaje de error
    SELECT 'No se pudo agregar el registro. La tupla idProducto, idIngrediente ya existe.';
  END IF;
END //

DELIMITER ;
