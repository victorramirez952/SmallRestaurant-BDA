DELIMITER //

CREATE PROCEDURE ConsultarVentas ()
BEGIN
    SELECT NumTransaccion, MontoTotal, MetodoPago, idPedido
    FROM Pagos as P inner join metodosPagos as M on P.idMetodoPago = M.idMetodoPago;
END //

DELIMITER ;
