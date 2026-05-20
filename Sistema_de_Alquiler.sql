CREATE DATABASE Sistema_de_Alquiler;
use Sistema_de_Alquiler;
show tables;

Create table Cliente(
cedula varchar(10) primary key,
Nombre varchar(20) not null,
Apellido varchar(20) not null,
Direccion varchar(50),
Telefono varchar(10) not null,
Correo varchar(30) not null
); 

Create table Vehiculo(
Matricula varchar(10) primary key,
Marca varchar (15) not null,
precio_diario decimal(8,2) not null,
Estado enum ('Disponible', 'Alquilado', 'En mantenimiento') not null
); 

Create table Alquiler(
id_alquiler varchar(10) primary key,
fecha_inicio date not null,
fecha_fin date not null,
fecha_devolucion date,
Estado enum('activo', 'finalizado', 'cancelado') not null,
CI_cliente varchar(10), 
Matricula_v varchar (10),
foreign key(CI_cliente) references Cliente(cedula),
foreign key(Matricula_v) references Vehiculo(matricula)
); 

CREATE TABLE Pago (
    id_pago varchar(10) primary key,
    metodo_pago enum('efectivo', 'transferencia') not null,
    Monto decimal(8,2) not null,
    fecha_de_pago date not null,
    id_alquiler varchar(10),
    foreign key (id_alquiler) references Alquiler(id_alquiler)
);

CREATE TABLE Garantia (
    id_garantia varchar(10) primary key,
    tipo_documento varchar(20) not null,
    Estado enum('activa', 'liberada', 'ejecutada') not null,
    Monto decimal(8,2) not null,
    id_alquiler varchar(10),
    foreign key (id_alquiler) references Alquiler(id_alquiler)
);

CREATE TABLE Multa (
    id_multa varchar(10) primary key,
    tipo_multa varchar(20) not null,
    Descripcion varchar(100),
    Monto decimal(8,2) not null,
    Estado enum('pendiente', 'pagada') not null,
    id_alquiler varchar(10),
   foreign key (id_alquiler) references Alquiler(id_alquiler)
);




desc Cliente;
desc Vehiculo;
desc Alquiler;
desc Pago;
desc Garantia;
desc Multa;

SELECT * FROM Cliente;
SELECT * FROM Vehiculo;
SELECT * FROM Alquiler;
SELECT * FROM Pago;
SELECT * FROM Garantia;
SELECT * FROM Multa;


