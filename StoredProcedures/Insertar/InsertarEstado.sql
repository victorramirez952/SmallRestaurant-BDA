DELIMITER //

CREATE PROCEDURE InsertarEstado(
    IN p_Estado VARCHAR(50),
    OUT p_idEstado INT
)
BEGIN
    DECLARE estadoExistente INT;

    -- Verificar si el estado ya existe en la tabla Estados
    SELECT idEstado INTO estadoExistente
    FROM Estados
    WHERE Estado = p_Estado
    LIMIT 1;

    -- Si el estado no existe, insertarlo en la tabla Estados
    IF estadoExistente IS NULL THEN
        INSERT INTO Estados (Estado)
        VALUES (p_Estado);
        SET p_idEstado = LAST_INSERT_ID();
    ELSE
        SET p_idEstado = estadoExistente;
    END IF;
END //

DELIMITER ;
