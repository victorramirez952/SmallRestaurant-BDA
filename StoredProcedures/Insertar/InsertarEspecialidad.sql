DELIMITER //

CREATE PROCEDURE InsertarEspecialidad (
    IN p_Especialidad VARCHAR(100),
    OUT p_IdInsertado INT
)
BEGIN
    DECLARE v_Encontrado INT;

    SELECT idEspecialidad INTO v_Encontrado FROM Especialidades WHERE Especialidad = p_Especialidad LIMIT 1;

    IF v_Encontrado IS NULL THEN
        INSERT INTO Especialidades (Especialidad) VALUES (p_Especialidad);
        SET p_IdInsertado = LAST_INSERT_ID();
    ELSE
        SET p_IdInsertado = v_Encontrado;
    END IF;
END //

DELIMITER ;
