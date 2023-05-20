DELIMITER //

CREATE PROCEDURE ConsultarIdUsuarioFullname (
    IN p_nombre VARCHAR(50),
    IN p_apellidoPaterno VARCHAR(50),
    IN p_apellidoMaterno VARCHAR(50)
)
BEGIN
    SELECT idUsuario
    FROM Chefs
    WHERE Nombre = p_nombre AND ApellidoPaterno = p_apellidoPaterno AND ApellidoMaterno = p_apellidoMaterno
    UNION
    SELECT idUsuario
    FROM Repartidores
    WHERE Nombre = p_nombre AND ApellidoPaterno = p_apellidoPaterno AND ApellidoMaterno = p_apellidoMaterno
    UNION
    SELECT idUsuario
    FROM Meseros
    WHERE Nombre = p_nombre AND ApellidoPaterno = p_apellidoPaterno AND ApellidoMaterno = p_apellidoMaterno;

END //

DELIMITER ;
