-- 1 Seleccionar todas las películas con una duración mayor a 120 minutos:
SELECT * FROM Peliculas WHERE Length > 120;

-- 2 Seleccionar todas las películas que fueron lanzadas en el año 2000:
SELECT * FROM Peliculas WHERE Release_Year = 2000;

-- 3 Seleccionar todas las películas de un género específico, por ejemplo "Drama":
SELECT * FROM Peliculas WHERE Genero = 'Drama';

-- 4 Seleccionar la cantidad de alquileres que se hicieron en un mes y año específicos, por ejemplo mayo de 2022:
SELECT COUNT(*) FROM Alquileres WHERE Rental_Date BETWEEN '2022-05-01' AND '2022-05-31';

-- 5 Seleccionar todos los actores cuyo apellido es "Smith":
SELECT * FROM Actores WHERE Last_Name = 'Pitt';

-- 6 Seleccionar todas las películas cuyo título incluye la palabra "aventura":
SELECT * FROM Peliculas WHERE Title LIKE '%Bill%';

-- 7 Seleccionar la fecha de alquiler más reciente para una película específica, por ejemplo la película con Film_Id = 12:
SELECT MAX(Rental_Date) FROM Alquileres WHERE peliculas_Film_Id = 12;

-- 8 Obtener todas las películas del género "Comedy":
SELECT * FROM Peliculas WHERE Genero = 'Comedy';

-- 9 Obtener la cantidad de películas que se han alquilado por año, incluyendo años en los que no se alquilaron películas:
SELECT YEAR(Alquileres.Rental_Date) AS Year, COUNT(*) AS Total 
FROM Peliculas 
LEFT JOIN Alquileres ON Peliculas.Film_Id = Alquileres.peliculas_Film_Id 
GROUP BY Year;

-- 10 Obtener el número de películas que se han alquilado en cada año desde el 2005 hasta el 2010, incluyendo aquellos años en los que no se han alquilado películas:

SELECT Years.Year, COUNT(Alquileres.Rental_Id) AS Num_Alquileres 
FROM (SELECT 2005 AS Year UNION SELECT 2006 UNION SELECT 2007 UNION SELECT 2008 UNION SELECT 2009 UNION SELECT 2010) AS Years 
LEFT JOIN Alquileres ON YEAR(Alquileres.Rental_Date) = Years.Year 
GROUP BY Years.Year;


