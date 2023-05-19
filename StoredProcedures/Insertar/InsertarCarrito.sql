DELIMITER //

CREATE PROCEDURE InsertarCarrito (
    IN p_idCliente INT,
    OUT p_IdInsertado INT
)
BEGIN
    DECLARE v_Encontrado INT;

    SELECT idCarrito INTO v_Encontrado FROM Carritos WHERE idCliente = p_idCliente LIMIT 1;

    IF v_Encontrado IS NULL THEN
        INSERT INTO Carritos (idCliente)
        VALUES (p_idCliente);   
        SET p_IdInsertado = LAST_INSERT_ID();
    ELSE
        SET p_IdInsertado = v_Encontrado;
    END IF;
END //

DELIMITER ;
