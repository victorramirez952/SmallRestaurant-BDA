DELIMITER //

CREATE PROCEDURE ConsultarCliente (IN p_idUsuario INT)
BEGIN
    SELECT c.idCliente, c.Nombre, c.ApellidoPaterno, c.ApellidoMaterno, c.TelefonoContacto
    FROM Clientes c
    WHERE c.idUsuario = p_idUsuario;
END //

DELIMITER ;
