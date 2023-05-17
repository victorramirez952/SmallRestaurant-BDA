DELIMITER //

CREATE PROCEDURE ConsultarMesa (
    IN p_NumMesa INT
)
BEGIN
    DECLARE mesa_encontrada INT;

    -- Verificar si la mesa existe
    SELECT COUNT(*) INTO mesa_encontrada
    FROM Mesas
    WHERE NumMesa = p_NumMesa;

    IF mesa_encontrada = 0 THEN
        SIGNAL SQLSTATE '45000' -- Error personalizado
            SET MESSAGE_TEXT = 'La mesa especificada no existe.';
    ELSE
        -- Consulta principal
        SELECT NumMesa, Capacidad, Disponible
        FROM Mesas
        WHERE NumMesa = p_NumMesa;
    END IF;
END //

DELIMITER ;
