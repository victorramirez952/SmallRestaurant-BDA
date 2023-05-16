DELIMITER //
CREATE PROCEDURE registrarPagoTarjeta( IN NumTa varchar(16), IN FechaV DATE, 
     IN Titu VARCHAR (255), IN MontoT DECIMAL(10,2), IN idMP INT, IN idP INT)
     BEGIN
     IF ( NumTa is NULL OR NumTa = ' ' ) THEN
        SELECT 'El numero de tarjeta no puede estar vacio';
    ELSEIF (FechaV IS NULL OR FechaV = ' ') THEN
        SELECT 'La fecha de vencimiento no puede estar vacia';
    ELSEIF (Titu IS NULL OR Titu = ' ') THEN
        SELECT 'El nombre del titular no puede estar vacio';
    ELSEIF (MontoT IS NULL OR MontoT = ' ') THEN
        SELECT 'El monto total no puede estar vacio';
    ELSEIF (idMP IS NULL OR idMP = ' ') THEN
        SELECT 'El ID del metodo de pago no puede estar vacio';
    ELSEIF (idP IS NULL OR idP = ' ') THEN 
        SELECT 'El ID del pedido no puede estar vacio';
    ELSEIF (SELECT EXISTS (
            SELECT 1 FROM Tarjetas WHERE NumeroTarjeta = NumTa AND FechaV = FechaVencimiento AND Titu = Titular)
        ) THEN 
        SELECT 'La informacion de la tarjeta es incorrecta';
    ELSEIF (
        SELECT NOT EXISTS (
            SELECT 1 FROM Tarjetas WHERE NumeroTarjeta = NumTa)
        ) THEN 
            INSERT INTO Tarjetas ( NumeroTarjeta, FechaVencimiento, Titular) VALUES ( NumTa, FechaV, Titu);
            INSERT INTO Pagos (MontoTotal, idMetodoPago, idPedido) VALUES (MontoT, idMP, idP);
            INSERT INTO TarjetasPagos ( idTarjeta, idPago) VALUES ((SELECT idTarjeta AS id FROM Tarjetas WHERE NumeroTarjeta = NumTa), (SELECT MAX(NumTransaccion) AS Num FROM Pagos));
    ELSE 
        INSERT INTO Pagos (MontoTotal, idMetodoPago, idPedido) VALUES (MontoT, idMP, idP);
        INSERT INTO TarjetasPagos ( idTarjeta, idPago) VALUES ((SELECT idTarjeta AS id FROM Tarjetas WHERE NumeroTarjeta = NumTa), (SELECT MAX(NumTransaccion) AS Num FROM Pagos));
    END IF;
    END //
DELIMITER ;