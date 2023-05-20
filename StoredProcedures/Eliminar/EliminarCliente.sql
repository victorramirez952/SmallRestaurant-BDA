DELIMITER //

CREATE PROCEDURE EliminarCliente(
  IN p_idCliente INT,
  IN p_idUsuario INT
)
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    RESIGNAL;
  END;

  START TRANSACTION;

  -- Verificar si el registro existe en la tabla DetallesCarritos
  SELECT COUNT(*) INTO @contador
  FROM Clientes
  WHERE idCliente = p_idCliente AND idUsuario = p_idUsuario;

  IF @contador > 0 THEN
    -- Eliminar el registro
    DELETE FROM Usuarios
    WHERE idUsuario = p_idUsuario;
    DELETE FROM Clientes
    WHERE idCliente = p_idCliente;
    COMMIT;
  ELSE
    -- Lanzar un error personalizado si el registro no existe
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El registro no existe en la tabla Clientes.';
  END IF;

  COMMIT;
END //

DELIMITER ;
