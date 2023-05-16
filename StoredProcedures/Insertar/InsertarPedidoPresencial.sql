DELIMITER //

CREATE PROCEDURE InsertarPedidoPresencial (
    IN p_idPedido INT,
    IN p_NumMesa INT
)
BEGIN
    DECLARE v_Encontrado INT;

    SELECT COUNT(*) INTO v_Encontrado FROM PedidosPresenciales WHERE idPedido = p_idPedido AND NumMesa = p_NumMesa;

    IF v_Encontrado = 0 THEN
        INSERT INTO PedidosPresenciales (idPedido, NumMesa) VALUES (p_idPedido, p_NumMesa);
        SELECT 'Registro agregado' AS Mensaje;
    ELSE
        SELECT 'No se pudo agregar el registro. La tupla idPedido-NumMesa ya existe.' AS Mensaje;
    END IF;
END //

DELIMITER ;
