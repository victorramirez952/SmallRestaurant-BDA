DELIMITER //

CREATE PROCEDURE CalcularMontoTotal(IN _idUsuario INT)
BEGIN
    DECLARE _idCliente INT;
    DECLARE _idCarrito INT;
    DECLARE _montoTotal DECIMAL(10, 2);
    
    -- Verificar si el usuario existe
    IF NOT EXISTS(SELECT 1 FROM Usuarios WHERE idUsuario = _idUsuario) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El usuario no existe.';
    END IF;
    
    -- Obtener el idCliente a partir del idUsuario
    SELECT idCliente INTO _idCliente FROM Clientes WHERE idUsuario = _idUsuario;

    -- Obtener el idCarrito a partir del idUsuario
    SELECT idCarrito INTO _idCarrito FROM Carritos WHERE idCliente = _idCliente;
    
    -- Verificar si el cliente tiene un carrito asociado
    IF _idCarrito IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El cliente no tiene un carrito asociado.';
    END IF;
    
    -- Calcular el monto total del carrito
    SELECT SUM(p.Precio * dc.Cantidad) INTO _montoTotal
    FROM DetallesCarritos dc
    INNER JOIN Productos p ON dc.idProducto = p.idProducto
    WHERE dc.idCarrito = _idCarrito;
    
    -- Retornar el monto total
    SELECT _montoTotal AS MontoTotal;
END //

DELIMITER ;
