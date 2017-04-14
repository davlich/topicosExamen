-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Administrador` (
  `id_administrador` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NULL,
  `estado` TINYINT NOT NULL DEFAULT 0,
  `tipo` VARCHAR(45) NOT NULL DEFAULT 'Admin',
  `correo_electronico` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_administrador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Apuesta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Apuesta` (
  `id_apuesta` INT NOT NULL AUTO_INCREMENT,
  `terminos` VARCHAR(100) NOT NULL,
  `fecha_creacion` DATETIME NOT NULL,
  `duracion` DATETIME NOT NULL,
  `estado` TINYINT NOT NULL DEFAULT 1,
  `condicion` TINYINT NULL,
  `id_administrador` INT NOT NULL,
  `veces_a_pagar` DOUBLE NOT NULL DEFAULT 1.0,
  PRIMARY KEY (`id_apuesta`, `id_administrador`, `terminos`, `fecha_creacion`, `duracion`),
  INDEX `fk_Apuesta_Administrador_idx` (`id_administrador` ASC),
  CONSTRAINT `fk_Apuesta_Administrador`
    FOREIGN KEY (`id_administrador`)
    REFERENCES `mydb`.`Administrador` (`id_administrador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `monto_actual` DOUBLE NOT NULL DEFAULT 0.00,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `estado` TINYINT NOT NULL DEFAULT 0,
  `correo_electronico` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Transaccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Transaccion` (
  `id_administrador` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `detalle` VARCHAR(45) NOT NULL,
  `monto` DOUBLE NOT NULL DEFAULT 0.00,
  `fecha_transaccion` DATETIME NOT NULL,
  PRIMARY KEY (`id_administrador`, `id_cliente`),
  INDEX `fk_Administrador_has_Cliente_Cliente1_idx` (`id_cliente` ASC),
  INDEX `fk_Administrador_has_Cliente_Administrador1_idx` (`id_administrador` ASC),
  CONSTRAINT `fk_Administrador_has_Cliente_Administrador1`
    FOREIGN KEY (`id_administrador`)
    REFERENCES `mydb`.`Administrador` (`id_administrador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Administrador_has_Cliente_Cliente1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `mydb`.`Cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Oferta_Apuesta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Oferta_Apuesta` (
  `id_cliente` INT NOT NULL,
  `id_apuesta` INT NOT NULL,
  `id_administrador` INT NOT NULL,
  `terminos_apuesta` VARCHAR(100) NOT NULL,
  `fecha_creacion_apuesta` DATETIME NOT NULL,
  `duracion_apuesta` DATETIME NOT NULL,
  `monto_apostado` DOUBLE NOT NULL DEFAULT 0.00,
  `fecha_oferta` DATETIME NOT NULL,
  `condicion_a_cumplirse` TINYINT NOT NULL,
  PRIMARY KEY (`id_cliente`, `id_apuesta`, `id_administrador`, `terminos_apuesta`, `fecha_creacion_apuesta`, `duracion_apuesta`),
  INDEX `fk_Cliente_has_Apuesta_Apuesta1_idx` (`id_apuesta` ASC, `id_administrador` ASC, `terminos_apuesta` ASC, `fecha_creacion_apuesta` ASC, `duracion_apuesta` ASC),
  INDEX `fk_Cliente_has_Apuesta_Cliente1_idx` (`id_cliente` ASC),
  CONSTRAINT `fk_Cliente_has_Apuesta_Cliente1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `mydb`.`Cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_has_Apuesta_Apuesta1`
    FOREIGN KEY (`id_apuesta` , `id_administrador` , `terminos_apuesta` , `fecha_creacion_apuesta` , `duracion_apuesta`)
    REFERENCES `mydb`.`Apuesta` (`id_apuesta` , `id_administrador` , `terminos` , `fecha_creacion` , `duracion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
