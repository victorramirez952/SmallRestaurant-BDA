DELIMITER //

CREATE PROCEDURE ObtenerMesasDisponibles(
    IN fecha_especifica DATE,
    IN hora_especifica TIME,
    IN nPersonas INT
)
BEGIN
    SELECT m.NumMesa, m.Capacidad
    FROM Mesas m
    WHERE m.Disponible = 1
        AND m.Capacidad >= nPersonas
        AND m.NumMesa NOT IN (
            SELECT rm.NumMesa
            FROM ReservasMesas rm
            INNER JOIN Reservaciones r ON rm.idReserva = r.idReserva
            INNER JOIN Horarios h ON r.idHorario = h.idHorario
            WHERE h.Fecha = fecha_especifica AND h.Hora = hora_especifica
        );
END //

DELIMITER ;
