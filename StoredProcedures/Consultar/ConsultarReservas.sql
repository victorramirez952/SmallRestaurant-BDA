DELIMITER //

CREATE PROCEDURE ConsultarReservas ()
BEGIN
    SELECT idReserva, CantidadPersonas, Comentarios, Fecha, Hora
    FROM Reservaciones as A inner join Horarios as B on A.idHorario = B.idHorario;
END //

DELIMITER ;
