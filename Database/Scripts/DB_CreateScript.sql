-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema airport
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `airport` ;

-- --------------------------------------clients---------------
-- Schema airport
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `airport` DEFAULT CHARACTER SET utf8mb3 ;
USE `airport` ;

-- -----------------------------------------------------
-- Table `airport`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airport`.`cars` (
  `ID_car` INT NOT NULL AUTO_INCREMENT,
  `Model` VARCHAR(45) NOT NULL,
  `State` VARCHAR(45) NOT NULL,
  `Cost` INT NOT NULL,
  `Date_buy` DATE NOT NULL,
  PRIMARY KEY (`ID_car`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `airport`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airport`.`clients` (
  `ID_client` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(60) NOT NULL,
  `Surname` VARCHAR(60) NOT NULL,
  `Thirdname` VARCHAR(60) NOT NULL,
  `Birthdate` DATE NOT NULL,
  `Gender` VARCHAR(20) NOT NULL,
  `Passport_ser` INT NOT NULL,
  `Passport_num` INT NOT NULL,
  `Mail` VARCHAR(100) NOT NULL,
  `Password` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ID_client`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `airport`.`plane_models`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airport`.`plane_models` (
  `Model` VARCHAR(45) NOT NULL,
  `Places` INT NOT NULL,
  `Type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Model`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airport`.`planes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airport`.`planes` (
  `ID_plane` INT NOT NULL AUTO_INCREMENT,
  `Model` VARCHAR(45) NOT NULL,
  `State` VARCHAR(45) NOT NULL,
  `Cost` INT NOT NULL,
  `Date_buy` DATE NOT NULL,
  `Races_done` INT NOT NULL,
  PRIMARY KEY (`ID_plane`),
  INDEX `fk_planes_plane_models1_idx` (`Model` ASC) VISIBLE,
  CONSTRAINT `fk_planes_plane_models1`
    FOREIGN KEY (`Model`)
    REFERENCES `airport`.`plane_models` (`Model`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `airport`.`zones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airport`.`zones` (
  `Country` VARCHAR(50) NOT NULL,
  `Zone` INT NULL,
  PRIMARY KEY (`Country`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airport`.`places`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airport`.`places` (
  `ID_place` VARCHAR(3) NOT NULL,
  `Name` VARCHAR(100) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(50) NOT NULL,
  `International` TINYINT NOT NULL,
  `Main` TINYINT NOT NULL default 0,
  PRIMARY KEY (`ID_place`),
  INDEX `fk_places_zones1_idx` (`Country` ASC) VISIBLE,
  CONSTRAINT `fk_places_zones1`
    FOREIGN KEY (`Country`)
    REFERENCES `airport`.`zones` (`Country`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airport`.`races`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airport`.`races` (
  `ID_race` INT NOT NULL AUTO_INCREMENT,
  `TypeRace` VARCHAR(45) NOT NULL,
  `Price` INT NULL,
  `FROM_place` VARCHAR(3) NOT NULL,
  `TO_place` VARCHAR(3) NOT NULL,
  `Time` TIME NOT NULL,
  `Date` DATE NOT NULL,
  `Duration` INT NOT NULL,
  `State` VARCHAR(15) NOT NULL,
  `PLANES_ID_plane` INT NOT NULL,
  PRIMARY KEY (`ID_race`),
  INDEX `fk_RACES_PLANES1_idx` (`PLANES_ID_plane` ASC) VISIBLE,
  INDEX `fk_races_places1_idx` (`FROM_place` ASC) VISIBLE,
  INDEX `fk_races_places2_idx` (`TO_place` ASC) VISIBLE,
  CONSTRAINT `fk_RACES_PLANES1`
    FOREIGN KEY (`PLANES_ID_plane`)
    REFERENCES `airport`.`planes` (`ID_plane`),
  CONSTRAINT `fk_races_places1`
    FOREIGN KEY (`FROM_place`)
    REFERENCES `airport`.`places` (`ID_place`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_races_places2`
    FOREIGN KEY (`TO_place`)
    REFERENCES `airport`.`places` (`ID_place`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `airport`.`delays`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airport`.`delays` (
  `RACES_ID_race` INT NOT NULL,
  `Time_delay` INT NOT NULL,
  `Cause` VARCHAR(100) NOT NULL,
  `Tickets_lost` INT NOT NULL,
  PRIMARY KEY (`RACES_ID_race`),
  INDEX `fk_DELAYS_RACES1_idx` (`RACES_ID_race` ASC) VISIBLE,
  CONSTRAINT `fk_DELAYS_RACES1`
    FOREIGN KEY (`RACES_ID_race`)
    REFERENCES `airport`.`races` (`ID_race`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `airport`.`teams`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airport`.`teams` (
  `ID_team` INT NOT NULL AUTO_INCREMENT,
  `Members_col` INT NOT NULL,
  `Team_type` VARCHAR(45) NOT NULL,
  `CARS_ID_car` INT NULL DEFAULT NULL,
  `PLANES_ID_plane` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ID_team`),
  INDEX `fk_TEAMS_CARS1_idx` (`CARS_ID_car` ASC) VISIBLE,
  INDEX `fk_TEAMS_PLANES1_idx` (`PLANES_ID_plane` ASC) VISIBLE,
  CONSTRAINT `fk_TEAMS_CARS1`
    FOREIGN KEY (`CARS_ID_car`)
    REFERENCES `airport`.`cars` (`ID_car`),
  CONSTRAINT `fk_TEAMS_PLANES1`
    FOREIGN KEY (`PLANES_ID_plane`)
    REFERENCES `airport`.`planes` (`ID_plane`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `airport`.`worker`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airport`.`worker` (
  `ID_worker` INT NOT NULL AUTO_INCREMENT,
  `Appoint` VARCHAR(45) NOT NULL,
  `Department` VARCHAR(45) NOT NULL,
  `FIO` VARCHAR(45) NOT NULL,
  `Gender` VARCHAR(45) NOT NULL,
  `Birth` DATE NOT NULL,
  `Salary` INT NOT NULL,
  `Childrens` INT NOT NULL,
  `Date_start` DATE NOT NULL,
  `TEAMS_ID_team` INT NOT NULL,
  PRIMARY KEY (`ID_worker`),
  INDEX `fk_WORKER_TEAMS_idx` (`TEAMS_ID_team` ASC) VISIBLE,
  CONSTRAINT `fk_WORKER_TEAMS`
    FOREIGN KEY (`TEAMS_ID_team`)
    REFERENCES `airport`.`teams` (`ID_team`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `airport`.`med_history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airport`.`med_history` (
  `Year` INT NOT NULL,
  `WORKER_ID_worker` INT NOT NULL,
  `Type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Year`, `WORKER_ID_worker`),
  INDEX `fk_Med_history_WORKER1_idx` (`WORKER_ID_worker` ASC) VISIBLE,
  CONSTRAINT `fk_Med_history_WORKER1`
    FOREIGN KEY (`WORKER_ID_worker`)
    REFERENCES `airport`.`worker` (`ID_worker`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `airport`.`repair_history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airport`.`repair_history` (
  `ID_operation` INT NOT NULL AUTO_INCREMENT,
  `Date_start` DATE NOT NULL,
  `Repairing` INT NOT NULL,
  `Broken_parts` VARCHAR(200) NOT NULL,
  `Races_before_repair` INT NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  `PLANES_ID_plane` INT NOT NULL,
  PRIMARY KEY (`ID_operation`),
  INDEX `fk_Repair_history_PLANES1_idx` (`PLANES_ID_plane` ASC) VISIBLE,
  CONSTRAINT `fk_Repair_history_PLANES1`
    FOREIGN KEY (`PLANES_ID_plane`)
    REFERENCES `airport`.`planes` (`ID_plane`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `airport`.`tickets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airport`.`tickets` (
  `ID_ticket` INT NOT NULL AUTO_INCREMENT,
  `Rout` VARCHAR(100) NOT NULL,
  `Class` VARCHAR(45) NOT NULL,
  `Luggage` TINYINT NOT NULL,
  `Returned` TINYINT NOT NULL,
  `RACES_ID_race` INT NOT NULL,
  `CLIENTS_ID_client` INT NOT NULL,
  PRIMARY KEY (`ID_ticket`),
  INDEX `fk_TICKETS_RACES1_idx` (`RACES_ID_race` ASC) VISIBLE,
  INDEX `fk_TICKETS_CLIENTS1_idx` (`CLIENTS_ID_client` ASC) VISIBLE,
  CONSTRAINT `fk_TICKETS_CLIENTS1`
    FOREIGN KEY (`CLIENTS_ID_client`)
    REFERENCES `airport`.`clients` (`ID_client`),
  CONSTRAINT `fk_TICKETS_RACES1`
    FOREIGN KEY (`RACES_ID_race`)
    REFERENCES `airport`.`races` (`ID_race`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
