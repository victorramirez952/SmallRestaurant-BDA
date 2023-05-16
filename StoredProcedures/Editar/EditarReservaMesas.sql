DELIMITER //

CREATE PROCEDURE EditarMesaReserva(
    IN p_NumMesa INT,
    IN p_idReserva INT,
    IN p_NuevoNumMesa INT
)
BEGIN
    DECLARE num_rows INT;

    -- Validar si NumMesa-idReserva existe
    SELECT COUNT(*) INTO num_rows FROM ReservasMesas WHERE NumMesa = p_NumMesa AND idReserva = p_idReserva;

    IF num_rows > 0 THEN
        -- Validar que la tupla NuevoNumMesa-idReserva no exista (excepto para NumMesa-idReserva)
        SELECT COUNT(*) INTO num_rows FROM ReservasMesas WHERE NumMesa = p_NuevoNumMesa AND idReserva = p_idReserva AND (NumMesa != p_NumMesa OR idReserva != p_idReserva);

        IF num_rows = 0 THEN
            -- Actualizar el registro existente
            UPDATE ReservasMesas SET NumMesa = p_NuevoNumMesa WHERE NumMesa = p_NumMesa AND idReserva = p_idReserva;
            
            SELECT 'Registro actualizado correctamente.' AS mensaje;
        ELSE
            SELECT 'La combinación de NuevoNumMesa y idReserva ya existe en otra reserva de mesa.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el NumMesa e idReserva buscados.' AS mensaje;
    END IF;
END //

DELIMITER ;
