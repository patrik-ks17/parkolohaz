-- A feladatok megoldására elkészített SQL parancsokat illessze be a feladat sorszáma után!
-- 13. feladat
CREATE DATABASE parkolohaz
	CHARACTER SET utf8
	COLLATE utf8_hungarian_ci;
-- ***
-- 15. feladat
SELECT
  COUNT(parkolohely.id) AS masfeles_parkolohelyek_szama
FROM parkolohely
WHERE parkolohely.szelesseg = 1.5;
-- ***
-- 16. feladat
  INSERT INTO parkolohaz.jarmutipus (nev)
  VALUE('Elektromos gépjármű');
UPDATE parkolohaz.parkolohely 
  SET jarmutipusId = (SELECT
  jarmutipus.id
FROM jarmutipus
WHERE jarmutipus.nev = 'Elektromos gépjármű')
WHERE felirat = 'P001';
-- ***
-- 17. feladat
SELECT
  foglalas.datum,
  foglalas.ar
FROM foglalas
  INNER JOIN felhasznalo
    ON foglalas.felhasznaloId = felhasznalo.id
WHERE felhasznalo.nev = 'Kovács Anna';
-- ***
-- 18. feladat
SELECT DISTINCT
  felhasznalo.nev AS nev,
  SUM(foglalas.ar) AS szumma_tartozas
FROM foglalas
  INNER JOIN parkolohely
    ON foglalas.parkolohelyId = parkolohely.id
  INNER JOIN jarmutipus
    ON parkolohely.jarmutipusId = jarmutipus.id
  INNER JOIN felhasznalo
    ON foglalas.felhasznaloId = felhasznalo.id
WHERE foglalas.fizetve = 0
AND jarmutipus.nev = 'Motorkerékpár'
GROUP BY foglalas.felhasznaloId
ORDER BY szumma_tartozas DESC
  LIMIT 1;
-- ***
