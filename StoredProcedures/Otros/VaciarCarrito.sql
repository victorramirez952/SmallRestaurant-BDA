DELIMITER //

CREATE PROCEDURE VaciarCarrito(IN p_idCarrito INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Error: Ha ocurrido un problema durante la transacción.';
    END;

    START TRANSACTION;
    
    DELETE FROM DetallesCarritos WHERE idCarrito = p_idCarrito;
    
    COMMIT;
    
    SELECT 'El carrito ha sido vaciado exitosamente.';
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE VaciarCarritoSinCommit(IN p_idCarrito INT)
BEGIN
    DECLARE v_Encontrado INT;

    -- Verificar si el idCarrito existe
    SELECT COUNT(*) INTO v_Encontrado FROM Carritos WHERE idCarrito = p_idCarrito;
    
    IF v_Encontrado = 0 THEN
        -- El idCarrito no se encuentra, arrojar un error mediante SIGNAL
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pudo encontrar el carrito especificado.';
    ELSE
        -- El idCarrito existe, realizar la eliminación de los detalles del carrito
        DELETE FROM DetallesCarritos WHERE idCarrito = p_idCarrito;
    END IF;
END //

DELIMITER ;
