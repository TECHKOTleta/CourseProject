-- MySQL Script generated by MySQL Workbench
-- Sun Feb 18 10:20:38 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, 
FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE,  SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- -----------------------------------------------------
-- Schema airport
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema airport
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `airport`;
CREATE SCHEMA `airport` DEFAULT CHARACTER SET utf8 ; USE `airport`;
-- -----------------------------------------------------
-- Table `airport`.`PLANES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airport`.`PLANES` (
  `ID_plane` INT NOT NULL AUTO_INCREMENT,
  `Model` VARCHAR(45) NOT NULL,
  `Type` VARCHAR(45) NOT NULL,   `State` VARCHAR(45) NOT NULL,
  `Places` INT NOT NULL,
  `Cost` INT NOT NULL,
  `Date_buy` DATE NOT NULL,
  `Races_done` INT NOT NULL,
  PRIMARY KEY (`ID_plane`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `airport`.`RACES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airport`.`RACES` (
  `ID_race` INT NOT NULL AUTO_INCREMENT,
  `TypeRace` VARCHAR(45) NOT NULL,
  `FROM_place` VARCHAR(50) NOT NULL,
  `TO_place` VARCHAR(50) NOT NULL,
  `International` TINYINT NOT NULL,
  `Time` TIME NOT NULL,
  `Date` DATE NOT NULL,
  `Duration` INT NOT NULL,
  `State` VARCHAR(15) NOT NULL,
  `PLANES_ID_plane` INT NOT NULL,
  PRIMARY KEY (`ID_race`),
  INDEX `fk_RACES_PLANES1_idx` (`PLANES_ID_plane` ASC) VISIBLE,
  CONSTRAINT `fk_RACES_PLANES1`
    FOREIGN KEY (`PLANES_ID_plane`)
    REFERENCES `airport`.`PLANES` (`ID_plane`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `airport`.`CARS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airport`.`CARS` (
  `ID_car` INT NOT NULL AUTO_INCREMENT,
  `Model` VARCHAR(45) NOT NULL,
  `State` VARCHAR(45) NOT NULL,
  `Cost` INT NOT NULL,
  `Date_buy` DATE NOT NULL,
  PRIMARY KEY (`ID_car`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `airport`.`CLIENTS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airport`.`CLIENTS` (
  `ID_client` INT NOT NULL AUTO_INCREMENT,
  `FIO` VARCHAR(45) NOT NULL,
  `Age` INT NOT NULL,
  `Gender` VARCHAR(20) NOT NULL,
  `Passport_ser` INT NOT NULL,
  `Passport_num` INT NOT NULL,
  `Tel` VARCHAR(22) NOT NULL,
  `Mail` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ID_client`)) ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `airport`.`TICKETS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airport`.`TICKETS` (
  `ID_ticket` INT NOT NULL AUTO_INCREMENT,
  `Price` INT NOT NULL,
  `Rout` VARCHAR(100) NOT NULL,
  `Class` VARCHAR(45) NOT NULL,
  `Luggage` TINYINT NOT NULL,
  `Returned` TINYINT NOT NULL,
  `RACES_ID_race` INT NOT NULL,
  `CLIENTS_ID_client` INT NOT NULL,
  PRIMARY KEY (`ID_ticket`),
  INDEX `fk_TICKETS_RACES1_idx` (`RACES_ID_race` ASC) VISIBLE,
  INDEX `fk_TICKETS_CLIENTS1_idx` (`CLIENTS_ID_client` ASC) VISIBLE,
  CONSTRAINT `fk_TICKETS_RACES1`
    FOREIGN KEY (`RACES_ID_race`)
    REFERENCES `airport`.`RACES` (`ID_race`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TICKETS_CLIENTS1`
    FOREIGN KEY (`CLIENTS_ID_client`)
    REFERENCES `airport`.`CLIENTS` (`ID_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `airport`.`TEAMS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airport`.`TEAMS` (
  `ID_team` INT NOT NULL AUTO_INCREMENT,
  `Members_col` INT NOT NULL,
  `Team_type` VARCHAR(45) NOT NULL,
  `CARS_ID_car` INT NULL,
  `PLANES_ID_plane` INT NULL,
  PRIMARY KEY (`ID_team`),
  INDEX `fk_TEAMS_CARS1_idx` (`CARS_ID_car` ASC) VISIBLE,
  INDEX `fk_TEAMS_PLANES1_idx` (`PLANES_ID_plane` ASC) VISIBLE,
  CONSTRAINT `fk_TEAMS_CARS1`
    FOREIGN KEY (`CARS_ID_car`)
    REFERENCES `airport`.`CARS` (`ID_car`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TEAMS_PLANES1`
    FOREIGN KEY (`PLANES_ID_plane`)
    REFERENCES `airport`.`PLANES` (`ID_plane`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `airport`.`WORKER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airport`.`WORKER` (
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
    REFERENCES `airport`.`TEAMS` (`ID_team`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `airport`.`Repair_history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airport`.`Repair_history` (
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
    REFERENCES `airport`.`PLANES` (`ID_plane`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `airport`.`Med_history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airport`.`Med_history` (
  `Year` INT NOT NULL,
  `WORKER_ID_worker` INT NOT NULL,
  `Type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Year`, `WORKER_ID_worker`),
  INDEX `fk_Med_history_WORKER1_idx` (`WORKER_ID_worker` ASC) VISIBLE,
  CONSTRAINT `fk_Med_history_WORKER1`
    FOREIGN KEY (`WORKER_ID_worker`)
    REFERENCES `airport`.`WORKER` (`ID_worker`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `airport`.`DELAYS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airport`.`DELAYS` (
  `RACES_ID_race` INT NOT NULL,
  `Time_delay` INT NOT NULL,
  `Cause` VARCHAR(100) NOT NULL,
  `Tickets_lost` INT NOT NULL,
  PRIMARY KEY (`RACES_ID_race`),
  INDEX `fk_DELAYS_RACES1_idx` (`RACES_ID_race` ASC) VISIBLE,
  CONSTRAINT `fk_DELAYS_RACES1`
    FOREIGN KEY (`RACES_ID_race`)
    REFERENCES `airport`.`RACES` (`ID_race`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;