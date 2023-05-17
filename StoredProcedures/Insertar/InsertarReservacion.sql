DELIMITER //

CREATE PROCEDURE InsertarReservacion (
    IN p_CantidadPersonas INT,
    IN p_Comentarios TEXT,
    IN p_idHorario INT,
    IN p_idCliente INT,
    IN p_Confirmada BOOLEAN,
    OUT p_IdInsertado INT
)
BEGIN
    DECLARE v_Encontrado INT;

    SELECT idReserva INTO v_Encontrado FROM Reservaciones WHERE idHorario = p_idHorario AND idCliente = p_idCliente LIMIT 1;

    IF v_Encontrado IS NULL THEN
        INSERT INTO Reservaciones (CantidadPersonas, Comentarios, idHorario, idCliente, Confirmada)
        VALUES (p_CantidadPersonas, p_Comentarios, p_idHorario, p_idCliente, p_Confirmada);
        SET p_IdInsertado = LAST_INSERT_ID();
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya tiene una reserva para ese horario';
    END IF;
END //

DELIMITER ;
