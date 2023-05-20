DELIMITER //

CREATE PROCEDURE ConsultarIdUsuarioIdCliente (IN p_idCliente INT)
BEGIN
    SELECT idUsuario
    FROM Clientes
    WHERE idCliente = p_idCliente;
END //

DELIMITER ;
