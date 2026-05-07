DROP TABLE IF EXISTS bandas;
CREATE TABLE bandas
(
    nombre character varying(50),
    pais character varying(50)
);

insert into bandas (nombre, pais) values ('Kraftwerk', 'Alemania');
insert into bandas (nombre, pais) values ('Los prisioneros', 'Chile');
insert into bandas (nombre, pais) values ('KMFDM', 'Alemania');
insert into bandas (nombre, pais) values ('Muse', 'UK');
insert into bandas (nombre, pais) values ('The Chemical Brothers', 'UK');
insert into bandas (nombre, pais) values ('TOOL', 'USA');
insert into bandas (nombre, pais) values ('The Beatles', 'UK');
insert into bandas (nombre, pais) values ('Modeselektor', 'Alemania');

DROP TABLE IF EXISTS bandas_discos;
CREATE TABLE bandas_discos
(
    nombre_disco character varying(50),
    nombre_banda character varying(50),
    anio_disco integer
);

insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('Kraftwerk', 'Computer World', 1981);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('Kraftwerk', 'The Man Machine', 1978);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('Los prisioneros', 'La cultura de la basura', 1987);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('Los prisioneros', 'Corazones', 1990);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('KMFDM', 'NIHIL', 1995);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('KMFDM', 'XTORT', 1996);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('KMFDM', 'ADIOS', 1999);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('Muse', 'Showbiz', 1999);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('Muse', 'Origin of symmetry', 2001);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('Muse', 'Black holes and Revelations', 2006);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('The Chemical Brothers', 'Surrender', 1999);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('The Chemical Brothers', 'Born in the echoes', 2015);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('The Chemical Brothers', 'No Geography', 2019);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('TOOL', 'Aenima', 1996);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('TOOL', 'Lateralus', 2001);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('TOOL', 'Fear Inoculum', 2019);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('The Beatles', 'Rubber Soul', 1965);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('The Beatles', 'Revolver', 1966);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('The Beatles', 'Abbey Road', 1969);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('Modeselektor', 'Hello Mom!', 2005);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('Modeselektor', 'Monkeytown', 2011);
insert into bandas_discos (nombre_banda, nombre_disco, anio_disco) values ('Modeselektor', 'Who Else', 2019);


#Visualizar bandas
SELECT * FROM bandas;

--Listar todos los discos de bandas NO alemanas que hayan sido publicados desde el 2000 en adelante

SELECT 
    bd.nombre_disco, 
    b.nombre, 
    b.pais, 
    bd.anio_disco
FROM bandas b
JOIN bandas_discos bd ON b.nombre = bd.nombre_banda
WHERE b.pais <> 'Alemania' 
  AND bd.anio_disco >= 2000;

--Listar el disco más reciente de las bandas inglesas que terminan en 's'

SELECT 
    b.nombre, 
    MAX(bd.anio_disco) AS disco_mas_reciente
FROM bandas b
JOIN bandas_discos bd ON b.nombre = bd.nombre_banda
WHERE b.pais = 'UK' 
  AND b.nombre LIKE '%s'
GROUP BY b.nombre;

--Listar todas las bandas alemanas con al menos una letra K en su nombre que tengan discos publicados en 1999 o superior

SELECT DISTINCT b.nombre
FROM bandas b
JOIN bandas_discos bd ON b.nombre = bd.nombre_banda
WHERE b.pais = 'Alemania' 
  AND b.nombre ILIKE '%K%' 
  AND bd.anio_disco >= 1999;

--Listar todas las bandas y el número de discos registrado

SELECT nombre_banda AS nombre, COUNT(*) AS discos
FROM bandas_discos
GROUP BY nombre_banda
ORDER BY discos DESC;

--Mostrar todos los años en que todas las bandas sacaron un disco. Ordene la lista por año

SELECT nombre_banda AS nombre, anio_disco
FROM bandas_discos
ORDER BY anio_disco ASC;

--Listar todas las bandas que tienen un disco con nombre empezado en A. Listar el nombre de la banda y del disco

SELECT nombre_banda, nombre_disco
FROM bandas_discos
WHERE nombre_disco LIKE 'A%';

--Listar todas las bandas que tengan discos con más de una palabra. Listar el nombre de la banda y del disco

SELECT nombre_banda, nombre_disco
FROM bandas_discos
WHERE nombre_disco LIKE '% %';

--Listar todas las bandas que tengan discos con más de una palabra. Listar el nombre de la banda y la cantidad de discos

SELECT nombre_banda AS nombre, COUNT(*) AS count
FROM bandas_discos
WHERE nombre_disco LIKE '% %'
GROUP BY nombre_banda;
