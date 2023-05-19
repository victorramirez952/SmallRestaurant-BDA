DELIMITER //

CREATE PROCEDURE ConsultarPedidosEnProceso(IN p_idUsuario INT)
BEGIN
    DECLARE v_idCliente INT;
    DECLARE v_idPedido INT;
    DECLARE v_fechaPedido DATE;
    DECLARE v_EstadoEntrega VARCHAR(50);
    
    -- Obtener el idCliente a partir del idUsuario
    SELECT idCliente INTO v_idCliente FROM Clientes WHERE idUsuario = p_idUsuario;
    
    -- Verificar si se encontró el idCliente
    IF v_idCliente IS NULL THEN
        -- No se encontró el idCliente, arrojar un error mediante SIGNAL
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se encontró el cliente asociado al usuario.';
    ELSE
        -- Obtener los datos de los pedidos en proceso
        SELECT p.idPedido, p.FechaPedido, p.HoraPedido, e.EstadoEntrega
        FROM Pedidos p
        INNER JOIN Entregas e ON p.idPedido = e.idPedido
        WHERE p.idCliente = v_idCliente AND e.EstadoEntrega = 'En camino';
        
    END IF;
END //

DELIMITER ;
