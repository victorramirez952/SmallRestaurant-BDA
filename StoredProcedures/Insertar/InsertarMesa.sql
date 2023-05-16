DELIMITER //

CREATE PROCEDURE InsertarMesa (
    IN p_NumMesa INT,
    IN p_Capacidad INT,
    IN p_Disponible INT,
    OUT p_IdInsertado INT
)
BEGIN
    DECLARE v_Encontrado INT;

    SELECT NumMesa INTO v_Encontrado FROM Mesas WHERE NumMesa = p_NumMesa LIMIT 1;

    IF v_Encontrado IS NULL THEN
        INSERT INTO Mesas (Capacidad, Disponible) VALUES (p_Capacidad, p_Disponible);
        SET p_IdInsertado = LAST_INSERT_ID();
    ELSE
        SET p_IdInsertado = v_Encontrado;
    END IF;
END //

DELIMITER ;
