--examen--
--1--
select count(title) from albums a
INNER JOIN tracks t on a.AlbumId = t.AlbumId
WHERE title like "Unplugged"
GROUP BY a.title

--2--
select a.title, ar.name ,count(title) as cantCanciones from tracks s
INNER JOIN albums a on s.AlbumId = a.AlbumId
INNER JOIN artists ar on a.ArtistId = ar.ArtistId
GROUP BY ar. ArtistId
HAVING cantCanciones>= 30
ORDER by cantCanciones desc

--3--
INSERT INTO tracks (TrackId, name, MediaTypeId,Milliseconds,UnitPrice)
VALUES (3504,'BOTELLA', 1, 100000,1),
	   (3505,'COMPU',1,    100001,2),
	   (3506,'CELULAR',1,  100002,3),
	   (3507,'CARTUCHERA',1,100003,4),
	   (3508,'LAPICERA',1, 100004,5),
	   (3509,'LAPICERA',1, 100005,6);

       