DELIMITER //

CREATE PROCEDURE RegistrarReservacion (
    IN p_idCliente INT,
    IN p_Fecha DATE,
    IN p_Hora TIME,
    IN p_CantidadPersonas INT,
    IN p_Comentarios TEXT,
    IN p_Confirmada BOOLEAN,
    OUT p_idReserva INT
)
BEGIN
    DECLARE p_idHorario INT;
    DECLARE error_msg VARCHAR(255);
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        GET DIAGNOSTICS CONDITION 1 error_msg = MESSAGE_TEXT;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_msg;
    END;
    
    START TRANSACTION;
    
    -- Insertar el horario y obtener el idHorario
    CALL InsertarHorario(p_Fecha, p_Hora, @p_idHorario);
    SET p_idHorario = @p_idHorario;
    
    -- Insertar la reservación y obtener el idReserva
    CALL InsertarReservacion(p_CantidadPersonas, p_Comentarios, p_idHorario, p_idCliente, p_Confirmada, @p_idReserva);
    SET p_idReserva = @p_idReserva;
    SELECT p_idReserva as p_idReserva;
    
    COMMIT;
END //

DELIMITER ;
