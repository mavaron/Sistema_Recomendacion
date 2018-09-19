use recomendacion,

CREATE TABLE IF NOT EXISTS Vivienda(
	ID_V INT NOT NULL,
    ID_P INT NOT NULL,
    Zona INT NOT NULL,
    UPZ INT NOT NULL,
    Calle VARCHAR(10) NOT NULL,
    Sur BIT NOT NULL,
    Carrera VARCHAR(10) NOT NULL,
    Estrato INT NOT NULL,
    Zonas_Comunes INT NOT NULL,
    Cercania_TM INT NOT NULL,
    Valorizacion INT NOT NULL,
    Cant_Viv_Proy INT NOT NULL,
    Conjunto_Cerrado BIT NOT NULL,
    Deporte INT NOT NULL,
    Acceso_Discapacitados BIT NOT NULL,
    Fecha_Entrega DATE NOT NULL,
    Meses_Entrega INT,
    Casa_Apartamente BIT NOT NULL,
    Cuartos INT NOT NULL,
    Banos INT NOT NULL,
    Parqueaderos INT NOT NULL,
    Balcon BIT NOT NULL,
    Area_Privada FLOAT NOT NULL,
    Area_Construida FLOAT NOT NULL,
    Precio FLOAT NOT NULL,
    Cuota_Inicial FLOAT NOT NULL,
    Mens_Cuota_Inicial FLOAT NOT NULL,
    Cuota_Credito FLOAT NOT NULL,
    Tipo_Apartamento VARCHAR(50) NOT NULL,
    Nombre_Proyecto VARCHAR(100) NOT NULL,
    Constructora VARCHAR(100) NOT NULL,
    Link VARCHAR(200) NOT NULL,
    PRIMARY KEY(ID_V)


)ENGINE=INNODB,
ALTER TABLE vivienda CHANGE `Casa_Apartamente` `Casa_Apartamento` BIT NOT NULL;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/BD_Vivienda_Nuevos.csv' 
INTO TABLE vivienda 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(ID_V,ID_P,Zona,UPZ,Calle,Sur,Carrera,Estrato,Zonas_Comunes,Cercania_TM,Valorizacion,Cant_Viv_Proy,Conjunto_Cerrado,Deporte,Acceso_Discapacitados,@Fecha_Entrega,Meses_Entrega,Casa_Apartamento,Cuartos,Banos,Parqueaderos,Balcon,Area_Privada,Area_Construida,Precio,Cuota_Inicial,Mens_Cuota_Inicial,Cuota_Credito,Tipo_Apartamento,Nombre_Proyecto,Constructora,Link)
SET Fecha_Entrega = STR_TO_DATE(@Fecha_Entrega, '%d/%m/%Y');

SHOW VARIABLES LIKE "secure_file_priv";

use recomendacion;
CREATE TABLE IF NOT EXISTS CBF_R(
	ID_V INT NOT NULL,
    Recommender_Score DECIMAL(12,10) NOT NULL,
    PRIMARY KEY(ID_V)

)ENGINE=INNODB;

use recomendacion;
TRUNCATE cbf_r;

CREATE TABLE `recomendacion`.`fact_r` (
  `ID_C` INT NOT NULL,
  `ID_V` INT NOT NULL,
  `score` DECIMAL(10,9) NOT NULL,
  PRIMARY KEY (`ID_V`))
ENGINE = InnoDB;

