DELIMITER //

CREATE PROCEDURE EditarProducto(
    IN p_idProducto INT,
    IN p_NombreProducto VARCHAR(255),
    IN p_Comida TINYINT,
    IN p_Precio DECIMAL(10, 2),
    IN p_Descripcion TEXT,
    IN p_Imagen VARCHAR(255)
)
BEGIN
    DECLARE num_rows INT;

    -- Validar si idProducto existe
    SELECT COUNT(*) INTO num_rows FROM Productos WHERE idProducto = p_idProducto;

    IF num_rows > 0 THEN
        -- Actualizar el registro existente
        UPDATE Productos SET
            NombreProducto = p_NombreProducto,
            Comida = p_Comida,
            Precio = p_Precio,
            Descripcion = p_Descripcion,
            Imagen = p_Imagen
        WHERE idProducto = p_idProducto;
    ELSE
        SELECT 'No se encontró ningún registro con el idProducto buscado.' AS mensaje;
    END IF;
END //

DELIMITER ;
