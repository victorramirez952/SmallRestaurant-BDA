DELIMITER //

CREATE PROCEDURE RegistrarProductoCarrito(
    IN p_idUsuario INT,
    IN p_idProducto INT,
    IN p_Cantidad INT,
    IN p_Comentarios TEXT,
    OUT p_idDetalleCarrito INT
)
BEGIN
    DECLARE error_msg VARCHAR(255);
    DECLARE v_idCliente INT;
    DECLARE v_idCarrito INT;
    DECLARE v_idDetalleCarrito INT;
    DECLARE exit HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        GET DIAGNOSTICS CONDITION 1 error_msg = MESSAGE_TEXT;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_msg;
    END;

    START TRANSACTION;
    
    -- Obtener el idCliente a partir del idUsuario
    SELECT idCliente INTO v_idCliente FROM Clientes WHERE idUsuario = p_idUsuario LIMIT 1;
    
    -- Insertar el carrito si no existe
    CALL InsertarCarrito(v_idCliente, v_idCarrito);
    
    -- Insertar o obtener el detalle del carrito
    CALL InsertarDetalleCarrito(v_idCarrito, p_idProducto, p_Cantidad, p_Comentarios, v_idDetalleCarrito);

    -- Commit y asignar el idDetalleCarrito
    COMMIT;
    SET p_idDetalleCarrito = v_idDetalleCarrito;
END //

DELIMITER ;
