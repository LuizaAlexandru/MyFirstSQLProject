-- MySQL Script generated by MySQL Workbench
-- Tue Feb  6 10:24:54 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
-- SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


DROP SCHEMA IF EXISTS `HighSchool`;

-- -----------------------------------------------------
-- Schema HighSchool
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `HighSchool` DEFAULT CHARACTER SET utf8;
USE `HighSchool`;



-- -----------------------------------------------------
-- Table `HighSchool`.`Student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HighSchool`.`Student`;

CREATE TABLE IF NOT EXISTS `HighSchool`.`Student` (
  `idStudent` INT NOT NULL AUTO_INCREMENT,
  `Full_name` VARCHAR(45) NOT NULL,
  `Class_name` VARCHAR(45) NOT NULL,
  `Note` FLOAT NOT NULL,
  `Mail` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idStudent`));


-- -----------------------------------------------------
-- Table `HighSchool`.`Professor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HighSchool`.`Professor`;

CREATE TABLE IF NOT EXISTS `HighSchool`.`Professor` (
  `idProfessor` INT NOT NULL AUTO_INCREMENT,
  `Full_name` VARCHAR(45) NOT NULL,
  `School_subject` VARCHAR(45) NOT NULL,
  `Mail` VARCHAR(45) NULL,
  PRIMARY KEY (`idProfessor`));


-- -----------------------------------------------------
-- Table `HighSchool`.`Timetable`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HighSchool`.`Timetable`;

CREATE TABLE IF NOT EXISTS `HighSchool`.`Timetable` (
  `idTimetable` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idTimetable`));


-- -----------------------------------------------------
-- Table `HighSchool`.`Class`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HighSchool`.`Class`;

CREATE TABLE IF NOT EXISTS `HighSchool`.`Class` (
  `idClass` INT NOT NULL AUTO_INCREMENT,
  `Professor_idProfessor` INT NOT NULL,
  `Student_idStudent` INT NOT NULL,
  `Timetable_idTimetable` INT NOT NULL,
  PRIMARY KEY (`idClass`, `Professor_idProfessor`, `Student_idStudent`, `Timetable_idTimetable`),
  CONSTRAINT `fk_Class_Professor`
     FOREIGN KEY (`Professor_idProfessor`)
     REFERENCES `HighSchool`.`Professor` (`idProfessor`),
  CONSTRAINT `fk_Class_Student1`
     FOREIGN KEY (`Student_idStudent`)
     REFERENCES `HighSchool`.`Student` (`idStudent`),
  CONSTRAINT `fk_Class_Timetable1`
    FOREIGN KEY (`Timetable_idTimetable`)
    REFERENCES `HighSchool`.`Timetable` (`idTimetable`));

CREATE UNIQUE INDEX `idClass_UNIQUE` ON `HighSchool`.`Class` (`idClass` ASC) VISIBLE;

CREATE INDEX `fk_Class_Professor_idx` ON `HighSchool`.`Class` (`Professor_idProfessor` ASC) VISIBLE;

CREATE INDEX `fk_Class_Student1_idx` ON `HighSchool`.`Class` (`Student_idStudent` ASC) VISIBLE;

-- CREATE INDEX `fk_Class_Timetable1_idx` ON `HighSchool`.`Class` (`Timetable_idTimetable` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `HighSchool`.`Day`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HighSchool`.`Day`;

CREATE TABLE IF NOT EXISTS `HighSchool`.`Day` (
  `idDay` INT NOT NULL AUTO_INCREMENT,
  `Monday` VARCHAR(45) NULL DEFAULT 1,
  `Tuesday` VARCHAR(45) NOT NULL,
  `Wednesday` VARCHAR(45) NOT NULL,
  `Thursday` VARCHAR(45) NOT NULL,
  `Friday` VARCHAR(45) NOT NULL,
  `Timetable_idTimetable` INT NOT NULL,
  PRIMARY KEY (`idDay`, `Timetable_idTimetable`),
  CONSTRAINT `fk_Day_Timetable1`
    FOREIGN KEY (`Timetable_idTimetable`)
    REFERENCES `HighSchool`.`Timetable` (`idTimetable`));

CREATE INDEX `fk_Day_Timetable1_idx` ON `HighSchool`.`Day` (`Timetable_idTimetable` ASC) VISIBLE;

CREATE UNIQUE INDEX `Tuesday_UNIQUE` ON `HighSchool`.`Day` (`Tuesday` ASC) VISIBLE;



-- -----------------------------------------------------
-- Table `HighSchool`.`Program`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HighSchool`.`Program` ;

CREATE TABLE IF NOT EXISTS `HighSchool`.`Program` (
  `idProgram` INT NOT NULL AUTO_INCREMENT,
  `First_hour` TIME NOT NULL,
  `Scond_hour` TIME NOT NULL,
  `Third_hour` TIME NOT NULL,
  `Fourth_hour` TIME NOT NULL,
  `Day_idDay` INT NOT NULL,
  PRIMARY KEY (`idProgram`, `Day_idDay`),
  CONSTRAINT `fk_Program_Day1`
    FOREIGN KEY (`Day_idDay`)
    REFERENCES `HighSchool`.`Day` (`idDay`));

CREATE UNIQUE INDEX `idProgram_UNIQUE` ON `HighSchool`.`Program` (`idProgram` ASC) VISIBLE;

CREATE INDEX `fk_Program_Day1_idx` ON `HighSchool`.`Program` (`Day_idDay` ASC) VISIBLE;





SET SQL_MODE=@OLD_SQL_MODE;
-- SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
-- SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
