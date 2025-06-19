CREATE TABLE "genero" (
	"id_genero"	INTEGER NOT NULL,
	"genero"	INTEGER NOT NULL,
	PRIMARY KEY("id_genero" AUTOINCREMENT)
);

CREATE TABLE "clientes" (
	"id_cliente" INTEGER NOT NULL,
	"nombre"	VARCHAR (25) NOT NULL,
	"apellido"	VARCHAR (25) NOT NULL,
	"id_genero" INTEGER NOT NULL,
	"id_shoes" 	INTEGER NOT NULL,
	"gasto" INTEGER NOT NULL,
	"id_metodo" INTEGER NOT NULL,
	"direccion" INTEGER NOT NULL
	"email"	INTEGER NOT NULL UNIQUE,
	"numero" INTEGER  NOT NULL UNIQUE,
	"habitual"	INTEGER NOT NULL,
	"id_empleado" INTEGER NOT NULL, 
	PRIMARY KEY("id_cliente" AUTOINCREMENT),
    FOREIGN KEY("id_genero") REFERENCES genero("id_genero"),
    FOREIGN KEY("id_shoes") REFERENCES shoes("id_shoes"),
	FOREIGN KEY("id_metodo") REFERENCES metodoDePago("id_metodo"),
    FOREIGN KEY("id_empleado") REFERENCES empleados("id_empleado")

);

CREATE TABLE "ubicacionLocal" (
	"id_ubicacion"	INTEGER,
	"ubicacion"	INTEGER NOT NULL,
	PRIMARY KEY("id_ubicacion" AUTOINCREMENT)
);

CREATE TABLE "metodoDePago" (
	"id_metodo"	INTEGER,
	"metodo"	INTEGER NOT NULL,
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







