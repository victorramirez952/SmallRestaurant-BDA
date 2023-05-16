DELIMITER //

CREATE PROCEDURE InsertarPedidoRepartidor (
    IN p_idPedido INT,
    IN p_idRepartidor INT
)
BEGIN
    DECLARE v_Encontrado INT;

    SELECT idPedido INTO v_Encontrado FROM PedidosRepartidores WHERE idPedido = p_idPedido LIMIT 1;

    IF v_Encontrado IS NULL THEN
        INSERT INTO PedidosRepartidores (idPedido, idRepartidor)
        VALUES (p_idPedido, p_idRepartidor);
        SELECT 'Registro insertado correctamente.';
    ELSE
        SELECT 'No se pudo agregar el registro. La tupla idPedido ya existe.';
    END IF;
END //

DELIMITER ;
