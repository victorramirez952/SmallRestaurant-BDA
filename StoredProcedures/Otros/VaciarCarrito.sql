DELIMITER //

CREATE PROCEDURE VaciarCarrito(
    IN p_idCliente INT,
    IN p_idCarrito INT
)
BEGIN
    -- Eliminar los registros de DetallesCarritos relacionados con el idCarrito
    DELETE FROM DetallesCarritos WHERE idCarrito = p_idCarrito;
    
    SELECT 'El carrito ha sido vaciado exitosamente' AS Mensaje;
END //

DELIMITER ;
