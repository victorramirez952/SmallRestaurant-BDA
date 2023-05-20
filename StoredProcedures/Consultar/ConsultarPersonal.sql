DELIMITER //

CREATE PROCEDURE ConsultarPersonal()
BEGIN
   SELECT
        U.idUsuario,
        CASE
            WHEN C.idChef IS NOT NULL THEN C.Nombre
            WHEN R.idRepartidor IS NOT NULL THEN R.Nombre
            WHEN M.idMesero IS NOT NULL THEN M.Nombre
        END AS Nombre,
        CASE
            WHEN C.idChef IS NOT NULL THEN C.ApellidoPaterno
            WHEN R.idRepartidor IS NOT NULL THEN R.ApellidoPaterno
            WHEN M.idMesero IS NOT NULL THEN M.ApellidoPaterno
        END AS ApellidoPaterno,
        CASE
            WHEN C.idChef IS NOT NULL THEN C.ApellidoMaterno
            WHEN R.idRepartidor IS NOT NULL THEN R.ApellidoMaterno
            WHEN M.idMesero IS NOT NULL THEN M.ApellidoMaterno
        END AS ApellidoMaterno,
        CASE
            WHEN C.idChef IS NOT NULL THEN C.Salario
            WHEN R.idRepartidor IS NOT NULL THEN R.Salario
            WHEN M.idMesero IS NOT NULL THEN M.Salario
        END AS Salario,
        U.Correo,
        T.TipoUsuario
    FROM
        Usuarios U
        JOIN TipoUsuario T ON U.idTipoUsuario = T.idTipoUsuario
        LEFT JOIN Chefs C ON U.idUsuario = C.idUsuario
        LEFT JOIN Repartidores R ON U.idUsuario = R.idUsuario
        LEFT JOIN Meseros M ON U.idUsuario = M.idUsuario;
END //

DELIMITER ;
