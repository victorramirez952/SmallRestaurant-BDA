DELIMITER //

CREATE PROCEDURE EditarPedidoPresencial(
    IN p_idPedido INT,
    IN p_NumMesa INT,
    IN p_NuevoNumMesa INT
)
BEGIN
    DECLARE num_rows INT;

    -- Validar si idPedido-NumMesa existe
    SELECT COUNT(*) INTO num_rows FROM PedidosPresenciales WHERE idPedido = p_idPedido AND NumMesa = p_NumMesa;

    IF num_rows > 0 THEN
        -- Validar que la tupla idPedido-NuevoNumMesa no exista (excepto para idPedido-NumMesa)
        SELECT COUNT(*) INTO num_rows FROM PedidosPresenciales WHERE idPedido = p_idPedido AND NumMesa = p_NuevoNumMesa AND (NumMesa != p_NumMesa OR idPedido != p_idPedido);

        IF num_rows = 0 THEN
            -- Actualizar el registro existente
            UPDATE PedidosPresenciales SET NumMesa = p_NuevoNumMesa WHERE idPedido = p_idPedido AND NumMesa = p_NumMesa;
        ELSE
            SELECT 'La combinación de idPedido y NuevoNumMesa ya existe en otro pedido presencial.' AS mensaje;
        END IF;
    ELSE
        SELECT 'No se encontró ningún registro con el idPedido y NumMesa buscados.' AS mensaje;
    END IF;
END //

DELIMITER ;
