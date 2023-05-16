DELIMITER //

CREATE PROCEDURE InsertarPedidoEnLinea (
    IN p_idPedido INT,
    IN p_EstadoOrden INT
)
BEGIN
    DECLARE v_Encontrado INT;

    SELECT idPedido INTO v_Encontrado FROM PedidosEnLinea WHERE idPedido = p_idPedido LIMIT 1;

    IF v_Encontrado IS NULL THEN
        INSERT INTO PedidosEnLinea (idPedido, EstadoOrden)
        VALUES (p_idPedido, p_EstadoOrden);
        SELECT 'Registro insertado correctamente' AS Mensaje;
    ELSE
        SELECT 'No se pudo agregar el registro. El pedido ya existe' AS Mensaje;
    END IF;
END //

DELIMITER ;
