DELIMITER //

CREATE PROCEDURE InsertarProducto(
  IN p_NombreProducto VARCHAR(255),
  IN p_Comida TINYINT,
  IN p_Precio DECIMAL(10, 2),
  IN p_Descripcion TEXT,
  IN p_Imagen VARCHAR(255),
  OUT p_idProducto INT
)
BEGIN
  -- Verificar si el NombreProducto ya existe en la tabla Productos
  SELECT idProducto INTO p_idProducto
  FROM Productos
  WHERE NombreProducto = p_NombreProducto;

  IF p_idProducto IS NULL THEN
    -- El NombreProducto no existe, insertar un nuevo registro
    INSERT INTO Productos (NombreProducto, Comida, Precio, Descripcion, Imagen)
    VALUES (p_NombreProducto, p_Comida, p_Precio, p_Descripcion, p_Imagen);

    -- Obtener el id insertado
    SET p_idProducto = LAST_INSERT_ID();
  END IF;
END //

DELIMITER ;
