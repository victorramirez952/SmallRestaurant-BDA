DELIMITER //

CREATE PROCEDURE InsertarTipoUsuario (
    IN p_TipoUsuario VARCHAR(50),
    OUT p_IdInsertado INT
)
BEGIN
    DECLARE v_Encontrado INT;

    SELECT idTipoUsuario INTO v_Encontrado FROM TipoUsuario WHERE TipoUsuario = p_TipoUsuario LIMIT 1;

    IF v_Encontrado IS NULL THEN
        INSERT INTO TipoUsuario (TipoUsuario) VALUES (p_TipoUsuario);
        SET p_IdInsertado = LAST_INSERT_ID();
    ELSE
        SET p_IdInsertado = v_Encontrado;
    END IF;
END //

DELIMITER ;
