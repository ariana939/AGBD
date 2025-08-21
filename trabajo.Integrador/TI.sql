
CREATE TABLE "genero" (
	"id_genero"	INTEGER NOT NULL,
	"genero"	VARCHAR(10) NOT NULL,
	PRIMARY KEY("id_genero" AUTOINCREMENT)
);

CREATE TABLE "empleados" (
    "id_empleados"  INTEGER NOT NULL,
    "nombre"        VARCHAR(15) NOT NULL,
    "apellido"      VARCHAR(15) NOT NULL,
    "edad"          VARCHAR(2) NOT NULL,
    "puesto"        INTEGER NOT NULL,
    PRIMARY KEY("id_empleados" AUTOINCREMENT)
);

CREATE TABLE "cantidad_talles" (
	"id_Ctalles"	INTEGER NOT NULL,
	"talle"	INTEGER NOT NULL,
	PRIMARY KEY("id_Ctalles" AUTOINCREMENT)
);

CREATE TABLE "talles" (
	"id_talles"	INTEGER NOT NULL,
	"id_Ctalles" INTEGER NOT NULL,
	PRIMARY KEY("id_talles" AUTOINCREMENT),
	FOREIGN KEY("id_Ctalles") REFERENCES cantidad_talles ("id_Ctalles")
);

CREATE TABLE "shoes" (
    "id_shoes"  INTEGER NOT NULL,
	"nombre"  VARCHAR(35) NOT  NULL,
    "tipo"      VARCHAR(20) NOT NULL,
    "marca"     VARCHAR(15) NOT NULL,
    "precio"   VARCHAR(15) NOT NULL,
	"id_talles"   INTEGER NOT NULL,
    PRIMARY KEY("id_shoes" AUTOINCREMENT),
    FOREIGN KEY("id_talles") REFERENCES talles ("id_talles")
);

CREATE TABLE "metodoDePago" (
	"id_metodo"	INTEGER,
	"metodo"	VARCHAR (20) NOT NULL,
	PRIMARY KEY("id_metodo" AUTOINCREMENT)
);

CREATE TABLE "opcionesPago" (
	"id_pago"	INTEGER,
	"id_cliente"	INTEGER NOT NULL,
	"id_metodo"	INTEGER NOT NULL,
	PRIMARY KEY("id_pago" AUTOINCREMENT),
	FOREIGN KEY("id_cliente") REFERENCES clientes("id_cliente"),
	FOREIGN KEY("id_metodo") REFERENCES metodo("id_metodo")
);

CREATE TABLE "clientes" (
	"id_cliente" INTEGER NOT NULL,
	"nombre"	 VARCHAR (15) NOT NULL,/*varchar sirve para limitar los caracteres que se van a ingresar*/
	"apellido"	 VARCHAR (15) NOT NULL, 
	"gasto"      VARCHAR (10) NOT NULL,
	"direccion"  VARCHAR (40) NOT NULL,
	"email"	     VARCHAR (45) NOT NULL UNIQUE,
	"numero"     VARCHAR (10) NOT NULL UNIQUE,
	"id_genero"  INTEGER NOT NULL, /*integer es para tener muchos numeros de id ej:12587 id*/
	"id_shoes" 	 INTEGER NOT NULL,
	"id_empleado" INTEGER NOT NULL,
	PRIMARY KEY("id_cliente" AUTOINCREMENT),
    FOREIGN KEY("id_genero") REFERENCES genero("id_genero"),
    FOREIGN KEY("id_shoes") REFERENCES shoes("id_shoes"),
    FOREIGN KEY("id_empleado") REFERENCES empleados("id_empleado")
);

INSERT INTO cantidadTalles (talles) VALUES /*talles aye*/
(34),
(35),
(36),
(37),
(38),
(39),
(40),
(41),
(42),
(43),
(44);

INSERT INTO talles (id_Ctalles) VALUES /*talle aye*/
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11);

INSERT INTO shoes (nombre, tipo, marca, precio, id_talles) 
VALUES  ('dunk Low Retro','basica', 'nike', '$160.000',6),
		('MC trainer','deportivo','nike','$120.000',8),
		('jordan 3 Retro','high-top','nike','$400.000',11),
		('vomero 18','running','nike','$275.000',3),
		('samba OG','basica','adidas','$190.000',2),
		('amplimove','deportiva','adidas','$110.000',7),
		('forum Mid','high-top','adidas','$152.000',9),
		('superNova Rise','running','adidas','$187.000',1),
		('rebound Retro','basica','puma','$143.000',4),
		('darter Pro','deportiva','puma','$110.000',10),
		('carina Mid','high-top','puma','$130.000',5);








