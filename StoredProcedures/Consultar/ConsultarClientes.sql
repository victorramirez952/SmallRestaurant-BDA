DELIMITER //

CREATE PROCEDURE ConsultarClientes ()
BEGIN
    SELECT c.idCliente, Nombre, ApellidoPaterno, ApellidoMaterno, u.correo, TelefonoContacto
    FROM Clientes as c inner join Usuarios as u;
END //

DELIMITER ;
