-- Sukuriame duomenų bazę
CREATE DATABASE IF NOT EXISTS world;
USE world;

-- Lentelė: country
CREATE TABLE country (
  Code CHAR(3) NOT NULL,
  Name VARCHAR(52) NOT NULL,
  Continent VARCHAR(50) NOT NULL,
  Region VARCHAR(50) NOT NULL,
  SurfaceArea FLOAT NOT NULL,
  IndepYear SMALLINT DEFAULT NULL,
  Population INT NOT NULL,
  LifeExpectancy FLOAT DEFAULT NULL,
  GNP FLOAT DEFAULT NULL,
  GNPOld FLOAT DEFAULT NULL,
  LocalName VARCHAR(45) NOT NULL,
  GovernmentForm VARCHAR(45) NOT NULL,
  HeadOfState VARCHAR(60) DEFAULT NULL,
  Capital INT DEFAULT NULL,
  Code2 CHAR(2) NOT NULL,
  PRIMARY KEY (Code)
);

-- Lentelė: city
CREATE TABLE city (
  ID INT AUTO_INCREMENT,
  Name VARCHAR(35) NOT NULL,
  CountryCode CHAR(3) NOT NULL,
  District VARCHAR(20) NOT NULL,
  Population INT NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (CountryCode) REFERENCES country(Code)
);

-- Lentelė: countrylanguage
CREATE TABLE countrylanguage (
  CountryCode CHAR(3) NOT NULL,
  Language VARCHAR(30) NOT NULL,
  IsOfficial ENUM('T','F') NOT NULL DEFAULT 'F',
  Percentage FLOAT NOT NULL,
  PRIMARY KEY (CountryCode, Language),
  FOREIGN KEY (CountryCode) REFERENCES country(Code)
);

-- Lentelė: countryinfo
CREATE TABLE countryinfo (
  CountryCode CHAR(3) NOT NULL,
  ShortName VARCHAR(100) NULL,
  ISO3 CHAR(3) NULL,
  NumCode INT NULL,
  UNMember ENUM('YES','NO') DEFAULT 'YES',
  PRIMARY KEY (CountryCode),
  FOREIGN KEY (CountryCode) REFERENCES country(Code)
);

-- Įterpiame 20 atsitiktinių šalių
INSERT INTO country (Code, Name, Continent, Region, SurfaceArea, IndepYear, Population, LifeExpectancy, GNP, GNPOld, LocalName, GovernmentForm, HeadOfState, Capital, Code2) VALUES
('USA','United States','North America','North America',9833517,1776,331000000,78.9,21427700,NULL,'United States','Federal Republic','President',NULL,'US'),
('CAN','Canada','North America','North America',9984670,1867,38000000,82.5,1643000,NULL,'Canada','Constitutional Monarchy','King',NULL,'CA'),
('MEX','Mexico','North America','Central America',1964375,1810,128000000,75.1,1189000,NULL,'México','Federal Republic','President',NULL,'MX'),
('BRA','Brazil','South America','South America',8515767,1822,212000000,75.9,1839000,NULL,'Brasil','Federal Republic','President',NULL,'BR'),
('ARG','Argentina','South America','South America',2780400,1816,45000000,76.5,450000,NULL,'Argentina','Federal Republic','President',NULL,'AR'),
('FRA','France','Europe','Western Europe',551695,843,67000000,82.4,2715000,NULL,'France','Republic','President',NULL,'FR'),
('DEU','Germany','Europe','Western Europe',357022,1871,83000000,81.2,3846000,NULL,'Deutschland','Federal Republic','Chancellor',NULL,'DE'),
('ESP','Spain','Europe','Southern Europe',505990,1492,47000000,83.0,1314000,NULL,'España','Constitutional Monarchy','King',NULL,'ES'),
('ITA','Italy','Europe','Southern Europe',301340,1861,60000000,83.4,1880000,NULL,'Italia','Republic','President',NULL,'IT'),
('GBR','United Kingdom','Europe','British Isles',243610,1066,67000000,81.2,2827000,NULL,'United Kingdom','Constitutional Monarchy','King',NULL,'GB'),
('CHN','China','Asia','East Asia',9596961,-221,1400000000,77.0,14342900,NULL,'中国','People\'s Republic','President',NULL,'CN'),
('JPN','Japan','Asia','East Asia',377975,660,125000000,84.6,5082000,NULL,'日本','Constitutional Monarchy','Emperor',NULL,'JP'),
('KOR','South Korea','Asia','East Asia',100210,1948,52000000,83.3,1631000,NULL,'대한민국','Republic','President',NULL,'KR'),
('IND','India','Asia','South Asia',3287263,1947,1380000000,69.7,2875000,NULL,'भारत','Federal Republic','Prime Minister',NULL,'IN'),
('AUS','Australia','Oceania','Australia and Oceania',7692024,1901,26000000,82.9,1393000,NULL,'Australia','Federal Constitutional Monarchy','King',NULL,'AU'),
('NZL','New Zealand','Oceania','Australia and Oceania',268021,1907,5000000,82.3,206000,NULL,'Aotearoa','Constitutional Monarchy','Prime Minister',NULL,'NZ'),
('ZAF','South Africa','Africa','Southern Africa',1221037,1910,60000000,64.1,351400,NULL,'South Africa','Republic','President',NULL,'ZA'),
('EGY','Egypt','Africa','Northern Africa',1002450,-3100,103000000,72.0,363100,NULL,'مصر','Republic','President',NULL,'EG'),
('TUR','Turkey','Asia','Middle East',783562,1923,84000000,77.7,720100,NULL,'Türkiye','Republic','President',NULL,'TR'),
('SWE','Sweden','Europe','Scandinavia',450295,1523,10300000,82.8,538600,NULL,'Sverige','Constitutional Monarchy','King',NULL,'SE');
