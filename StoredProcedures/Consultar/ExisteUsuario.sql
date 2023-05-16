DELIMITER //
CREATE PROCEDURE ExisteUsuario(
    IN _correo VARCHAR(100),
    OUT _existe INT
)
BEGIN
    DECLARE var_count INT;

    SELECT COUNT(*) INTO var_count
    FROM Usuarios
    WHERE Correo = _correo;

    IF var_count > 0 THEN
        SET _existe = 1;
    ELSE
        SET _existe = 0;
    END IF;
END//
DELIMITER ;