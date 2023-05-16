DELIMITER //
-- No se ingrea la contraseña ya que eso se validará en la aplicación Flask
CREATE PROCEDURE IniciarSesion(
    IN _username VARCHAR(50)
)
BEGIN
    DECLARE varIdUsuario INT;
    DECLARE varCorreo VARCHAR(50);
    DECLARE varContrasenia VARCHAR(350);
    DECLARE varidTipoUsuario INT;

    -- Verificar si los datos de inicio de sesión son correctos
    SELECT idUsuario, Correo, Contrasenia, idTipoUsuario INTO varIdUsuario, varCorreo, varContrasenia, varidTipoUsuario
    FROM Usuarios
    WHERE Correo = _username;

    -- Retornar la tupla si los datos son correctos, o NULL si no son correctos
    IF varIdUsuario IS NOT NULL THEN
        SELECT varIdUsuario, varCorreo, varContrasenia, varidTipoUsuario;
    END IF;
END;//
DELIMITER ;