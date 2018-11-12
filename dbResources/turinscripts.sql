-- MySQL Workbench Synchronization
-- Generated: 2018-11-11 14:04
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: crisman.carmona

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `htdb` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `htdb`.`cliente` (
  `cliente_id` VARCHAR(11) NOT NULL,
  `tipodocumento_id` INT(11) NOT NULL,
  `cliente_nombre_completo` VARCHAR(100) NOT NULL,
  `cliente_celular` BIGINT(10) NOT NULL,
  `cliente_fecha_registro` DATETIME NOT NULL,
  `cliente_apellido1` VARCHAR(100) NOT NULL,
  `cliente_nombre1` VARCHAR(100) NOT NULL,
  `cliente_fecha_nacimiento` DATETIME NULL DEFAULT NULL,
  `cliente_correo` VARCHAR(100) NULL DEFAULT NULL,
  `cliente_apellido2` VARCHAR(100) NULL DEFAULT NULL,
  `cliente_nombre2` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`cliente_id`, `tipodocumento_id`),
  INDEX `fk_cliente_tipodocumento1_idx` (`tipodocumento_id` ASC),
  CONSTRAINT `fk_cliente_tipodocumento1`
    FOREIGN KEY (`tipodocumento_id`)
    REFERENCES `htdb`.`tipodocumento` (`tipodocumento_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `htdb`.`habitacion` (
  `habitacion_id` VARCHAR(4) NOT NULL,
  `habitacion_precio` DOUBLE NOT NULL,
  `habitacion_capacidad` INT(11) NOT NULL,
  `estado_id` INT(11) NOT NULL,
  `habitacion_descripcion` VARCHAR(200) NOT NULL,
  `habitacion_nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`habitacion_id`),
  INDEX `fk_habitacion_estado1_idx` (`estado_id` ASC),
  CONSTRAINT `fk_habitacion_estado1`
    FOREIGN KEY (`estado_id`)
    REFERENCES `htdb`.`estado` (`estado_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `htdb`.`arriendo` (
  `arriendo_id` INT(11) NOT NULL AUTO_INCREMENT,
  `habitacion_id` VARCHAR(4) NOT NULL,
  `cliente_id` VARCHAR(11) NOT NULL,
  `tipodocumento_id` INT(11) NOT NULL,
  `arriendo_checkin` DATETIME NOT NULL,
  `arriendo_num_acompanantes` INT(11) NOT NULL,
  `arriendo_fecha` DATETIME NOT NULL,
  `estado_id` INT(11) NOT NULL,
  `arriendo_num_noches` INT(11) NULL DEFAULT NULL,
  `arriendo_checkout` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`arriendo_id`, `habitacion_id`, `cliente_id`, `tipodocumento_id`, `estado_id`),
  INDEX `fk_arriendo_habitacion1_idx` (`habitacion_id` ASC),
  INDEX `fk_arriendo_cliente1_idx` (`cliente_id` ASC, `tipodocumento_id` ASC),
  INDEX `fk_arriendo_estado1_idx` (`estado_id` ASC),
  CONSTRAINT `fk_arriendo_habitacion1`
    FOREIGN KEY (`habitacion_id`)
    REFERENCES `htdb`.`habitacion` (`habitacion_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_arriendo_cliente1`
    FOREIGN KEY (`cliente_id` , `tipodocumento_id`)
    REFERENCES `htdb`.`cliente` (`cliente_id` , `tipodocumento_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_arriendo_estado1`
    FOREIGN KEY (`estado_id`)
    REFERENCES `htdb`.`estado` (`estado_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `htdb`.`servicioadicional` (
  `servicioadicional_id` INT(11) NOT NULL AUTO_INCREMENT,
  `servicioadicional_nombre` VARCHAR(100) NOT NULL,
  `servicioadicional_precio` DOUBLE NOT NULL,
  `estado_id` INT(11) NOT NULL,
  PRIMARY KEY (`servicioadicional_id`),
  INDEX `fk_servicioadicional_estado1_idx` (`estado_id` ASC),
  CONSTRAINT `fk_servicioadicional_estado1`
    FOREIGN KEY (`estado_id`)
    REFERENCES `htdb`.`estado` (`estado_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `htdb`.`clienteconsumo` (
  `clienteconsumo_id` INT(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` VARCHAR(11) NOT NULL,
  `tipodocumento_id` INT(11) NOT NULL,
  `clienteconsumo_saldo` DOUBLE NOT NULL,
  `clienteconsumo_total` DOUBLE NOT NULL,
  `clienteconsumo_fecha` DATETIME NOT NULL,
  `estado_id` INT(11) NOT NULL,
  PRIMARY KEY (`clienteconsumo_id`, `cliente_id`, `tipodocumento_id`),
  INDEX `fk_clienteconsumo_cliente1_idx` (`cliente_id` ASC, `tipodocumento_id` ASC),
  INDEX `fk_clienteconsumo_estado1_idx` (`estado_id` ASC),
  CONSTRAINT `fk_clienteconsumo_cliente1`
    FOREIGN KEY (`cliente_id` , `tipodocumento_id`)
    REFERENCES `htdb`.`cliente` (`cliente_id` , `tipodocumento_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_clienteconsumo_estado1`
    FOREIGN KEY (`estado_id`)
    REFERENCES `htdb`.`estado` (`estado_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `htdb`.`consumoporservicio` (
  `consumoporservicio_id` INT(11) NOT NULL AUTO_INCREMENT,
  `clienteconsumo_id` INT(11) NOT NULL,
  `servicioadicional_id` INT(11) NOT NULL,
  `servicioadicional_valor` DOUBLE NOT NULL,
  PRIMARY KEY (`consumoporservicio_id`, `clienteconsumo_id`, `servicioadicional_id`),
  INDEX `fk_clienteconsumo_has_servicioadicional_servicioadicional1_idx` (`servicioadicional_id` ASC),
  INDEX `fk_clienteconsumo_has_servicioadicional_clienteconsumo1_idx` (`clienteconsumo_id` ASC),
  CONSTRAINT `fk_clienteconsumo_has_servicioadicional_clienteconsumo1`
    FOREIGN KEY (`clienteconsumo_id`)
    REFERENCES `htdb`.`clienteconsumo` (`clienteconsumo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_clienteconsumo_has_servicioadicional_servicioadicional1`
    FOREIGN KEY (`servicioadicional_id`)
    REFERENCES `htdb`.`servicioadicional` (`servicioadicional_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `htdb`.`tipodocumento` (
  `tipodocumento_id` INT(11) NOT NULL AUTO_INCREMENT,
  `tipodocumento_nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`tipodocumento_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `htdb`.`acompanantes` (
  `acompanantes_id` INT(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` VARCHAR(11) NOT NULL,
  `tipodocumento_id` INT(11) NOT NULL,
  `arriendo_id` INT(11) NOT NULL,
  PRIMARY KEY (`acompanantes_id`, `cliente_id`, `tipodocumento_id`, `arriendo_id`),
  INDEX `fk_cliente_has_arriendo_arriendo2_idx` (`arriendo_id` ASC),
  INDEX `fk_cliente_has_arriendo_cliente2_idx` (`cliente_id` ASC, `tipodocumento_id` ASC),
  CONSTRAINT `fk_cliente_has_arriendo_cliente2`
    FOREIGN KEY (`cliente_id` , `tipodocumento_id`)
    REFERENCES `htdb`.`cliente` (`cliente_id` , `tipodocumento_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_has_arriendo_arriendo2`
    FOREIGN KEY (`arriendo_id`)
    REFERENCES `htdb`.`arriendo` (`arriendo_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `htdb`.`factura` (
  `factura_id` INT(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` VARCHAR(11) NOT NULL,
  `tipodocumento_id` INT(11) NOT NULL,
  `factura_valor` DOUBLE NOT NULL,
  `factura_fecha` DATETIME NOT NULL,
  `arriendo_id` INT(11) NULL DEFAULT NULL,
  `habitacion_id` VARCHAR(4) NULL DEFAULT NULL,
  `clienteconsumo_id` INT(11) NULL DEFAULT NULL,
  `impresionfactura_impresionfactura_id` INT(11) NULL DEFAULT NULL,
  `estado_id` INT(11) NOT NULL,
  `factura_devuelta` DOUBLE NOT NULL,
  PRIMARY KEY (`factura_id`, `cliente_id`, `tipodocumento_id`, `estado_id`),
  INDEX `fk_factura_arriendo1_idx` (`arriendo_id` ASC, `habitacion_id` ASC, `cliente_id` ASC, `tipodocumento_id` ASC),
  INDEX `fk_factura_clienteconsumo1_idx` (`clienteconsumo_id` ASC, `cliente_id` ASC, `tipodocumento_id` ASC),
  INDEX `fk_factura_impresionfactura1_idx` (`impresionfactura_impresionfactura_id` ASC),
  INDEX `fk_factura_estado1_idx` (`estado_id` ASC),
  CONSTRAINT `fk_factura_arriendo1`
    FOREIGN KEY (`arriendo_id` , `habitacion_id` , `cliente_id` , `tipodocumento_id`)
    REFERENCES `htdb`.`arriendo` (`arriendo_id` , `habitacion_id` , `cliente_id` , `tipodocumento_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_clienteconsumo1`
    FOREIGN KEY (`clienteconsumo_id` , `cliente_id` , `tipodocumento_id`)
    REFERENCES `htdb`.`clienteconsumo` (`clienteconsumo_id` , `cliente_id` , `tipodocumento_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_impresionfactura1`
    FOREIGN KEY (`impresionfactura_impresionfactura_id`)
    REFERENCES `htdb`.`impresionfactura` (`impresionfactura_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_estado1`
    FOREIGN KEY (`estado_id`)
    REFERENCES `htdb`.`estado` (`estado_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `htdb`.`mediodepago` (
  `mediodepago_id` INT(11) NOT NULL AUTO_INCREMENT,
  `mediodepago_nombre` VARCHAR(100) NOT NULL,
  `mediodepago_need_bauche` VARCHAR(1) NOT NULL,
  `mediodepago_need_devuelta` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`mediodepago_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `htdb`.`estado` (
  `estado_id` INT(11) NOT NULL AUTO_INCREMENT,
  `estado_nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`estado_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `htdb`.`impresionfactura` (
  `impresionfactura_id` INT(11) NOT NULL AUTO_INCREMENT,
  `impresionfactura_titulo` VARCHAR(400) NULL DEFAULT NULL,
  `impresionfactura_nombrehotel` VARCHAR(400) NULL DEFAULT NULL,
  `impresionfactura_rnt` VARCHAR(400) NULL DEFAULT NULL,
  `impresionfactura_redesociales` VARCHAR(400) NULL DEFAULT NULL,
  `impresionfactura_telefono1` VARCHAR(400) NULL DEFAULT NULL,
  `impresionfactura_telefono2` VARCHAR(400) NULL DEFAULT NULL,
  `impresionfactura_logo` VARCHAR(400) NULL DEFAULT NULL,
  PRIMARY KEY (`impresionfactura_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `htdb`.`correoelectronico` (
  `correoelectronico_id` INT(11) NOT NULL,
  `correoelectronico_direccion` VARCHAR(200) NULL DEFAULT NULL,
  `correoelectronico_password` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`correoelectronico_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `htdb`.`mediopagoporfactura` (
  `mediopagoporfactura_id` INT(11) NOT NULL AUTO_INCREMENT,
  `factura_id` INT(11) NOT NULL,
  `cliente_id` VARCHAR(11) NOT NULL,
  `tipodocumento_id` INT(11) NOT NULL,
  `estado_id` INT(11) NOT NULL,
  `mediodepago_id` INT(11) NOT NULL,
  `mediopagoporfactura_valor` DOUBLE NOT NULL,
  `mediopagoporfactura_num_bauche` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`mediopagoporfactura_id`, `factura_id`, `cliente_id`, `tipodocumento_id`, `estado_id`, `mediodepago_id`),
  INDEX `fk_factura_has_mediodepago_mediodepago1_idx` (`mediodepago_id` ASC),
  INDEX `fk_factura_has_mediodepago_factura1_idx` (`factura_id` ASC, `cliente_id` ASC, `tipodocumento_id` ASC, `estado_id` ASC),
  CONSTRAINT `fk_factura_has_mediodepago_factura1`
    FOREIGN KEY (`factura_id` , `cliente_id` , `tipodocumento_id` , `estado_id`)
    REFERENCES `htdb`.`factura` (`factura_id` , `cliente_id` , `tipodocumento_id` , `estado_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_has_mediodepago_mediodepago1`
    FOREIGN KEY (`mediodepago_id`)
    REFERENCES `htdb`.`mediodepago` (`mediodepago_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
