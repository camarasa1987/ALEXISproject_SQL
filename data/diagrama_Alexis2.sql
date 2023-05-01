
ALTER TABLE peliculas MODIFY Release_Year bigint;
ALTER TABLE peliculas MODIFY Language_Id varchar(50);
ALTER TABLE peliculas MODIFY Rental_Duration bigint;
ALTER TABLE peliculas MODIFY Rental_Rate decimal;
ALTER TABLE actores ADD COLUMN Full_Name VARCHAR(255);