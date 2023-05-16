DELIMITER //

CREATE PROCEDURE InsertarRepartidor (
    IN p_Nombre VARCHAR(100),
    IN p_ApellidoPaterno VARCHAR(100),
    IN p_ApellidoMaterno VARCHAR(100),
    IN p_Salario DECIMAL(10, 2),
    IN p_MatriculaVehiculo VARCHAR(20),
    IN p_idUsuario INT,
    OUT p_IdInsertado INT
)
BEGIN
    DECLARE v_Encontrado INT;

    SELECT idRepartidor INTO v_Encontrado FROM Repartidores WHERE Nombre = p_Nombre AND ApellidoPaterno = p_ApellidoPaterno AND ApellidoMaterno = p_ApellidoMaterno LIMIT 1;

    IF v_Encontrado IS NULL THEN
        INSERT INTO Repartidores (Nombre, ApellidoPaterno, ApellidoMaterno, Salario, MatriculaVehiculo, idUsuario)
        VALUES (p_Nombre, p_ApellidoPaterno, p_ApellidoMaterno, p_Salario, p_MatriculaVehiculo, p_idUsuario);
        SET p_IdInsertado = LAST_INSERT_ID();
    ELSE
        SET p_IdInsertado = v_Encontrado;
    END IF;
END //

DELIMITER ;
