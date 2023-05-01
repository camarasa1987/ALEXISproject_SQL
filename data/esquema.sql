-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `proyectoblockbuster` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema proyectoblockbuster
-- -----------------------------------------------------
USE `proyectoblockbuster` ;

-- -----------------------------------------------------
-- Table `mydb`.`actores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoblockbuster`.`actores` (
  `Actor_id` INT NOT NULL,
  `Firt_Name` VARCHAR(50) NOT NULL,
  `Last_Name` VARCHAR(70) NOT NULL,
  `Last_Update` DATETIME NOT NULL,
  `Full_Name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Actor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`peliculas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoblockbuster`.`peliculas` (
  `Film_Id` INT NOT NULL,
  `Title` VARCHAR(120) NOT NULL,
  `Description` VARCHAR(2000) NOT NULL,
  `Release_Year` INT NOT NULL,
  `Language` VARCHAR(2) NOT NULL,
  `Rental_Duration` INT NOT NULL,
  `Rental_Rate` FLOAT NOT NULL,
  `Length` INT NOT NULL,
  `Replacement_Cost` FLOAT NOT NULL,
  `Rating` VARCHAR(45) NOT NULL,
  `Special_Features` VARCHAR(45) NOT NULL,
  `Genero` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Film_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`actores_peliculas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoblockbuster`.`actores_peliculas` (
  `actores_Actor_Id` INT NOT NULL,
  `peliculas_Film_Id` INT NOT NULL,
  INDEX `fk_actores-peliculas_actores_idx` (`actores_Actor_Id` ASC) VISIBLE,
  INDEX `fk_actores-peliculas_peliculas1_idx` (`peliculas_Film_Id` ASC) VISIBLE,
  CONSTRAINT `fk_actores-peliculas_actores`
    FOREIGN KEY (`actores_Actor_Id`)
    REFERENCES `proyectoblockbuster`.`actores` (`Actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_actores-peliculas_peliculas1`
    FOREIGN KEY (`peliculas_Film_Id`)
    REFERENCES `proyectoblockbuster`.`peliculas` (`Film_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Alquileres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `proyectoblockbuster`.`Alquileres` (
  `Rental_Id` INT NOT NULL,
  `Rental_Date` DATETIME NOT NULL,
  `Inventory_Id` INT NOT NULL,
  `Return_Date` DATETIME NOT NULL,
  `Last_Update` DATETIME NOT NULL,
  
  `peliculas_Film_Id` INT NOT NULL,
  PRIMARY KEY (`Rental_Id`),
  INDEX `fk_Alquileres_peliculas1_idx` (`peliculas_Film_Id` ASC) VISIBLE,
  CONSTRAINT `fk_Alquileres_peliculas1`
    FOREIGN KEY (`peliculas_Film_Id`)
    REFERENCES `proyectoblockbuster`.`peliculas` (`Film_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
