-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema trailappdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `trailappdb` ;

-- -----------------------------------------------------
-- Schema trailappdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `trailappdb` DEFAULT CHARACTER SET utf8 ;
USE `trailappdb` ;

-- -----------------------------------------------------
-- Table `trailappdb`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trailappdb`.`user` ;

CREATE TABLE IF NOT EXISTS `trailappdb`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(200) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trailappdb`.`trail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trailappdb`.`trail` ;

CREATE TABLE IF NOT EXISTS `trailappdb`.`trail` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NULL,
  `name` VARCHAR(45) NOT NULL,
  `api_id` VARCHAR(45) NOT NULL,
  `directions` BLOB NULL,
  `latitude` DOUBLE NULL,
  `longitude` DOUBLE NULL,
  `description` BLOB NULL,
  `length` DOUBLE NULL,
  `image_url` BLOB NULL,
  `activity_type` VARCHAR(45) NOT NULL DEFAULT 'Hiking',
  `recent_report_id` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trailappdb`.`report`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trailappdb`.`report` ;

CREATE TABLE IF NOT EXISTS `trailappdb`.`report` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment` TEXT(1000) NULL,
  `timestamp` DATETIME NULL DEFAULT NOW(),
  `heading` VARCHAR(255) NULL,
  `trail_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`, `trail_id`, `user_id`),
  INDEX `fk_report_trail1_idx` (`trail_id` ASC),
  INDEX `fk_report_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_report_trail1`
    FOREIGN KEY (`trail_id`)
    REFERENCES `trailappdb`.`trail` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_report_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `trailappdb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trailappdb`.`t_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trailappdb`.`t_status` ;

CREATE TABLE IF NOT EXISTS `trailappdb`.`t_status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NULL,
  `status_type` ENUM('snow', 'ground', 'passability') NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trailappdb`.`user_has_trail`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trailappdb`.`user_has_trail` ;

CREATE TABLE IF NOT EXISTS `trailappdb`.`user_has_trail` (
  `user_id` INT NOT NULL,
  `trail_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `trail_id`),
  INDEX `fk_user_has_trail_trail1_idx` (`trail_id` ASC),
  INDEX `fk_user_has_trail_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_trail_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `trailappdb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_trail_trail1`
    FOREIGN KEY (`trail_id`)
    REFERENCES `trailappdb`.`trail` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `trailappdb`.`t_status_has_report`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `trailappdb`.`t_status_has_report` ;

CREATE TABLE IF NOT EXISTS `trailappdb`.`t_status_has_report` (
  `t_status_id` INT NOT NULL,
  `report_id` INT NOT NULL,
  PRIMARY KEY (`t_status_id`, `report_id`),
  INDEX `fk_status_has_report_report1_idx` (`report_id` ASC),
  CONSTRAINT `fk_status_has_report_status1`
    FOREIGN KEY (`t_status_id`)
    REFERENCES `trailappdb`.`t_status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_status_has_report_report1`
    FOREIGN KEY (`report_id`)
    REFERENCES `trailappdb`.`report` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO trailuser@localhost;
 DROP USER trailuser@localhost;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'trailuser'@'localhost' IDENTIFIED BY 'trailuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `trailappdb`.* TO 'trailuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `trailappdb`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `trailappdb`;
INSERT INTO `trailappdb`.`user` (`id`, `email`, `password`, `first_name`, `last_name`, `description`) VALUES (1, 'test@testy.com', '1234567890', 'Tester', 'McTesterson', 'Kinda a cool guy');

COMMIT;


-- -----------------------------------------------------
-- Data for table `trailappdb`.`trail`
-- -----------------------------------------------------
START TRANSACTION;
USE `trailappdb`;
INSERT INTO `trailappdb`.`trail` (`id`, `city`, `state`, `name`, `api_id`, `directions`, `latitude`, `longitude`, `description`, `length`, `image_url`, `activity_type`, `recent_report_id`) VALUES (1, 'Denver', 'Colorado', 'Orange Rocks', 'not a real id', NULL, 100, 100, NULL, NULL, NULL, 'hiking', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `trailappdb`.`report`
-- -----------------------------------------------------
START TRANSACTION;
USE `trailappdb`;
INSERT INTO `trailappdb`.`report` (`id`, `comment`, `timestamp`, `heading`, `trail_id`, `user_id`) VALUES (1, 'Trail conditions were awful!', NULL, 'Awful!', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `trailappdb`.`t_status`
-- -----------------------------------------------------
START TRANSACTION;
USE `trailappdb`;
INSERT INTO `trailappdb`.`t_status` (`id`, `name`, `status_type`) VALUES (1, 'heavy snow', 'snow');
INSERT INTO `trailappdb`.`t_status` (`id`, `name`, `status_type`) VALUES (2, 'muddy', 'ground');
INSERT INTO `trailappdb`.`t_status` (`id`, `name`, `status_type`) VALUES (3, 'open and passable', 'passability');

COMMIT;


-- -----------------------------------------------------
-- Data for table `trailappdb`.`user_has_trail`
-- -----------------------------------------------------
START TRANSACTION;
USE `trailappdb`;
INSERT INTO `trailappdb`.`user_has_trail` (`user_id`, `trail_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `trailappdb`.`t_status_has_report`
-- -----------------------------------------------------
START TRANSACTION;
USE `trailappdb`;
INSERT INTO `trailappdb`.`t_status_has_report` (`t_status_id`, `report_id`) VALUES (1, 1);
INSERT INTO `trailappdb`.`t_status_has_report` (`t_status_id`, `report_id`) VALUES (2, 1);
INSERT INTO `trailappdb`.`t_status_has_report` (`t_status_id`, `report_id`) VALUES (3, 1);

COMMIT;

