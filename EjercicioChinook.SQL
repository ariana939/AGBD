/*1*//*Nombre y Apellido de todos los empleados, en orden alfabético.*/
select  FirstName, LastName from customers
order by FirstName ASC, LastName ASC


/*2*//*Nombre y duración de todas las canciones del álbum "Big Ones" ordenados del más largo al más corto*/
select tr.name, Milliseconds from albums al 
inner join tracks tr on al.AlbumId = tr.AlbumId
WHERE al.AlbumId  = "Big Ones"
/*no lo termine*/

/*3*//*Nombre de todos los géneros con la cantidad de canciones de cada uno*/

/*4*//*Nombre de los discos con al menos 5 canciones*/

/*5*//*Nombre y precio total de los 10 discos más baratos*/

/*6*//*Nombre del tema, nombre del género y nombre del disco del los temas que valen $0.99*/

/*7*//*Nombre del tema, duración, nombre del disco y nombre del artista de los 20 temas más cortos*/

/*8*//*Apellido, puesto, apellido del jefe y cantidad de clientes que atiende de todos los empleados, 
ordenado desde los que atienden más clientes a los que atienden menos*/

/*9*//*Insertar cuatro (4) canciones que les gusten.*/

/*10*//*Mostrar las cuatro canciones ingresadas.*/

/*11*//*Modifiquen dos (2) canciones por otras que se les ocurran.*/

/*12*//*Mostrar las dos (2) canciones modificadas.*/

/*13*//*Borrar dos (2) datos ingresados, realizando un solo delete.*/
