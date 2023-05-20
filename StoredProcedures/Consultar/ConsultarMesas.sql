DELIMITER //

CREATE PROCEDURE ConsultarMesas ()
BEGIN
    SELECT NumMesa, Capacidad, Disponible
    FROM Mesas;
END //

DELIMITER ;
