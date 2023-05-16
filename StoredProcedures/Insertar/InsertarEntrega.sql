DELIMITER //

CREATE PROCEDURE InsertarEntrega (
    IN p_EstadoEntrega VARCHAR(50),
    IN p_idPedido INT,
    OUT p_IdInsertado INT
)
BEGIN
    DECLARE v_Encontrado INT;

    SELECT idEntrega INTO v_Encontrado FROM Entregas WHERE idPedido = p_idPedido LIMIT 1;

    IF v_Encontrado IS NULL THEN
        INSERT INTO Entregas (EstadoEntrega, idPedido)
        VALUES (p_EstadoEntrega, p_idPedido);
        SET p_IdInsertado = LAST_INSERT_ID();
    ELSE
        SET p_IdInsertado = v_Encontrado;
    END IF;
END //

DELIMITER ;
