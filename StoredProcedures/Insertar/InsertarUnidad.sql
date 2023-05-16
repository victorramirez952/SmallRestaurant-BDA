DELIMITER //

CREATE PROCEDURE InsertarUnidad(
  IN p_TipoUnidad VARCHAR(50),
  OUT p_idUnidad INT
)
BEGIN
  -- Verificar si el TipoUnidad ya existe en la tabla Unidades
  SELECT idUnidad INTO p_idUnidad
  FROM Unidades
  WHERE TipoUnidad = p_TipoUnidad;

  IF p_idUnidad IS NULL THEN
    -- El TipoUnidad no existe, insertar un nuevo registro
    INSERT INTO Unidades (TipoUnidad)
    VALUES (p_TipoUnidad);

    -- Obtener el id insertado
    SET p_idUnidad = LAST_INSERT_ID();
  END IF;
END //

DELIMITER ;
