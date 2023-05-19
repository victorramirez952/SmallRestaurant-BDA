¿Puedes generar un StoredProcedures llamado RegistrarPedidoEnLinea?
- Parametros: idUsuario, FechaPedido, HoraPedido, idMetodoPago, NumeroTarjeta, FechaVencimiento, Titular
- Involucrará la llamada a otros SPs en el siguiente orden: InsertarPedido, InsertarPedidoEnLinea, InsertarEntrega, RegistrarProductosPedido, RegistrarPagoTarjeta
- Debe tener manejo de errores implementando una transacción
- Tiene que usar CALL y manejar OUT para todos los SPs internos
- No debe haber consultas Insert dentro de RegistrarPedidoEnLinea, eso ya lo tienen los SPs
- Debe retornar al final el idPedido registrado mediante un OUT
- Primero debe obtener el idCarrito a partir del idUsuario
- Luego debe obtener el idCliente a partir del idUsuario
- Luego debe llamar a InsertarPedido
- Luego debe llamar a InsertarPedidoEnLinea y colocar la columna "EstadoOrden" como "Preparando"
- Luego llamar InsertarEntrega y colocar la columna "EstadoEntrega" como "Preparando"
- Luego llamar RegistrarProductosPedido
- Luego llamar a InsertarPagoTarjeta
- Asegurate de usar: ROLLBACK; GET DIAGNOSTICS CONDITION 1 error_msg = MESSAGE_TEXT; SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = error_msg;

Stored Procedures:
DELIMITER // CREATE PROCEDURE InsertarPedido ( IN p_idCliente INT, IN p_FechaPedido DATE, IN p_HoraPedido TIME, OUT p_IdInsertado INT ) BEGIN DECLARE v_Encontrado INT; -- Verificar si el idPedido existe SELECT idPedido INTO v_Encontrado FROM Pedidos WHERE idCliente = p_idCliente AND FechaPedido = p_FechaPedido AND HoraPedido = p_HoraPedido LIMIT 1; IF v_Encontrado IS NOT NULL THEN -- El idPedido ya existe, arrojar un error mediante SIGNAL SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pudo agregar el registro. El pedido ya existe.'; ELSE -- El idPedido no existe, insertar un nuevo registro INSERT INTO Pedidos (idCliente, FechaPedido, HoraPedido) VALUES (p_idCliente, p_FechaPedido, p_HoraPedido); SET p_IdInsertado = LAST_INSERT_ID(); END IF; END // DELIMITER ;

DELIMITER // CREATE PROCEDURE InsertarPedidoEnLinea( IN p_idPedido INT, IN p_EstadoOrden INT ) BEGIN DECLARE v_Encontrado INT; -- Verificar si el idPedido existe SELECT idPedido INTO v_Encontrado FROM PedidosEnLinea WHERE idPedido = p_idPedido LIMIT 1; IF v_Encontrado IS NOT NULL THEN -- El idPedido ya existe, arrojar un error mediante SIGNAL SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pudo agregar el registro. El pedido ya existe.'; ELSE -- El idPedido no existe, insertar un nuevo registro INSERT INTO PedidosEnLinea (idPedido, EstadoOrden) VALUES (p_idPedido, p_EstadoOrden); SELECT 'Registro insertado correctamente' AS Mensaje; END IF; END // DELIMITER ;

DELIMITER // CREATE PROCEDURE RegistrarProductosPedido( IN p_idUsuario INT, IN p_idPedido INT ) BEGIN -- Variables locales DECLARE v_idCarrito INT; -- Manejo de errores DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN ROLLBACK; SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error en la transacción. No se pudo registrar los productos del pedido.'; END; -- Obtener el idCarrito a partir del idUsuario SELECT idCarrito INTO v_idCarrito FROM Carritos WHERE idCliente = p_idUsuario; -- Iniciar transacción START TRANSACTION; -- Insertar los productos en el pedido INSERT INTO ProductosPedidos (idPedido, idProducto, CantidadProducto, Comentarios) SELECT p_idPedido, dc.idProducto, dc.Cantidad, NULL FROM DetallesCarritos dc WHERE dc.idCarrito = v_idCarrito AND NOT EXISTS ( SELECT 1 FROM ProductosPedidos pp WHERE pp.idPedido = p_idPedido AND pp.idProducto = dc.idProducto ); -- Verificar si se insertaron todos los productos IF ROW_COUNT() = 0 THEN ROLLBACK; SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error en la transacción. No se pudo registrar los productos del pedido.'; END IF; CALL VaciarCarrito(v_idCarrito); -- Commit de la transacción COMMIT; END // DELIMITER ;

DELIMITER // CREATE PROCEDURE InsertarEntrega( IN p_idPedido INT, IN p_EstadoEntrega VARCHAR(50), OUT p_IdInsertado INT ) BEGIN DECLARE v_Encontrado INT; -- Verificar si el idEntrega existe SELECT idEntrega INTO v_Encontrado FROM Entregas WHERE idPedido = p_idPedido LIMIT 1; IF v_Encontrado IS NOT NULL THEN -- El idEntrega ya existe, arrojar un error mediante SIGNAL SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pudo agregar el registro. La entrega ya existe.'; ELSE -- El idEntrega no existe, insertar un nuevo registro INSERT INTO Entregas (EstadoEntrega, idPedido) VALUES (p_EstadoEntrega, p_idPedido); SET p_IdInsertado = LAST_INSERT_ID(); END IF; END // DELIMITER ;

Tablas:
CREATE TABLE Usuarios ( idUsuario INT PRIMARY KEY auto_increment, Correo VARCHAR(100) NOT NULL, Contrasenia VARCHAR(350) NOT NULL, Imagen VARCHAR(100), idTipoUsuario INT NOT NULL, FOREIGN KEY (idTipoUsuario) REFERENCES TipoUsuario(idTipoUsuario) ON DELETE CASCADE ); 
CREATE TABLE Clientes ( idCliente INT PRIMARY KEY auto_increment, Nombre VARCHAR(100) NOT NULL, ApellidoPaterno VARCHAR(100) NOT NULL, ApellidoMaterno VARCHAR(100) NOT NULL, TelefonoContacto VARCHAR(20), idDireccion INT, idUsuario INT, UNIQUE(idUsuario), FOREIGN KEY (idDireccion) REFERENCES Direcciones(idDireccion) ON DELETE CASCADE, FOREIGN KEY (idUsuario) REFERENCES Usuarios(idUsuario) ON DELETE CASCADE );
CREATE TABLE Carritos ( idCarrito INT PRIMARY KEY auto_increment, idCliente INT NOT NULL, UNIQUE(idCliente), FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente) ON DELETE CASCADE ); 
CREATE TABLE DetallesCarritos ( idDetalleCarrito INT PRIMARY KEY auto_increment, idCarrito INT NOT NULL, idProducto INT NOT NULL, Cantidad INT NOT NULL, Comentarios TEXT NULL, UNIQUE(idCarrito, idProducto), FOREIGN KEY (idCarrito) REFERENCES Carritos(idCarrito) ON DELETE CASCADE, FOREIGN KEY (idProducto) REFERENCES Productos(idProducto) ON DELETE CASCADE );



CALL RegistrarPedidoEnLinea(38, '2023-05-18', '20:35:00', 2, '811811', '2025-03-23','Francisco Arenales', @idPedido);