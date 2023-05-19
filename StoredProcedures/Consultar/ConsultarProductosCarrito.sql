DELIMITER //

CREATE PROCEDURE ConsultarProductosCarrito(IN _idUsuario INT)
BEGIN
    DECLARE _idCliente INT;
    DECLARE _idCarrito INT;
    
    -- Verificar si el usuario existe
    IF NOT EXISTS(SELECT 1 FROM Usuarios WHERE idUsuario = _idUsuario) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El usuario no existe.';
    END IF;
    
    -- Obtener el idCliente a partir del idUsuario
    SELECT idCliente INTO _idCliente FROM Clientes WHERE idUsuario = _idUsuario;
    
    -- Verificar si el cliente existe y tiene un carrito asociado
    IF _idCliente IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El cliente no existe.';
    ELSE
        SELECT idCarrito INTO _idCarrito FROM Carritos WHERE idCliente = _idCliente;
        
        IF _idCarrito IS NULL THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'El cliente no tiene un carrito asociado.';
        ELSE
            -- Consultar los productos del carrito
            SELECT dc.idDetalleCarrito, dc.idCarrito, dc.idProducto, dc.Cantidad, dc.Comentarios, p.NombreProducto, p.Precio, p.Imagen
            FROM DetallesCarritos dc
            INNER JOIN Productos p ON dc.idProducto = p.idProducto
            WHERE dc.idCarrito = _idCarrito;
        END IF;
    END IF;
END //

DELIMITER ;
