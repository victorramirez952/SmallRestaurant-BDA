DELIMITER //

CREATE PROCEDURE InsertarPedido (
    IN p_idCliente INT,
    IN p_FechaPedido DATE,
    IN p_HoraPedido TIME,
    OUT p_IdInsertado INT
)
BEGIN
    DECLARE v_Encontrado INT;

    SELECT idPedido INTO v_Encontrado FROM Pedidos WHERE idCliente = p_idCliente AND FechaPedido = p_FechaPedido AND HoraPedido = p_HoraPedido LIMIT 1;

    IF v_Encontrado IS NULL THEN
        INSERT INTO Pedidos (idCliente, FechaPedido, HoraPedido)
        VALUES (p_idCliente, p_FechaPedido, p_HoraPedido);
        SET p_IdInsertado = LAST_INSERT_ID();
    ELSE
        SET p_IdInsertado = v_Encontrado;
    END IF;
END //

DELIMITER ;
