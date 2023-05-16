DELIMITER //

CREATE PROCEDURE InsertarHorario (
    IN p_Fecha DATE,
    IN p_Hora TIME,
    OUT p_IdInsertado INT
)
BEGIN
    DECLARE v_Encontrado INT;

    SELECT idHorario INTO v_Encontrado FROM Horarios WHERE Fecha = p_Fecha AND Hora = p_Hora LIMIT 1;

    IF v_Encontrado IS NULL THEN
        INSERT INTO Horarios (Fecha, Hora) VALUES (p_Fecha, p_Hora);
        SET p_IdInsertado = LAST_INSERT_ID();
    ELSE
        SET p_IdInsertado = v_Encontrado;
    END IF;
END //

DELIMITER ;
