CREATE DATABASE autobazar;
USE autobazar;
CREATE TABLE `stav` (
	`IdStav` INT(11) NOT NULL AUTO_INCREMENT,
	`NazovStavu` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf16_slovak_ci',
	PRIMARY KEY (`IdStav`) USING BTREE
)
COLLATE='utf16_slovak_ci'
ENGINE=MyISAM
;



CREATE TABLE `znacka` (
	`IdZnacka` INT(11) NOT NULL AUTO_INCREMENT,
	`NazovZnacky` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_slovak_ci',
	PRIMARY KEY (`IdZnacka`) USING BTREE
)
COLLATE='utf8mb4_slovak_ci'
ENGINE=MyISAM
;
 
CREATE TABLE `pouzivatel` (
	`IdPouzivatela` INT(11) NOT NULL AUTO_INCREMENT,
	`Meno` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_slovak_ci',
	`Heslo` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_slovak_ci',
	`Spravca` BIT(1) NOT NULL,
	`TelefonneCislo` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_slovak_ci',
	PRIMARY KEY (`IdPouzivatela`) USING BTREE
)
COLLATE='utf8mb4_slovak_ci'
ENGINE=MYISAM
;


CREATE TABLE `fotografia` (
	`IdAuta` INT(11) NOT NULL,
	`IdFotografie` INT(11) NOT NULL AUTO_INCREMENT,
	`Popis` VARCHAR(50) NOT NULL COLLATE 'utf8mb4_slovak_ci',
	PRIMARY KEY (`IdFotografie`) USING BTREE,
	INDEX `IdAuta` (`IdAuta`) USING BTREE
)
COLLATE='utf8mb4_slovak_ci'
ENGINE=MyISAM
;

 
 
CREATE TABLE `stavauta` (
	`IdStavAuta` INT(11) NOT NULL AUTO_INCREMENT,
	`IdStav` INT(11) NOT NULL,
	`PopisStavu` VARCHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8mb4_slovak_ci',
	`Posudzovatel` INT(11) NULL DEFAULT NULL,
	`DatumPosudku` DATE NULL DEFAULT NULL,
	`IdAuta` INT(11) NOT NULL,
	PRIMARY KEY (`IdStavAuta`) USING BTREE,
	INDEX `IdStav` (`IdStav`) USING BTREE,
	INDEX `IdAuta` (`IdAuta`) USING BTREE,
	INDEX `Posudzovatel` (`Posudzovatel`) USING BTREE
)
COLLATE='utf8mb4_slovak_ci'
ENGINE=MyISAM
AUTO_INCREMENT=2
;

CREATE TABLE `auto` (
	`IdAuta` INT(11) NOT NULL AUTO_INCREMENT,
	`ZnackaAuta` INT(11) NOT NULL DEFAULT '0',
	`Cena` FLOAT NOT NULL,
	`RocnikVyroby` FLOAT NOT NULL,
	`PocetNajazdenychKM` FLOAT NOT NULL,
	`AktualnyStav` INT(11) NOT NULL,
	`Kupec` INT(11) NULL DEFAULT NULL,
	PRIMARY KEY (`IdAuta`) USING BTREE,
	INDEX `IdZnacky` (`ZnackaAuta`) USING BTREE,
	INDEX `Kupec` (`Kupec`) USING BTREE
)
COLLATE='utf8mb4_slovak_ci'
ENGINE=MyISAM
;


REPLACE INTO `pouzivatel` (`IdPouzivatela`, `Meno`, `Heslo`, `Spravca`, `TelefonneCislo`) VALUES
	(1, 'Jakub Hvizdak', '6013cf8b1ef1d5e9e9d2812209c72755', b'1', '0940769097'),
	(2, 'Tibor Hvizdák', '4a7d1ed414474e4033ac29ccb8653d9b', b'1', '0944524954'),
	(3, 'Jan Fabry', '310ac55553c749213b506c7a124127d7', b'0', '0908527634'),
	(4, 'Cesc Fabregas', '32e4133608e94034f69a53a90212fe29', b'0', '0911587469'),
	(5, 'Joe Cole', '7cde196eceb13c256802aa9a8d9e0bd8', b'0', '0904227896'),
	(6, 'Milan Petrovič', 'e7f3035a2f1cfb2d3d5e8b16ecf7438e', b'0', '0911294427'),
	(7, 'Milan Baroš', 'e11a249a6c68e774d58f6e987cb0bddc', b'0', '0917692322');


INSERT INTO `fotografia` VALUES
	(1, 1, 'Titulna Fotografia'),
	(2, 2, 'Titulna Fotografia'),
	(3, 3, 'Titulna Fotografia'),
	(4, 4, 'Titulna Fotografia'),
	(5, 5, 'Titulna Fotografia'),
	(6, 6, 'Titulna Fotografia'),
	(7, 7, 'Titulna Fotografia'),
	(8, 8, 'Titulna Fotografia'),
	(9, 9, 'Titulna Fotografia'),
	(10, 10, 'Titulna Fotografia'),
	(11, 11, 'Titulna Fotografia'),
	(12, 12, 'Titulna Fotografia'),
	(13, 13, 'Titulna Fotografia'),
	(14, 14, 'Titulna Fotografia'),
	(15, 15, 'Titulna Fotografia'),
	(16, 16, 'Titulna Fotografia');
	

REPLACE INTO `auto` (`IdAuta`, `ZnackaAuta`, `Cena`, `RocnikVyroby`, `PocetNajazdenychKM`, `AktualnyStav`, `Kupec`) VALUES
	(1, 1, 18000, 2017, 124000, 5, 5),
	(2, 2, 3500, 2012, 207000, 5, 6),
	(3, 3, 14000, 2015, 146000, 5, 3),
	(4, 4, 1000, 2004, 287000, 2, 4),
	(5, 5, 60000, 2021, 3000, 5, 7),
	(6, 6, 7000, 2014, 173000, 2, 8),
	(7, 7, 500, 2008, 168000, 3, NULL),
	(8, 8, 4000, 2006, 85000, 4, NULL),
	(9, 9, 2000, 2002, 142000, 1, NULL),
	(10, 10, 8000, 2010, 158000, 5, 7),
	(11, 11, 5000, 2014, 110000, 2, NULL),
	(12, 12, 3000, 2007, 198000, 5, NULL),
	(13, 13, 8000, 2012, 245000, 1, NULL),
	(14, 14, 6000, 2007, 175000, 4, NULL),
	(15, 15, 12000, 2017, 80000, 5, NULL);
	
	

REPLACE INTO `stav` (`IdStav`, `NazovStavu`) VALUES
	(1, 'Nové'),
	(2, 'Opravené'),
	(3, 'Poškodené'),
	(4, 'Nepojazdné'),
	(5, 'Používané');


REPLACE INTO `stavauta` (`IdStavAuta`, `IdStav`, `PopisStavu`, `Posudzovatel`, `DatumPosudku`, `IdAuta`) VALUES
	(1, 1, 'Všetko ok, ale kradnute', 1, '2020-07-15', 1),
	(2, 5, '100 % v poriadku', 2, '2020-02-17', 2),
	(3, 3, 'Chybaju dvere', 2, '2020-09-12', 3),
	(4, 5, '100 % v poriadku', 2, '2021-01-20', 4),
	(5, 5, 'Podozrenie z kradeže', 1, '2020-03-14', 5),
	(6, 1, '100 % v poriadku', 2, '2019-01-31', 6),
	(7, 5, '100 % v poriadku', 2, '2020-08-11', 7),
	(8, 4, 'Potrebné nove brzdy', 2, '2021-04-10', 8),
	(9, 3, 'Rozbite čelne sklo', 2, '2020-12-24', 9),
	(10, 4, 'Chyba volant', 1, '2020-11-14', 10),
	(11, 2, 'Nova spojka', 1, '2020-11-18', 11),
	(12, 4, 'Pokazeny plynovy pedal', 1, '2021-01-07', 12),
	(13, 2, 'Vymene rozvody', 2, '2021-07-14', 13),
	(14, 4, 'Potrebna vymena motora', 2, '2020-01-10', 14),
	(15, 5, '100 % V poriadku', 2, '2020-07-18', 15);
	
	

REPLACE INTO `znacka` (`IdZnacka`, `NazovZnacky`) VALUES
	(1, 'Audi'),
	(2, 'Škoda'),
	(3, 'BMW'),
	(4, 'Volkswagen'),
	(5, 'Mercedes Benz'),
	(6, 'Renault'),
	(7, 'Peugot'),
	(8, 'Nissan'),
	(9, 'Kia'),
	(10, 'Dacia'),
	(11, 'Toyota'),
	(12, 'Ford'),
	(13, 'Mitsubishi'),
	(14, 'Jeep'),
	(15, 'Suzuki');
	
	
	
SELECT Spravca, Meno FROM pouzivatel											-- vypise Spravcov autobazaru
WHERE Spravca = 1;	
	
	
	
SELECT Cena, IdAuta FROM auto														-- zoradi cenu od najvyssej po najnizsiu
ORDER BY Cena DESC;



SELECT a.IdAuta, z.NazovZnacky FROM auto a 
JOIN znacka z ON (a.ZnackaAuta=z.IdZnacka)									-- autá ktore nemaju kupcu
WHERE kupec IS NULL;


SELECT IdAuta, DatumPosudku FROM stavauta			
WHERE posudzovatel = 2																-- zoradenie aut ktoré posudil spravca 2
ORDER BY DatumPosudku;

SELECT NazovZnacky FROM znacka
ORDER BY NazovZnacky; 																-- zoradenie aut podla abecedy



SELECT IdAuta, RocnikVyroby, PocetNajazdenychKM, AktualnyStav FROM auto
WHERE (RocnikVyroby < '2010' OR AktualnyStav IN (3,4))					-- zobrazenie aut starsich ako 2010 alebo so stavom 3,4 (poškodene a nepojazdne) a s poctom najazd. km. mensim ako 150000
AND PocetNajazdenychKM < 150000;

SELECT NazovZnacky FROM znacka
Where IdZnacka NOT IN (1, 3, 4, 5); 											-- zobrazi vsetky auta ktore niesu nemecké


SELECT Meno FROM pouzivatel
WHERE Meno LIKE 'J%';																-- zobrazi uzivatelov ktorych meno zacina na J


SELECT p.Meno, COUNT(*) FROM auto a
JOIN pouzivatel p ON (a.Kupec=p.IdPouzivatela) 								-- pocet nakupenych aut 
GROUP BY p.Meno;

SELECT RocnikVyroby, SUM(PocetNajazdenychKM)
FROM auto
GROUP BY RocnikVyroby																-- rocniky aut v ktorych sucet najazd.km je vacsi ako 100 000 km
HAVING SUM(PocetNajazdenychKM) > 100000;

SELECT NazovStavu, MIN(PocetNajazdenychKM) FROM auto a
JOIN stav s ON (s.IdStav = a.AktualnyStav)									-- zobrazenie auta s najmensim poctom najazdenych km pre jednotlive stavy 
GROUP BY AktualnyStav;

SELECT distinct NazovZnacky FROM znacka
WHERE IdZnacka NOT IN 
(SELECT ZnackaAuta FROM auto														-- vyberie auta ktore stoja ako 15 000
WHERE cena < 15000);

SELECT IdFotografie  FROM fotografia f
JOIN 		
(SELECT IdAuta FROM auto 															-- zoznam fotografii predanych aut
WHERE kupec IS NOT NULL) a ON f.IdAuta = a.IdAuta;

SELECT NazovStavu, COUNT(*) FROM auto a 
JOIN stav s ON a.AktualnyStav = s.IdStav										-- pocet aut v jednotlivych stavoch
GROUP BY NazovStavu;

















