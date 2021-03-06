CREATE DATABASE miplaya;
USE miplaya;

CREATE TABLE Persona(
	cedula varchar(20),
		CONSTRAINT PK_Persona PRIMARY KEY(cedula),
	nombre varchar(20),
	apellido varchar(20)
);

CREATE TABLE Direccion(
	id_direccion INT AUTO_INCREMENT,
		CONSTRAINT PK_Direccion PRIMARY KEY(id_direccion),
	direccion varchar(100),
	persona_ced varchar(20),
		CONSTRAINT FK_PersonaDireccion FOREIGN KEY(persona_ced)
		REFERENCES Persona(cedula)
);

CREATE TABLE Telefono(
	id_telefono INT AUTO_INCREMENT,
		CONSTRAINT PK_Telefono PRIMARY KEY(id_telefono),
	telefono varchar(30),
	persona_ced varchar(20),
		CONSTRAINT FK_PersonaTelefono FOREIGN KEY(persona_ced)
		REFERENCES Persona(cedula)
);

CREATE TABLE Email(
	id_email INT AUTO_INCREMENT,
		CONSTRAINT PK_Email PRIMARY KEY(id_email),
	email varchar(40),
	persona_ced varchar(20),
		CONSTRAINT FK_PersonaEmail FOREIGN KEY(persona_ced)
		REFERENCES Persona(cedula)
);

CREATE TABLE Cliente (
	id_cliente INT AUTO_INCREMENT,
		CONSTRAINT PK_Cliente PRIMARY KEY(id_cliente),
	persona_ced varchar(20),
		CONSTRAINT FK_PersonaCliente FOREIGN KEY(persona_ced)
		REFERENCES Persona(cedula)
	
);

CREATE TABLE Propietario(
	id_Propietario INT AUTO_INCREMENT,
		CONSTRAINT PK_Propietario PRIMARY KEY(id_propietario),
	persona_ced varchar(20),
		CONSTRAINT FK_PersonaPropietario FOREIGN KEY(persona_ced)
		REFERENCES Persona(cedula)
);

CREATE TABLE Empleado(
	id_empleado INT AUTO_INCREMENT,
		CONSTRAINT PK_Empleado PRIMARY KEY(id_empleado),
	usuario varchar(20),
		CONSTRAINT UNIQUE_EmpleadoUsuario UNIQUE(usuario),
	contrasena varchar(20),
	persona_ced varchar(20),
		CONSTRAINT FK_PersonaEmpleado FOREIGN KEY(persona_ced)
		REFERENCES Persona(cedula)
);

CREATE TABLE Apartamento(
	id_apartamento INT AUTO_INCREMENT,
		CONSTRAINT PK_Apartamento PRIMARY KEY(id_apartamento),
	ano INT,
	costo_alquiler DECIMAL(18, 2),
	costo_mantenimiento DECIMAL(18,2),
	edificio varchar(20),
	recamaras SMALLINT,
	tipo_apartamento varchar(20),
	id_propietario INT,
		CONSTRAINT FK_ApartamentoId_propietario FOREIGN KEY(id_propietario)
		REFERENCES Propietario(id_propietario)
);

CREATE TABLE ClienteApartamento(
	id_alquiler INT AUTO_INCREMENT,
	cant_personas SMALLINT,
	forma_pago varchar(20),
	monto DECIMAL(18,2),
	fecha_entrada DATETIME,
	fecha_salida DATETIME,
	id_cliente INT,
		CONSTRAINT FK_ClienteApartamentoId_cliente FOREIGN KEY(id_cliente)
		REFERENCES Cliente(id_cliente),
	id_apartamento INT,
		CONSTRAINT FK_ClienteApartamentoId_apartamento FOREIGN KEY(id_apartamento)
		REFERENCES Apartamento(id_apartamento),
	CONSTRAINT PK_ClienteApartamento PRIMARY KEY(id_alquiler,id_cliente,id_apartamento)
);

CREATE TABLE Equipo(
	id_equipo INT AUTO_INCREMENT,
		CONSTRAINT PK_Equipo PRIMARY KEY(id_equipo),
	descripccion varchar(30),
	tipo varchar(20),
	cantidad INT,
	id_apartamento INT,
		CONSTRAINT FK_EquipoId_apartamento FOREIGN KEY(id_apartamento)
		REFERENCES Apartamento(id_apartamento)
);
