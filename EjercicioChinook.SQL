/*1*//*Nombre y Apellido de todos los empleados, en orden alfabético.*/
select  FirstName, LastName from employees
order by FirstName ASC, LastName ASC

/*2*//*Nombre y duración de todas las canciones del álbum "Big Ones" ordenados del más largo al más corto*/
select t.Name, t.Milliseconds, t.AlbumId from tracks t
INNER JOIN albums a on t.AlbumId = a.AlbumId
WHERE Title = "Big Ones"
ORDER BY t.Milliseconds DESC

/*3*//*Nombre de todos los géneros con la cantidad de canciones de cada uno*/
SELECT count(t.TrackId) as cant_cancio, g.Name from genres g
INNER JOIN tracks t on g.GenreId = t.GenreId
GROUP BY g.GenreId

/*4*//*Nombre de los discos con al menos 5 canciones*/
SELECT a.Title, count(t.TrackId) as cant_x_disco from albums a
INNER JOIN tracks t on a.AlbumId = t.AlbumId
GROUP BY a.AlbumId
HAVING cant_x_disco >= 5
ORDER BY cant_x_disco ASC

/*5*//*Nombre y precio total de los 10 discos más baratos*/
SELECT a.Title, t.UnitPrice from albums a
INNER JOIN tracks t on a.AlbumId = t.AlbumId
GROUP BY a.Title
ORDER BY T.UnitPrice ASC
LIMIT 10

/*6*//*Nombre del tema, nombre del género y nombre del disco del los temas que valen $0.99*/
SELECT t.name as tema, g.name as genero, a.Title as disco, t.UnitPrice from albums a
INNER JOIN tracks t on a.AlbumId = t.AlbumId
INNER JOIN genres g on t.GenreId = g.GenreId
WHERE t.UnitPrice = 0.99

/*7*//*Nombre del tema, duración, nombre del disco y nombre del artista de los 20 temas más cortos*/
SELECT t.name as tema, t.Milliseconds as duracion, a.Title as disco, ar.name as artista from albums a
INNER JOIN tracks t on a.AlbumId = t.AlbumId
INNER JOIN artists ar on a.ArtistId = ar.ArtistId
ORDER BY t.Milliseconds ASC
LIMIT 20

/*8*//*Apellido, puesto, apellido del jefe y cantidad de clientes que atiende de todos los empleados, 
ordenado desde los que atienden más clientes a los que atienden menos*/
SELECT e.LastName as apellidoJefe, e.Title as puesto, em.LastName as apellidoEmple, count(c.CustomerId) as clientes_x_empleado from employees e
INNER JOIN employees em on e.EmployeeId = em.ReportsTo
INNER JOIN customers c on em.EmployeeId = c.SupportRepId
GROUP BY em.EmployeeId
ORDER BY clientes_x_empleado DESC

/*9*//*Insertar cuatro (4) canciones que les gusten.*/
INSERT INTO tracks (name, MediaTypeId, Milliseconds,UnitPrice)
VALUES  ('hello',1, 100100, 1),
		('bye',1, 100100, 1),
		('hola',2, 100100, 1),
		('chau',2, 100100, 1);


/*10*//*Mostrar las cuatro canciones ingresadas.*/
SELECT * from tracks
WHERE TrackId > 3503

/*11*//*Modifiquen dos (2) canciones por otras que se les ocurran.*/
UPDATE tracks
SET name = 'sleep'
WHERE TrackId = 3504;

UPDATE tracks
SET name = 'wake up'
WHERE TrackId = 3505

/*12*//*Mostrar las dos (2) canciones modificadas.*/
SELECT * from tracks
WHERE TrackId IN(3504,3505)

/*13*//*Borrar dos (2) datos ingresados, realizando un solo delete.*/
DELETE from tracks WHERE TrackId >= 3506