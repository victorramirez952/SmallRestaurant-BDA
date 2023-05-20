DELIMITER //

CREATE PROCEDURE RegistrarIngrediente(
    IN p_NombreIngrediente VARCHAR(100),
    IN p_StockIngrediente INT,
    IN p_TipoUnidad VARCHAR(50),
    OUT p_idIngrediente INT
)
BEGIN
    DECLARE p_idUnidad INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error en la transacción.';
    END;

    DECLARE EXIT HANDLER FOR NOT FOUND
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El TipoUnidad no existe.';
    END;

    START TRANSACTION;

    -- Insertar la unidad y obtener su id
    CALL InsertarUnidad(p_TipoUnidad, p_idUnidad);

    -- Insertar el ingrediente y obtener su id
    CALL InsertarIngrediente(p_NombreIngrediente, p_StockIngrediente, p_idUnidad, p_idIngrediente);

    COMMIT;
END //

DELIMITER ;
