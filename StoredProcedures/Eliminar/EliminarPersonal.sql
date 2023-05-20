DELIMITER //

CREATE PROCEDURE EliminarPersonal(
  IN p_idUsuario INT
)
BEGIN
  DECLARE rowCount INT;
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    RESIGNAL;
  END;

  START TRANSACTION;

  -- Verificar si el registro existe en la tabla DetallesCarritos
  SELECT COUNT(*) INTO @contador
  FROM Usuarios
  WHERE idUsuario = p_idUsuario;

  IF @contador > 0 THEN
    -- Eliminar el registro
    DELETE FROM Usuarios
    WHERE idUsuario = p_idUsuario;
    DELETE FROM Clientes
    WHERE idUsuario = p_idUsuario;
    
    SET rowCount = ROW_COUNT();
    
    -- Si no se eliminó en Clientes, intentar eliminar en Repartidores
    IF rowCount = 0 THEN
        DELETE FROM Repartidores
        WHERE idUsuario = p_idUsuario;
        
        SET rowCount = ROW_COUNT();
        
        -- Si no se eliminó en Repartidores, intentar eliminar en Chefs
        IF rowCount = 0 THEN
            DELETE FROM Chefs
            WHERE idUsuario = p_idUsuario;
        END IF;
    END IF;
    
    SELECT rowCount AS registrosEliminados;
    COMMIT;
  ELSE
    -- Lanzar un error personalizado si el registro no existe
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El registro no existe en la tabla Usuarios.';
  END IF;

  COMMIT;
END //

DELIMITER ;
