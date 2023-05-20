DELIMITER //

CREATE PROCEDURE EditarMesa(
    IN p_NumMesa INT,
    IN p_Capacidad INT,
    IN p_Disponible INT
)
BEGIN
    DECLARE num_rows INT;

    -- Validar si NumMesa existe
    SELECT COUNT(*) INTO num_rows FROM Mesas WHERE NumMesa = p_NumMesa;

    IF num_rows > 0 THEN
        -- Actualizar el registro existente
        UPDATE Mesas SET Capacidad = p_Capacidad, Disponible = p_Disponible WHERE NumMesa = p_NumMesa;
        
        SELECT 'Registro actualizado correctamente.' AS mensaje;
        COMMIT;
    ELSE
        SELECT 'No se encontró ningún registro con el NumMesa buscado.' AS mensaje;
    END IF;
END //

DELIMITER ;
