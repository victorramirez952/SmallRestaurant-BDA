CREATE TABLE Tarjetas (
  idTarjeta INT PRIMARY KEY auto_increment,
  NumeroTarjeta VARCHAR(16) NOT NULL,
  FechaVencimiento DATE NOT NULL,
  Titular VARCHAR(255) NOT NULL,
  UNIQUE(NumeroTarjeta)
);


CREATE TABLE Productos (
  idProducto INT PRIMARY KEY auto_increment,
  NombreProducto VARCHAR(255) NOT NULL,
  Comida TINYINT NOT NULL,
  Precio DECIMAL(10, 2) NOT NULL,
  Descripcion TEXT NOT NULL,
  Imagen VARCHAR(255)
);


CREATE TABLE Unidades (
    idUnidad INT PRIMARY KEY auto_increment,
    TipoUnidad VARCHAR(50) NOT NULL
);

CREATE TABLE Ingredientes (
    idIngrediente INT PRIMARY KEY auto_increment,
    NombreIngrediente VARCHAR(100) NOT NULL,
    StockIngrediente INT NOT NULL,
    idUnidad INT NOT NULL,
    FOREIGN KEY (idUnidad) REFERENCES Unidades(idUnidad) ON DELETE CASCADE
);

CREATE TABLE Estados (
    idEstado INT PRIMARY KEY auto_increment,
    Estado VARCHAR(50) NOT NULL
);

CREATE TABLE Municipios (
    idMunicipio INT PRIMARY KEY auto_increment,
    Municipio VARCHAR(100) NOT NULL,
    idEstado INT NOT NULL,
    FOREIGN KEY (idEstado) REFERENCES Estados(idEstado) ON DELETE CASCADE
);

CREATE TABLE Colonias (
    idColonia INT PRIMARY KEY auto_increment,
    Colonia VARCHAR(100) NOT NULL,
    idMunicipio INT NOT NULL,
    FOREIGN KEY (idMunicipio) REFERENCES Municipios(idMunicipio) ON DELETE CASCADE
);

CREATE TABLE Direcciones (
    idDireccion INT PRIMARY KEY auto_increment,
    idColonia INT NOT NULL,
    Calle VARCHAR(100) NOT NULL,
    NumExterior VARCHAR(20) NOT NULL,
    NumInterior VARCHAR(20),
    CodigoPostal VARCHAR(10) NOT NULL,
    FOREIGN KEY (idColonia) REFERENCES Colonias(idColonia) ON DELETE CASCADE
);

CREATE TABLE TipoUsuario (
    idTipoUsuario INT PRIMARY KEY auto_increment,
    TipoUsuario VARCHAR(50) NOT NULL
);

CREATE TABLE Usuarios (
    idUsuario INT PRIMARY KEY auto_increment,
    Correo VARCHAR(100) NOT NULL,
    Contrasenia VARCHAR(350) NOT NULL,
    Imagen VARCHAR(100),
    idTipoUsuario INT NOT NULL,
    FOREIGN KEY (idTipoUsuario) REFERENCES TipoUsuario(idTipoUsuario) ON DELETE CASCADE
);

CREATE TABLE Clientes (
    idCliente INT PRIMARY KEY auto_increment,
    Nombre VARCHAR(100) NOT NULL,
    ApellidoPaterno VARCHAR(100) NOT NULL,
    ApellidoMaterno VARCHAR(100) NOT NULL,
    TelefonoContacto VARCHAR(20),
    idDireccion INT,
    idUsuario INT,
    UNIQUE(idUsuario),
    FOREIGN KEY (idDireccion) REFERENCES Direcciones(idDireccion) ON DELETE CASCADE,
    FOREIGN KEY (idUsuario) REFERENCES Usuarios(idUsuario) ON DELETE CASCADE
);

CREATE TABLE Especialidades (
    idEspecialidad INT PRIMARY KEY auto_increment, 
    Especialidad VARCHAR(100) NOT NULL
);

CREATE TABLE Chefs (
    idChef INT PRIMARY KEY auto_increment,
    Nombre VARCHAR(100) NOT NULL,
    ApellidoPaterno VARCHAR(100) NOT NULL,
    ApellidoMaterno VARCHAR(100) NOT NULL,
    Salario DECIMAL(10, 2) NOT NULL,
    idEspecialidad INT NOT NULL,
    idUsuario INT NOT NULL,
    UNIQUE(idUsuario),
    FOREIGN KEY (idEspecialidad) REFERENCES Especialidades(idEspecialidad) ON DELETE CASCADE,
    FOREIGN KEY (idUsuario) REFERENCES Usuarios(idUsuario) ON DELETE CASCADE
);

CREATE TABLE Repartidores (
    idRepartidor INT PRIMARY KEY auto_increment,
    Nombre VARCHAR(100) NOT NULL,
    ApellidoPaterno VARCHAR(100) NOT NULL,
    ApellidoMaterno VARCHAR(100) NOT NULL,
    Salario DECIMAL(10, 2) NOT NULL,
    MatriculaVehiculo VARCHAR(20) NOT NULL,
    idUsuario INT NOT NULL,
    UNIQUE(idUsuario),
    FOREIGN KEY (idUsuario) REFERENCES Usuarios(idUsuario) ON DELETE CASCADE
);

CREATE TABLE Meseros (
    idMesero INT PRIMARY KEY auto_increment,
    Nombre VARCHAR(100) NOT NULL,
    ApellidoPaterno VARCHAR(100) NOT NULL,
    ApellidoMaterno VARCHAR(100) NOT NULL,
    Salario DECIMAL(10, 2) NOT NULL,
    idUsuario INT NOT NULL,
    UNIQUE(idUsuario),
    FOREIGN KEY (idUsuario) REFERENCES Usuarios(idUsuario) ON DELETE CASCADE
);

CREATE TABLE Mesas (
    NumMesa INT PRIMARY KEY auto_increment,
    Capacidad INT NOT NULL,
    Disponible INT NOT NULL DEFAULT 1
);

CREATE TABLE Horarios (
    idHorario INT PRIMARY KEY auto_increment,
    Fecha DATE NOT NULL,
    Hora TIME NOT NULL,
    UNIQUE(Fecha, Hora)
);

CREATE TABLE Pedidos (
    idPedido INT PRIMARY KEY auto_increment,
    idCliente INT NOT NULL,
    FechaPedido DATE NOT NULL,
    HoraPedido TIME NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente) ON DELETE CASCADE
);

CREATE TABLE PedidosEnLinea (
    idPedido INT PRIMARY KEY,
    EstadoOrden INT NOT NULL,
    UNIQUE(idPedido, EstadoOrden),
    FOREIGN KEY (idPedido) REFERENCES Pedidos(idPedido) ON DELETE CASCADE
);

CREATE TABLE PedidosPresenciales (
    idPedido INT NOT NULL,
    NumMesa INT NULL,
    PRIMARY KEY (idPedido, NumMesa),
    FOREIGN KEY (idPedido) REFERENCES Pedidos(idPedido) ON DELETE CASCADE,
    FOREIGN KEY (NumMesa) REFERENCES Mesas(NumMesa) ON DELETE CASCADE
);

CREATE TABLE Entregas (
    idEntrega INT PRIMARY KEY auto_increment,
    EstadoEntrega VARCHAR(50) NOT NULL,
    idPedido INT NOT NULL,
    UNIQUE(idPedido),
    FOREIGN KEY (idPedido) REFERENCES Pedidos(idPedido) ON DELETE CASCADE
);

CREATE TABLE MetodosPagos (
  idMetodoPago INT PRIMARY KEY auto_increment,
  MetodoPago VARCHAR(50) NOT NULL
);

CREATE TABLE Pagos (
  NumTransaccion INT PRIMARY KEY auto_increment,
  MontoTotal DECIMAL(10, 2) NOT NULL,
  idMetodoPago INT NOT NULL,
  idPedido INT NOT NULL,
  FOREIGN KEY (idMetodoPago) REFERENCES MetodosPagos(idMetodoPago) ON DELETE CASCADE,
  FOREIGN KEY (idPedido) REFERENCES Pedidos(idPedido) ON DELETE CASCADE
);

CREATE TABLE TarjetasPagos (
  idTarjeta INT NOT NULL,
  idPago INT NOT NULL,
  PRIMARY KEY (idPago),
  FOREIGN KEY (idTarjeta) REFERENCES Tarjetas(idTarjeta) ON DELETE CASCADE,
  FOREIGN KEY (idPago) REFERENCES Pagos(NumTransaccion) ON DELETE CASCADE
);

CREATE TABLE PedidosRepartidores (
    idPedido INT NOT NULL,
    idRepartidor INT NOT NULL,
    PRIMARY KEY (idPedido),
    FOREIGN KEY (idPedido) REFERENCES Pedidos(idPedido) ON DELETE CASCADE,
    FOREIGN KEY (idRepartidor) REFERENCES Repartidores(idRepartidor) ON DELETE CASCADE
);

CREATE TABLE Reservaciones (
  idReserva INT PRIMARY KEY auto_increment,
  CantidadPersonas INT NOT NULL,
  Comentarios TEXT NULL,
  idHorario INT NOT NULL,
  idCliente INT NOT NULL,
  Confirmada BOOLEAN NOT NULL,
  UNIQUE(idHorario, idCliente),
  FOREIGN KEY (idHorario) REFERENCES Horarios(idHorario) ON DELETE CASCADE,
  FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente) ON DELETE CASCADE
);

CREATE TABLE ReservasMesas (
    NumMesa INT NOT NULL,
    idReserva INT NOT NULL,
    PRIMARY KEY (NumMesa, idReserva),
    FOREIGN KEY (NumMesa) REFERENCES Mesas(NumMesa) ON DELETE CASCADE,
    FOREIGN KEY (idReserva) REFERENCES Reservaciones(idReserva) ON DELETE CASCADE
);

CREATE TABLE ProductosPedidos (
    idPedido INT NOT NULL,
    idProducto INT NOT NULL,
    CantidadProducto INT NOT NULL,
    Comentarios TEXT,
    PRIMARY KEY (idPedido, idProducto),
    FOREIGN KEY (idPedido) REFERENCES Pedidos(idPedido) ON DELETE CASCADE,
    FOREIGN KEY (idProducto) REFERENCES Productos(idProducto) ON DELETE CASCADE
);

CREATE TABLE IngredientesProductos (
    idProducto INT NOT NULL,
    idIngrediente INT NOT NULL,
    Cantidad DECIMAL(5,3) NOT NULL,
    PRIMARY KEY (idProducto, idIngrediente),
    FOREIGN KEY (idProducto) REFERENCES Productos(idProducto) ON DELETE CASCADE,
    FOREIGN KEY (idIngrediente) REFERENCES Ingredientes(idIngrediente) ON DELETE CASCADE
);

CREATE TABLE Carritos (
  idCarrito INT PRIMARY KEY auto_increment,
  idCliente INT NOT NULL,
  UNIQUE(idCliente),
  FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente) ON DELETE CASCADE
);

CREATE TABLE DetallesCarritos (
  idDetalleCarrito INT PRIMARY KEY auto_increment,
  idCarrito INT NOT NULL,
  idProducto INT NOT NULL,
  Cantidad INT NOT NULL,
  Comentarios TEXT NULL,
  UNIQUE(idCarrito, idProducto),
  FOREIGN KEY (idCarrito) REFERENCES Carritos(idCarrito) ON DELETE CASCADE,
  FOREIGN KEY (idProducto) REFERENCES Productos(idProducto) ON DELETE CASCADE
);
