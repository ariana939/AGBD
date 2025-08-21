CREATE TABLE "genero" (
	"id_genero"	INTEGER NOT NULL,
	"genero"	VARCHAR(10    ) NOT NULL,
	PRIMARY KEY("id_genero" AUTOINCREMENT)
);

CREATE TABLE "clientes" (
	"id_cliente" INTEGER NOT NULL,
	"nombre"	 VARCHAR (15) NOT NULL,/*varchar sirve para limitar los caracteres que se van a ingresar*/
	"apellido"	 VARCHAR (15) NOT NULL, 
	"id_genero"  INTEGER NOT NULL, /*integer es para tener muchos numeros de id ej:12587 id*/
	"id_shoes" 	 INTEGER NOT NULL,
	"gasto"      VARCHAR (10) NOT NULL,
	"id_metodo"  INTEGER NOT NULL,
	"direccion"  VARCHAR (40) NOT NULL,
	"email"	     VARCHAR (45) NOT NULL UNIQUE,
	"numero"     VARCHAR (10) NOT NULL UNIQUE,
	"habitual"	 VARCHAR (2) NOT NULL,
	"id_empleado" INTEGER NOT NULL, 
	PRIMARY KEY("id_cliente" AUTOINCREMENT),
    FOREIGN KEY("id_genero") REFERENCES genero("id_genero"),
    FOREIGN KEY("id_shoes") REFERENCES shoes("id_shoes"),
	FOREIGN KEY("id_metodo") REFERENCES metodoDePago("id_metodo"),
    FOREIGN KEY("id_empleado") REFERENCES empleados("id_empleado")

);

CREATE TABLE "empleados" (
    "id_empleados"  INTEGER NOT NULL,
    "nombre"        VARCHAR(15) NOT NULL,
    "apellido"      VARCHAR(15) NOT NULL,
    "edad"          VARCHAR(2) NOT NULL,
    "puesto"        INTEGER NOT NULL,
    PRIMARY KEY("id_empleados" AUTOINCREMENT)
);

CREATE TABLE "shoes" (
    "id_shoes"  INTEGER NOT NULL,
    "tipo"      VARCHAR(20) NOT NULL,
    "marca"     VARCHAR(15) NOT NULL,
    "talles"    VARCHAR(5) NOT NULL,
    "precios"   VARCHAR(15) NOT NULL,
    "id_ubicacion"  VARCHAR(40) NOT NULL,
    PRIMARY KEY("id_shoes" AUTOINCREMENT),
    FOREIGN KEY(id_ubicacion) REFERENCES ubicacionLocal (id_ubicacion)
);

CREATE TABLE "ubicacionLocal" (/*PARA EL TRABAJO INTEGRADOR NO LO USAMOS*/
	"id_ubicacion"	INTEGER,
	"ubicacion"	INTEGER NOT NULL,
	PRIMARY KEY("id_ubicacion" AUTOINCREMENT)
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

/*not null = tiene que tener dato obligatoriamente(rocio 2025)*qe2w1º/






