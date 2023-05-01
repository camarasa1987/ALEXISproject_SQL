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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema proyectoblockbuster
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`actores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`actores` (
  `Actor_id` INT NOT NULL,
  `Firt_Name` VARCHAR(45) NOT NULL,
  `Last_Name` VARCHAR(45) NOT NULL,
  `Last_Update` DATETIME NOT NULL,
  PRIMARY KEY (`Actor_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`peliculas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`peliculas` (
  `Film_Id` INT NOT NULL,
  `Title` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(45) NOT NULL,
  `Release_Year` VARCHAR(45) NOT NULL,
  `Language_Id` INT NOT NULL,
  `Rental_Duration` VARCHAR(45) NOT NULL,
  `Rental_Rate` INT NOT NULL,
  `Length` VARCHAR(45) NOT NULL,
  `Replacement_Cost` VARCHAR(45) NOT NULL,
  `Rating` VARCHAR(45) NOT NULL,
  `Special_Features` VARCHAR(45) NOT NULL,
  `Last_Update` DATETIME NOT NULL,
  `Genero` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Film_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`actores_peliculas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`actores_peliculas` (
  `actores_Actor_Id` INT NOT NULL,
  `peliculas_Film_Id` INT NOT NULL,
  INDEX `fk_actores-peliculas_actores_idx` (`actores_Actor_Id` ASC) VISIBLE,
  INDEX `fk_actores-peliculas_peliculas1_idx` (`peliculas_Film_Id` ASC) VISIBLE,
  CONSTRAINT `fk_actores-peliculas_actores`
    FOREIGN KEY (`actores_Actor_Id`)
    REFERENCES `mydb`.`actores` (`Actor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_actores-peliculas_peliculas1`
    FOREIGN KEY (`peliculas_Film_Id`)
    REFERENCES `mydb`.`peliculas` (`Film_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Alquileres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Alquileres` (
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
    REFERENCES `mydb`.`peliculas` (`Film_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

