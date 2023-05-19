DELIMITER //

CREATE PROCEDURE RegistrarPagoTarjeta(
  IN idPedido INT,
  IN idMetodoPago INT,
  IN NumeroTarjeta VARCHAR(16),
  IN FechaVencimiento DATE,
  IN Titular VARCHAR(255),
  OUT NumTransaccion INT
)
BEGIN
  DECLARE montoTotal DECIMAL(10, 2);
  DECLARE idTarjeta INT;

  -- Iniciar transacción
  -- START TRANSACTION;

  -- Llamar al Stored Procedure ConsultarMontoPedido
  CALL CalcularMontoPedido(idPedido, montoTotal);

  -- Llamar al Stored Procedure InsertarPago
  CALL InsertarPago(montoTotal, idMetodoPago, idPedido, NumTransaccion);

  -- Llamar al Stored Procedure InsertarTarjeta
  CALL InsertarTarjeta(NumeroTarjeta, FechaVencimiento, Titular, idTarjeta);

  -- Llamar al Stored Procedure InsertarTarjetaPago
  CALL InsertarTarjetaPago(idTarjeta, NumTransaccion);

  -- Completar la transacción
  -- COMMIT;
END //

DELIMITER ;
