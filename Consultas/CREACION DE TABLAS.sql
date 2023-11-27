CREATE TABLE Productos(
IdProducto INT PRIMARY KEY IDENTITY(1,1),
DescProducto VARCHAR (100),
Precio MONEY,
Cantidad INT,
Activo INT
)

CREATE TABLE Departamentos(
IdDepto INT PRIMARY KEY IDENTITY(1,1),
DescDepto VARCHAR(100),
Activo INT
)

CREATE TABLE ProductoDepto (
    IdProducto INT,
    IdDepto INT,
    FOREIGN KEY (IdProducto) REFERENCES Productos(IdProducto),
    FOREIGN KEY (IdDepto) REFERENCES Departamentos(IdDepto)
);
