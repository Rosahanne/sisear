-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema sata
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sata
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sata` DEFAULT CHARACTER SET utf8 ;
USE `sata` ;

-- -----------------------------------------------------
-- Table `sata`.`partInterno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sata`.`partInterno` (
  `Id_partInterno` INT NOT NULL,
  `nome_partInterno` VARCHAR(60) NOT NULL,
  `email_partInterno` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id_partInterno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sata`.`cadAta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sata`.`cadAta` (
  `Id_cadAta` INT NOT NULL AUTO_INCREMENT,
  `DtEmissao_cadAta` DATE NOT NULL DEFAULT NOW,
  `Titulo_cadAta` VARCHAR(100) NOT NULL,
  `DtInicio_cadAta` DATE NOT NULL,
  `DtTermino_cadAta` DATE NOT NULL,
  `PalavraChave_cadAta` VARCHAR(45) NOT NULL,
  `Id_partInterno` INT NOT NULL,
  PRIMARY KEY (`Id_cadAta`))
ENGINE = InnoDB;

CREATE INDEX `fk_cadAta1_idx` ON `sata`.`cadAta` (`Id_partInterno` ASC);


-- -----------------------------------------------------
-- Table `sata`.`partExterno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sata`.`partExterno` (
  `Id_partExterno` INT NOT NULL,
  `nome_partExterno` VARCHAR(60) NOT NULL,
  `empresa_partExterno` VARCHAR(45) NULL,
  `email_partExterno` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id_partExterno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sata`.`pautaReuniao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sata`.`pautaReuniao` (
  `Id_pautaReuniao` INT NOT NULL,
  `titulo_pautaReuniao` VARCHAR(150) NOT NULL,
  `descricao_pautaReuniao` TEXT(1000) NOT NULL,
  `Id_cadAta` INT NOT NULL,
  PRIMARY KEY (`Id_pautaReuniao`))
ENGINE = InnoDB;

CREATE INDEX `fk_pautaReuniao1_idx` ON `sata`.`pautaReuniao` (`Id_cadAta` ASC);


-- -----------------------------------------------------
-- Table `sata`.`setorReuniao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sata`.`setorReuniao` (
  `Id_setorReuniao` INT NOT NULL,
  `nome_setorReuniao` VARCHAR(45) NOT NULL,
  `Id_cadAta` INT NOT NULL,
  PRIMARY KEY (`Id_setorReuniao`))
ENGINE = InnoDB;

CREATE INDEX `fk_setorReuniao1_idx` ON `sata`.`setorReuniao` (`Id_cadAta` ASC);


-- -----------------------------------------------------
-- Table `sata`.`sugestaoRevisao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sata`.`sugestaoRevisao` (
  `Id_sugestaoRevisao` INT NOT NULL,
  `texto_sugestaoRevisao` TEXT(1000) NULL,
  `Id_partInterno` INT NOT NULL,
  PRIMARY KEY (`Id_sugestaoRevisao`))
ENGINE = InnoDB;

CREATE INDEX `fk_sugestaoRevisao1_idx` ON `sata`.`sugestaoRevisao` (`Id_partInterno` ASC);


-- -----------------------------------------------------
-- Table `sata`.`sugestaoRevisao_has_pautaReuniao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sata`.`sugestaoRevisao_has_pautaReuniao` (
  `Id_sugestaoRevisao` INT NOT NULL,
  `Id_pautaReuniao` INT NOT NULL)
ENGINE = InnoDB;

CREATE INDEX `fk_sugestaoRevisao_has_pautaReuniao2_idx` ON `sata`.`sugestaoRevisao_has_pautaReuniao` (`Id_pautaReuniao` ASC);

CREATE INDEX `fk_sugestaoRevisao_has_pautaReuniao1_idx` ON `sata`.`sugestaoRevisao_has_pautaReuniao` (`Id_sugestaoRevisao` ASC);


-- -----------------------------------------------------
-- Table `sata`.`cadAta_has_participante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sata`.`cadAta_has_participante` (
  `Id_cadAta` INT NOT NULL,
  `Id_partExterno` INT NULL,
  `Id_partInterno` INT NULL,
  `Id_participante` INT NOT NULL,
  PRIMARY KEY (`Id_participante`))
ENGINE = InnoDB;

CREATE INDEX `fk_cadAta_has_partExterno2_idx` ON `sata`.`cadAta_has_participante` (`Id_partExterno` ASC);

CREATE INDEX `fk_cadAta_has_partExterno1_idx` ON `sata`.`cadAta_has_participante` (`Id_cadAta` ASC);

CREATE INDEX `fk_cadAta_has_participante1_idx` ON `sata`.`cadAta_has_participante` (`Id_partInterno` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
