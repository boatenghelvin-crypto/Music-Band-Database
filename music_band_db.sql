-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema music_band_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema music_band_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `music_band_db` DEFAULT CHARACTER SET utf8 ;
USE `music_band_db` ;

-- -----------------------------------------------------
-- Table `music_band_db`.`band_member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `music_band_db`.`band_member` (
  `MemberID` INT NOT NULL AUTO_INCREMENT,
  `FirstName` VARCHAR(50) NOT NULL,
  `LastName` VARCHAR(50) NOT NULL,
  `Role` VARCHAR(50) NOT NULL,
  `Email` VARCHAR(100) NULL,
  `JoinDate` DATE NULL,
  PRIMARY KEY (`MemberID`),
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `music_band_db`.`album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `music_band_db`.`album` (
  `AlbumID` INT NOT NULL AUTO_INCREMENT,
  `AlbumTitle` VARCHAR(100) NOT NULL,
  `ReleaseDate` DATE NULL,
  PRIMARY KEY (`AlbumID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `music_band_db`.`song`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `music_band_db`.`song` (
  `SongID` INT NOT NULL AUTO_INCREMENT,
  `SongTitle` VARCHAR(100) NOT NULL,
  `Duration` TIME NULL,
  `AlbumID` INT NULL,
  PRIMARY KEY (`SongID`),
  INDEX `fk_song_album_idx` (`AlbumID` ASC) VISIBLE,
  CONSTRAINT `fk_song_album`
    FOREIGN KEY (`AlbumID`)
    REFERENCES `music_band_db`.`album` (`AlbumID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `music_band_db`.`venue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `music_band_db`.`venue` (
  `VenueID` INT NOT NULL AUTO_INCREMENT,
  `VenueName` VARCHAR(100) NOT NULL,
  `City` VARCHAR(50) NULL,
  `State` VARCHAR(50) NULL,
  `Capacity` INT NULL,
  PRIMARY KEY (`VenueID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `music_band_db`.`event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `music_band_db`.`event` (
  `EventID` INT NOT NULL AUTO_INCREMENT,
  `EventName` VARCHAR(100) NOT NULL,
  `EventDate` DATE NOT NULL,
  `EventTime` TIME NULL,
  `VenueID` INT NULL,
  PRIMARY KEY (`EventID`),
  INDEX `fk_event_venue1_idx` (`VenueID` ASC) VISIBLE,
  CONSTRAINT `fk_event_venue1`
    FOREIGN KEY (`VenueID`)
    REFERENCES `music_band_db`.`venue` (`VenueID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `music_band_db`.`member_event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `music_band_db`.`member_event` (
  `MemberID` INT NOT NULL,
  `EventID` INT NOT NULL,
  `PerformanceRole` VARCHAR(50) NULL,
  PRIMARY KEY (`MemberID`, `EventID`),
  INDEX `fk_member_event_event1_idx` (`EventID` ASC) VISIBLE,
  CONSTRAINT `fk_member_event_band_member1`
    FOREIGN KEY (`MemberID`)
    REFERENCES `music_band_db`.`band_member` (`MemberID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_member_event_event1`
    FOREIGN KEY (`EventID`)
    REFERENCES `music_band_db`.`event` (`EventID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
