DELIMITER //

CREATE PROCEDURE InsertarReservaMesa (
    IN p_NumMesa INT,
    IN p_idReserva INT
)
BEGIN
    DECLARE v_Encontrado INT;

    SELECT NumMesa INTO v_Encontrado FROM ReservasMesas WHERE NumMesa = p_NumMesa AND idReserva = p_idReserva LIMIT 1;

    IF v_Encontrado IS NULL THEN
        INSERT INTO ReservasMesas (NumMesa, idReserva)
        VALUES (p_NumMesa, p_idReserva);
        COMMIT;
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pudo agregar el registro. La tupla NumMesa-idReserva ya existe';
    END IF;
END //

DELIMITER ;
