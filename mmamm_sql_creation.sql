-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema rollandgaross_tournment_organistaion
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `rollandgaross_tournment_organistaion` ;

-- -----------------------------------------------------
-- Schema rollandgaross_tournment_organistaion
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rollandgaross_tournment_organistaion` DEFAULT CHARACTER SET utf8 ;
USE `rollandgaross_tournment_organistaion` ;

-- -----------------------------------------------------
-- Table `rollandgaross_tournment_organistaion`.`court`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rollandgaross_tournment_organistaion`.`court` ;

CREATE TABLE IF NOT EXISTS `rollandgaross_tournment_organistaion`.`court` (
  `c_no` INT NOT NULL,
  `c_name` VARCHAR(45) NULL,
  `c_size` VARCHAR(45) NULL,
  PRIMARY KEY (`c_no`),
  UNIQUE INDEX `c_no_UNIQUE` (`c_no` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rollandgaross_tournment_organistaion`.`coatch`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rollandgaross_tournment_organistaion`.`coatch` ;

CREATE TABLE IF NOT EXISTS `rollandgaross_tournment_organistaion`.`coatch` (
  `cid` INT NOT NULL,
  `ccountry` VARCHAR(45) NULL,
  `cfname` VARCHAR(45) NOT NULL,
  `cminit` VARCHAR(1) NOT NULL,
  `clname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rollandgaross_tournment_organistaion`.`player`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rollandgaross_tournment_organistaion`.`player` ;

CREATE TABLE IF NOT EXISTS `rollandgaross_tournment_organistaion`.`player` (
  `pid` INT NOT NULL,
  `pfname` VARCHAR(45) NOT NULL,
  `minit` VARCHAR(1) NOT NULL,
  `plname` VARCHAR(45) NOT NULL,
  `pcountry` VARCHAR(45) NULL,
  `pheight` FLOAT NULL,
  `pwieght` FLOAT NULL,
  `phand` VARCHAR(1) NOT NULL,
  `prank` INT NULL,
  `coatch_cid` INT NOT NULL,
  PRIMARY KEY (`pid`),
  INDEX `fk_player_coatch1_idx` (`coatch_cid` ASC),
  CONSTRAINT `fk_player_coatch1`
    FOREIGN KEY (`coatch_cid`)
    REFERENCES `rollandgaross_tournment_organistaion`.`coatch` (`cid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rollandgaross_tournment_organistaion`.`matchh`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rollandgaross_tournment_organistaion`.`matchh` ;

CREATE TABLE IF NOT EXISTS `rollandgaross_tournment_organistaion`.`matchh` (
  `mno` INT NOT NULL,
  `mdate` VARCHAR(45) NOT NULL,
  `mstime` TIME NULL,
  `mdtime` TIME NULL,
  `court_c_no` INT NOT NULL,
  PRIMARY KEY (`mno`),
  INDEX `fk_match_court1_idx` (`court_c_no` ASC),
  CONSTRAINT `fk_match_court1`
    FOREIGN KEY (`court_c_no`)
    REFERENCES `rollandgaross_tournment_organistaion`.`court` (`c_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rollandgaross_tournment_organistaion`.`referee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rollandgaross_tournment_organistaion`.`referee` ;

CREATE TABLE IF NOT EXISTS `rollandgaross_tournment_organistaion`.`referee` (
  `rid` INT NOT NULL,
  `rfname` VARCHAR(45) NOT NULL,
  `rminit` VARCHAR(1) NOT NULL,
  `rlname` VARCHAR(45) NOT NULL,
  `rcountry` VARCHAR(45) NULL,
  PRIMARY KEY (`rid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rollandgaross_tournment_organistaion`.`umprella_ref`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rollandgaross_tournment_organistaion`.`umprella_ref` ;

CREATE TABLE IF NOT EXISTS `rollandgaross_tournment_organistaion`.`umprella_ref` (
  `ryexperiance` FLOAT NULL,
  `referee_rid` INT NOT NULL,
  INDEX `fk_umprella_ref_referee1_idx` (`referee_rid` ASC),
  PRIMARY KEY (`referee_rid`),
  CONSTRAINT `fk_umprella_ref_referee1`
    FOREIGN KEY (`referee_rid`)
    REFERENCES `rollandgaross_tournment_organistaion`.`referee` (`rid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rollandgaross_tournment_organistaion`.`line_ref`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rollandgaross_tournment_organistaion`.`line_ref` ;

CREATE TABLE IF NOT EXISTS `rollandgaross_tournment_organistaion`.`line_ref` (
  `position` VARCHAR(45) NULL,
  `referee_rid` INT NOT NULL,
  INDEX `fk_line_ref_referee1_idx` (`referee_rid` ASC),
  PRIMARY KEY (`referee_rid`),
  CONSTRAINT `fk_line_ref_referee1`
    FOREIGN KEY (`referee_rid`)
    REFERENCES `rollandgaross_tournment_organistaion`.`referee` (`rid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rollandgaross_tournment_organistaion`.`sponser`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rollandgaross_tournment_organistaion`.`sponser` ;

CREATE TABLE IF NOT EXISTS `rollandgaross_tournment_organistaion`.`sponser` (
  `sname` VARCHAR(45) NOT NULL,
  `syearpaid` FLOAT NULL,
  `spid` INT NOT NULL,
  `scode` INT NOT NULL,
  PRIMARY KEY (`spid`, `scode`),
  CONSTRAINT `fk_sponser_player1`
    FOREIGN KEY (`spid`)
    REFERENCES `rollandgaross_tournment_organistaion`.`player` (`pid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rollandgaross_tournment_organistaion`.`employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rollandgaross_tournment_organistaion`.`employee` ;

CREATE TABLE IF NOT EXISTS `rollandgaross_tournment_organistaion`.`employee` (
  `eid` INT NOT NULL,
  `efname` VARCHAR(45) NOT NULL,
  `eminit` VARCHAR(1) NOT NULL,
  `elname` VARCHAR(45) NOT NULL,
  `ebirthdate` VARCHAR(45) NULL,
  PRIMARY KEY (`eid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rollandgaross_tournment_organistaion`.`weekly_salary`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rollandgaross_tournment_organistaion`.`weekly_salary` ;

CREATE TABLE IF NOT EXISTS `rollandgaross_tournment_organistaion`.`weekly_salary` (
  `wsalary` FLOAT NOT NULL,
  `employee_eid` INT NOT NULL,
  INDEX `fk_weekly_salary_employee1_idx` (`employee_eid` ASC),
  PRIMARY KEY (`employee_eid`),
  CONSTRAINT `fk_weekly_salary_employee1`
    FOREIGN KEY (`employee_eid`)
    REFERENCES `rollandgaross_tournment_organistaion`.`employee` (`eid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rollandgaross_tournment_organistaion`.`daily_salary`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rollandgaross_tournment_organistaion`.`daily_salary` ;

CREATE TABLE IF NOT EXISTS `rollandgaross_tournment_organistaion`.`daily_salary` (
  `dsalary` FLOAT NULL,
  `employee_eid` INT NOT NULL,
  INDEX `fk_daily_salary_employee1_idx` (`employee_eid` ASC),
  PRIMARY KEY (`employee_eid`),
  CONSTRAINT `fk_daily_salary_employee1`
    FOREIGN KEY (`employee_eid`)
    REFERENCES `rollandgaross_tournment_organistaion`.`employee` (`eid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rollandgaross_tournment_organistaion`.`gard`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rollandgaross_tournment_organistaion`.`gard` ;

CREATE TABLE IF NOT EXISTS `rollandgaross_tournment_organistaion`.`gard` (
  `yearofex` FLOAT NULL,
  `gheight` FLOAT NULL,
  `gweight` FLOAT NULL,
  `employee_eid` INT NULL,
  PRIMARY KEY (`employee_eid`),
  INDEX `fk_gard_employee1_idx` (`employee_eid` ASC),
  CONSTRAINT `fk_gard_employee1`
    FOREIGN KEY (`employee_eid`)
    REFERENCES `rollandgaross_tournment_organistaion`.`employee` (`eid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rollandgaross_tournment_organistaion`.`ball_boy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rollandgaross_tournment_organistaion`.`ball_boy` ;

CREATE TABLE IF NOT EXISTS `rollandgaross_tournment_organistaion`.`ball_boy` (
  `baccademyname` VARCHAR(45) NOT NULL,
  `employee_eid` INT NULL,
  INDEX `fk_ball_boy_employee1_idx` (`employee_eid` ASC),
  PRIMARY KEY (`employee_eid`),
  CONSTRAINT `fk_ball_boy_employee1`
    FOREIGN KEY (`employee_eid`)
    REFERENCES `rollandgaross_tournment_organistaion`.`employee` (`eid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rollandgaross_tournment_organistaion`.`fan`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rollandgaross_tournment_organistaion`.`fan` ;

CREATE TABLE IF NOT EXISTS `rollandgaross_tournment_organistaion`.`fan` (
  `ffname` VARCHAR(45) NOT NULL,
  `fminit` VARCHAR(1) NOT NULL,
  `flname` VARCHAR(45) NOT NULL,
  `fcountry` VARCHAR(45) NULL,
  `fid` INT NOT NULL,
  PRIMARY KEY (`fid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rollandgaross_tournment_organistaion`.`play`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rollandgaross_tournment_organistaion`.`play` ;

CREATE TABLE IF NOT EXISTS `rollandgaross_tournment_organistaion`.`play` (
  `player_pid` INT NOT NULL,
  `match_mno` INT NOT NULL,
  `score` INT NULL,
  PRIMARY KEY (`player_pid`, `match_mno`),
  INDEX `fk_player_has_court_player_idx` (`player_pid` ASC),
  INDEX `fk_player_has_court_match1_idx` (`match_mno` ASC),
  CONSTRAINT `fk_player_has_court_player`
    FOREIGN KEY (`player_pid`)
    REFERENCES `rollandgaross_tournment_organistaion`.`player` (`pid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_player_has_court_match1`
    FOREIGN KEY (`match_mno`)
    REFERENCES `rollandgaross_tournment_organistaion`.`matchh` (`mno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rollandgaross_tournment_organistaion`.`has`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rollandgaross_tournment_organistaion`.`has` ;

CREATE TABLE IF NOT EXISTS `rollandgaross_tournment_organistaion`.`has` (
  `match_mno` INT NOT NULL,
  `referee_rid` INT NOT NULL,
  PRIMARY KEY (`match_mno`, `referee_rid`),
  INDEX `fk_match_has_referee_referee1_idx` (`referee_rid` ASC),
  INDEX `fk_match_has_referee_match1_idx` (`match_mno` ASC),
  CONSTRAINT `fk_match_has_referee_match1`
    FOREIGN KEY (`match_mno`)
    REFERENCES `rollandgaross_tournment_organistaion`.`matchh` (`mno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_match_has_referee_referee1`
    FOREIGN KEY (`referee_rid`)
    REFERENCES `rollandgaross_tournment_organistaion`.`referee` (`rid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rollandgaross_tournment_organistaion`.`fan_has_match`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rollandgaross_tournment_organistaion`.`fan_has_match` ;

CREATE TABLE IF NOT EXISTS `rollandgaross_tournment_organistaion`.`fan_has_match` (
  `fan_fid` INT NOT NULL,
  `match_mno` INT NULL,
  PRIMARY KEY (`fan_fid`, `match_mno`),
  INDEX `fk_fan_has_match_match1_idx` (`match_mno` ASC),
  INDEX `fk_fan_has_match_fan1_idx` (`fan_fid` ASC),
  CONSTRAINT `fk_fan_has_match_fan1`
    FOREIGN KEY (`fan_fid`)
    REFERENCES `rollandgaross_tournment_organistaion`.`fan` (`fid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fan_has_match_match1`
    FOREIGN KEY (`match_mno`)
    REFERENCES `rollandgaross_tournment_organistaion`.`matchh` (`mno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rollandgaross_tournment_organistaion`.`court_has_employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rollandgaross_tournment_organistaion`.`court_has_employee` ;

CREATE TABLE IF NOT EXISTS `rollandgaross_tournment_organistaion`.`court_has_employee` (
  `employee_eid` INT NOT NULL,
  `court_c_no` INT NOT NULL,
  PRIMARY KEY (`employee_eid`, `court_c_no`),
  INDEX `fk_employee_has_court_court1_idx` (`court_c_no` ASC),
  INDEX `fk_employee_has_court_employee1_idx` (`employee_eid` ASC),
  CONSTRAINT `fk_employee_has_court_employee1`
    FOREIGN KEY (`employee_eid`)
    REFERENCES `rollandgaross_tournment_organistaion`.`employee` (`eid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_employee_has_court_court1`
    FOREIGN KEY (`court_c_no`)
    REFERENCES `rollandgaross_tournment_organistaion`.`court` (`c_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `rollandgaross_tournment_organistaion`.`court`
-- -----------------------------------------------------
START TRANSACTION;
USE `rollandgaross_tournment_organistaion`;
INSERT INTO `rollandgaross_tournment_organistaion`.`court` (`c_no`, `c_name`, `c_size`) VALUES (1, 'philippe', '78*21');
INSERT INTO `rollandgaross_tournment_organistaion`.`court` (`c_no`, `c_name`, `c_size`) VALUES (2, 'suzanne', '78*22');
INSERT INTO `rollandgaross_tournment_organistaion`.`court` (`c_no`, `c_name`, `c_size`) VALUES (3, 'simmone', '78*21');
INSERT INTO `rollandgaross_tournment_organistaion`.`court` (`c_no`, `c_name`, `c_size`) VALUES (4, 'lenglen', '78*20');

COMMIT;


-- -----------------------------------------------------
-- Data for table `rollandgaross_tournment_organistaion`.`coatch`
-- -----------------------------------------------------
START TRANSACTION;
USE `rollandgaross_tournment_organistaion`;
INSERT INTO `rollandgaross_tournment_organistaion`.`coatch` (`cid`, `ccountry`, `cfname`, `cminit`, `clname`) VALUES (123, 'spain', 'will', 'a', 'smith');
INSERT INTO `rollandgaross_tournment_organistaion`.`coatch` (`cid`, `ccountry`, `cfname`, `cminit`, `clname`) VALUES (234, 'egypt', 'mohsen', 'b', 'ahmed');
INSERT INTO `rollandgaross_tournment_organistaion`.`coatch` (`cid`, `ccountry`, `cfname`, `cminit`, `clname`) VALUES (345, 'spain', 'juan', 'c', 'delpo');
INSERT INTO `rollandgaross_tournment_organistaion`.`coatch` (`cid`, `ccountry`, `cfname`, `cminit`, `clname`) VALUES (456, 'germany', 'michel', 'd', 'filib');
INSERT INTO `rollandgaross_tournment_organistaion`.`coatch` (`cid`, `ccountry`, `cfname`, `cminit`, `clname`) VALUES (567, 'russia', 'victor', 'd', 'hamdon');
INSERT INTO `rollandgaross_tournment_organistaion`.`coatch` (`cid`, `ccountry`, `cfname`, `cminit`, `clname`) VALUES (678, 'germany', 'muller', 'e', 'peter');
INSERT INTO `rollandgaross_tournment_organistaion`.`coatch` (`cid`, `ccountry`, `cfname`, `cminit`, `clname`) VALUES (789, 'morocco', 'amrabet', 'f', 'ali');
INSERT INTO `rollandgaross_tournment_organistaion`.`coatch` (`cid`, `ccountry`, `cfname`, `cminit`, `clname`) VALUES (987, 'spain', 'juan', 'g', 'andy');

COMMIT;


-- -----------------------------------------------------
-- Data for table `rollandgaross_tournment_organistaion`.`player`
-- -----------------------------------------------------
START TRANSACTION;
USE `rollandgaross_tournment_organistaion`;
INSERT INTO `rollandgaross_tournment_organistaion`.`player` (`pid`, `pfname`, `minit`, `plname`, `pcountry`, `pheight`, `pwieght`, `phand`, `prank`, `coatch_cid`) VALUES (111, 'rafael', 'b', 'nadal', 'spain', 190, 90, 'l', 1, 123);
INSERT INTO `rollandgaross_tournment_organistaion`.`player` (`pid`, `pfname`, `minit`, `plname`, `pcountry`, `pheight`, `pwieght`, `phand`, `prank`, `coatch_cid`) VALUES (222, 'roger', 'a', 'federer', 'switzerland', 190, 90, 'r', 2, 234);
INSERT INTO `rollandgaross_tournment_organistaion`.`player` (`pid`, `pfname`, `minit`, `plname`, `pcountry`, `pheight`, `pwieght`, `phand`, `prank`, `coatch_cid`) VALUES (333, 'novak', 'c', 'djocovic', 'serbia', 180, 80, 'r', 3, 345);
INSERT INTO `rollandgaross_tournment_organistaion`.`player` (`pid`, `pfname`, `minit`, `plname`, `pcountry`, `pheight`, `pwieght`, `phand`, `prank`, `coatch_cid`) VALUES (444, 'alexander', 'd', 'zverev', 'germany', 180, 80, 'r', 4, 456);
INSERT INTO `rollandgaross_tournment_organistaion`.`player` (`pid`, `pfname`, `minit`, `plname`, `pcountry`, `pheight`, `pwieght`, `phand`, `prank`, `coatch_cid`) VALUES (555, 'carlos', 'e', 'alcaraz', 'spain', 185, 85, 'r', 5, 567);
INSERT INTO `rollandgaross_tournment_organistaion`.`player` (`pid`, `pfname`, `minit`, `plname`, `pcountry`, `pheight`, `pwieght`, `phand`, `prank`, `coatch_cid`) VALUES (666, 'danial', 'f', 'medvedev', 'russia', 192, 92, 'r', 6, 678);
INSERT INTO `rollandgaross_tournment_organistaion`.`player` (`pid`, `pfname`, `minit`, `plname`, `pcountry`, `pheight`, `pwieght`, `phand`, `prank`, `coatch_cid`) VALUES (777, 'andry', 'g', 'rublev', 'russia', 188, 87, 'r', 7, 789);
INSERT INTO `rollandgaross_tournment_organistaion`.`player` (`pid`, `pfname`, `minit`, `plname`, `pcountry`, `pheight`, `pwieght`, `phand`, `prank`, `coatch_cid`) VALUES (888, 'ahmed', 'a', 'ali', 'egypt', 166, 66, 'l', 8, 987);

COMMIT;


-- -----------------------------------------------------
-- Data for table `rollandgaross_tournment_organistaion`.`matchh`
-- -----------------------------------------------------
START TRANSACTION;
USE `rollandgaross_tournment_organistaion`;
INSERT INTO `rollandgaross_tournment_organistaion`.`matchh` (`mno`, `mdate`, `mstime`, `mdtime`, `court_c_no`) VALUES (11, '16-12-2023', '8:00:00', '10:00:00', 1);
INSERT INTO `rollandgaross_tournment_organistaion`.`matchh` (`mno`, `mdate`, `mstime`, `mdtime`, `court_c_no`) VALUES (22, '16-12-2023', '10:00:00', '12:00:00', 1);
INSERT INTO `rollandgaross_tournment_organistaion`.`matchh` (`mno`, `mdate`, `mstime`, `mdtime`, `court_c_no`) VALUES (33, '16-12-2023', '12:00:00', '2:00:00', 2);
INSERT INTO `rollandgaross_tournment_organistaion`.`matchh` (`mno`, `mdate`, `mstime`, `mdtime`, `court_c_no`) VALUES (44, '16-12-2023', '2:00:00', '4:00:00', 2);
INSERT INTO `rollandgaross_tournment_organistaion`.`matchh` (`mno`, `mdate`, `mstime`, `mdtime`, `court_c_no`) VALUES (55, '20-12-2023', '8:00:00', '10:00:00', 3);
INSERT INTO `rollandgaross_tournment_organistaion`.`matchh` (`mno`, `mdate`, `mstime`, `mdtime`, `court_c_no`) VALUES (66, '20-12-2023', '12:00:00', '2:00:00', 3);
INSERT INTO `rollandgaross_tournment_organistaion`.`matchh` (`mno`, `mdate`, `mstime`, `mdtime`, `court_c_no`) VALUES (77, '25-12-2023', '8:00:00', '10:00:00', 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `rollandgaross_tournment_organistaion`.`referee`
-- -----------------------------------------------------
START TRANSACTION;
USE `rollandgaross_tournment_organistaion`;
INSERT INTO `rollandgaross_tournment_organistaion`.`referee` (`rid`, `rfname`, `rminit`, `rlname`, `rcountry`) VALUES (1, 'brono', 'a', 'fernandes', 'spain');
INSERT INTO `rollandgaross_tournment_organistaion`.`referee` (`rid`, `rfname`, `rminit`, `rlname`, `rcountry`) VALUES (2, 'ahmed', 'b', 'hakeem', 'egypt');
INSERT INTO `rollandgaross_tournment_organistaion`.`referee` (`rid`, `rfname`, `rminit`, `rlname`, `rcountry`) VALUES (3, 'mahmoud', 'c', 'reffat', 'spain');
INSERT INTO `rollandgaross_tournment_organistaion`.`referee` (`rid`, `rfname`, `rminit`, `rlname`, `rcountry`) VALUES (4, 'mahmed', 'd', 'hamdon', 'germany');
INSERT INTO `rollandgaross_tournment_organistaion`.`referee` (`rid`, `rfname`, `rminit`, `rlname`, `rcountry`) VALUES (5, 'mahmed', 'e', 'ashraf', 'germany');
INSERT INTO `rollandgaross_tournment_organistaion`.`referee` (`rid`, `rfname`, `rminit`, `rlname`, `rcountry`) VALUES (6, 'mahmed', 'f', 'hoba', 'spain');
INSERT INTO `rollandgaross_tournment_organistaion`.`referee` (`rid`, `rfname`, `rminit`, `rlname`, `rcountry`) VALUES (7, 'ali', 'g', 'taha', 'egypt');
INSERT INTO `rollandgaross_tournment_organistaion`.`referee` (`rid`, `rfname`, `rminit`, `rlname`, `rcountry`) VALUES (8, 'mohamed', 'h', 'lehyani', 'france');
INSERT INTO `rollandgaross_tournment_organistaion`.`referee` (`rid`, `rfname`, `rminit`, `rlname`, `rcountry`) VALUES (9, 'will', 'i', 'hakeem', 'france');

COMMIT;


-- -----------------------------------------------------
-- Data for table `rollandgaross_tournment_organistaion`.`umprella_ref`
-- -----------------------------------------------------
START TRANSACTION;
USE `rollandgaross_tournment_organistaion`;
INSERT INTO `rollandgaross_tournment_organistaion`.`umprella_ref` (`ryexperiance`, `referee_rid`) VALUES (6, 1);
INSERT INTO `rollandgaross_tournment_organistaion`.`umprella_ref` (`ryexperiance`, `referee_rid`) VALUES (5, 2);
INSERT INTO `rollandgaross_tournment_organistaion`.`umprella_ref` (`ryexperiance`, `referee_rid`) VALUES (4, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `rollandgaross_tournment_organistaion`.`line_ref`
-- -----------------------------------------------------
START TRANSACTION;
USE `rollandgaross_tournment_organistaion`;
INSERT INTO `rollandgaross_tournment_organistaion`.`line_ref` (`position`, `referee_rid`) VALUES ('left back', 4);
INSERT INTO `rollandgaross_tournment_organistaion`.`line_ref` (`position`, `referee_rid`) VALUES ('right back', 5);
INSERT INTO `rollandgaross_tournment_organistaion`.`line_ref` (`position`, `referee_rid`) VALUES ('left front', 6);
INSERT INTO `rollandgaross_tournment_organistaion`.`line_ref` (`position`, `referee_rid`) VALUES ('right front', 7);
INSERT INTO `rollandgaross_tournment_organistaion`.`line_ref` (`position`, `referee_rid`) VALUES ('line1', 8);
INSERT INTO `rollandgaross_tournment_organistaion`.`line_ref` (`position`, `referee_rid`) VALUES ('line2', 9);

COMMIT;


-- -----------------------------------------------------
-- Data for table `rollandgaross_tournment_organistaion`.`sponser`
-- -----------------------------------------------------
START TRANSACTION;
USE `rollandgaross_tournment_organistaion`;
INSERT INTO `rollandgaross_tournment_organistaion`.`sponser` (`sname`, `syearpaid`, `spid`, `scode`) VALUES ('nike', 3, 111, 1);
INSERT INTO `rollandgaross_tournment_organistaion`.`sponser` (`sname`, `syearpaid`, `spid`, `scode`) VALUES ('addidas', 2, 222, 2);
INSERT INTO `rollandgaross_tournment_organistaion`.`sponser` (`sname`, `syearpaid`, `spid`, `scode`) VALUES ('puma', 3, 333, 3);
INSERT INTO `rollandgaross_tournment_organistaion`.`sponser` (`sname`, `syearpaid`, `spid`, `scode`) VALUES ('babolat', 3, 444, 4);
INSERT INTO `rollandgaross_tournment_organistaion`.`sponser` (`sname`, `syearpaid`, `spid`, `scode`) VALUES ('wilson', 2, 555, 5);
INSERT INTO `rollandgaross_tournment_organistaion`.`sponser` (`sname`, `syearpaid`, `spid`, `scode`) VALUES ('bp', 3, 666, 6);
INSERT INTO `rollandgaross_tournment_organistaion`.`sponser` (`sname`, `syearpaid`, `spid`, `scode`) VALUES ('rolex', 2, 777, 7);
INSERT INTO `rollandgaross_tournment_organistaion`.`sponser` (`sname`, `syearpaid`, `spid`, `scode`) VALUES ('casio', 3, 888, 8);

COMMIT;


-- -----------------------------------------------------
-- Data for table `rollandgaross_tournment_organistaion`.`employee`
-- -----------------------------------------------------
START TRANSACTION;
USE `rollandgaross_tournment_organistaion`;
INSERT INTO `rollandgaross_tournment_organistaion`.`employee` (`eid`, `efname`, `eminit`, `elname`, `ebirthdate`) VALUES (1111, 'medo', 'a', 'walid', '13-12-2006');
INSERT INTO `rollandgaross_tournment_organistaion`.`employee` (`eid`, `efname`, `eminit`, `elname`, `ebirthdate`) VALUES (2222, 'tamer', 'b', 'ahmed', '14-12-2004');
INSERT INTO `rollandgaross_tournment_organistaion`.`employee` (`eid`, `efname`, `eminit`, `elname`, `ebirthdate`) VALUES (3333, 'mahmed', 'c', 'ahmed', '03-12-1998');
INSERT INTO `rollandgaross_tournment_organistaion`.`employee` (`eid`, `efname`, `eminit`, `elname`, `ebirthdate`) VALUES (4444, 'samr', 'd', 'rami', '16-12-1997');
INSERT INTO `rollandgaross_tournment_organistaion`.`employee` (`eid`, `efname`, `eminit`, `elname`, `ebirthdate`) VALUES (5555, 'samy', 'e', 'ramiz', '20-12-1999');
INSERT INTO `rollandgaross_tournment_organistaion`.`employee` (`eid`, `efname`, `eminit`, `elname`, `ebirthdate`) VALUES (6666, 'timothy', 'f', 'patrec', '13-12-1998');
INSERT INTO `rollandgaross_tournment_organistaion`.`employee` (`eid`, `efname`, `eminit`, `elname`, `ebirthdate`) VALUES (7777, 'karim', 'g', 'mahmed', '18-10-1996');
INSERT INTO `rollandgaross_tournment_organistaion`.`employee` (`eid`, `efname`, `eminit`, `elname`, `ebirthdate`) VALUES (8888, 'yaya', 'h', 'asfy', '13-12-2000');

COMMIT;


-- -----------------------------------------------------
-- Data for table `rollandgaross_tournment_organistaion`.`weekly_salary`
-- -----------------------------------------------------
START TRANSACTION;
USE `rollandgaross_tournment_organistaion`;
INSERT INTO `rollandgaross_tournment_organistaion`.`weekly_salary` (`wsalary`, `employee_eid`) VALUES (1230, 1111);
INSERT INTO `rollandgaross_tournment_organistaion`.`weekly_salary` (`wsalary`, `employee_eid`) VALUES (1300, 2222);
INSERT INTO `rollandgaross_tournment_organistaion`.`weekly_salary` (`wsalary`, `employee_eid`) VALUES (2222, 3333);
INSERT INTO `rollandgaross_tournment_organistaion`.`weekly_salary` (`wsalary`, `employee_eid`) VALUES (2000, 4444);
INSERT INTO `rollandgaross_tournment_organistaion`.`weekly_salary` (`wsalary`, `employee_eid`) VALUES (2300, 5555);

COMMIT;


-- -----------------------------------------------------
-- Data for table `rollandgaross_tournment_organistaion`.`daily_salary`
-- -----------------------------------------------------
START TRANSACTION;
USE `rollandgaross_tournment_organistaion`;
INSERT INTO `rollandgaross_tournment_organistaion`.`daily_salary` (`dsalary`, `employee_eid`) VALUES (150, 6666);
INSERT INTO `rollandgaross_tournment_organistaion`.`daily_salary` (`dsalary`, `employee_eid`) VALUES (200, 7777);
INSERT INTO `rollandgaross_tournment_organistaion`.`daily_salary` (`dsalary`, `employee_eid`) VALUES (250, 8888);

COMMIT;


-- -----------------------------------------------------
-- Data for table `rollandgaross_tournment_organistaion`.`gard`
-- -----------------------------------------------------
START TRANSACTION;
USE `rollandgaross_tournment_organistaion`;
INSERT INTO `rollandgaross_tournment_organistaion`.`gard` (`yearofex`, `gheight`, `gweight`, `employee_eid`) VALUES (3, 180, 80, 3333);
INSERT INTO `rollandgaross_tournment_organistaion`.`gard` (`yearofex`, `gheight`, `gweight`, `employee_eid`) VALUES (5, 190, 90, 4444);
INSERT INTO `rollandgaross_tournment_organistaion`.`gard` (`yearofex`, `gheight`, `gweight`, `employee_eid`) VALUES (6, 187, 87, 5555);
INSERT INTO `rollandgaross_tournment_organistaion`.`gard` (`yearofex`, `gheight`, `gweight`, `employee_eid`) VALUES (3, 188, 88, 6666);
INSERT INTO `rollandgaross_tournment_organistaion`.`gard` (`yearofex`, `gheight`, `gweight`, `employee_eid`) VALUES (4, 190, 90, 7777);

COMMIT;


-- -----------------------------------------------------
-- Data for table `rollandgaross_tournment_organistaion`.`ball_boy`
-- -----------------------------------------------------
START TRANSACTION;
USE `rollandgaross_tournment_organistaion`;
INSERT INTO `rollandgaross_tournment_organistaion`.`ball_boy` (`baccademyname`, `employee_eid`) VALUES ('rafaelnadal accademy', 1111);
INSERT INTO `rollandgaross_tournment_organistaion`.`ball_boy` (`baccademyname`, `employee_eid`) VALUES ('patric accademy', 2222);
INSERT INTO `rollandgaross_tournment_organistaion`.`ball_boy` (`baccademyname`, `employee_eid`) VALUES ('ahly accademy', 8888);

COMMIT;


-- -----------------------------------------------------
-- Data for table `rollandgaross_tournment_organistaion`.`fan`
-- -----------------------------------------------------
START TRANSACTION;
USE `rollandgaross_tournment_organistaion`;
INSERT INTO `rollandgaross_tournment_organistaion`.`fan` (`ffname`, `fminit`, `flname`, `fcountry`, `fid`) VALUES ('ahmed', 'a', 'omar', 'france', 1);
INSERT INTO `rollandgaross_tournment_organistaion`.`fan` (`ffname`, `fminit`, `flname`, `fcountry`, `fid`) VALUES ('mahmed', 'b', 'hamed', 'spain', 2);
INSERT INTO `rollandgaross_tournment_organistaion`.`fan` (`ffname`, `fminit`, `flname`, `fcountry`, `fid`) VALUES ('micheal', 'c', 'peter', 'spain', 3);
INSERT INTO `rollandgaross_tournment_organistaion`.`fan` (`ffname`, `fminit`, `flname`, `fcountry`, `fid`) VALUES ('sara', 'd', 'emad', 'france', 4);
INSERT INTO `rollandgaross_tournment_organistaion`.`fan` (`ffname`, `fminit`, `flname`, `fcountry`, `fid`) VALUES ('nada', 'e', 'naser', 'egypt', 5);
INSERT INTO `rollandgaross_tournment_organistaion`.`fan` (`ffname`, `fminit`, `flname`, `fcountry`, `fid`) VALUES ('maha', 'f', 'ahmed', 'germany', 6);
INSERT INTO `rollandgaross_tournment_organistaion`.`fan` (`ffname`, `fminit`, `flname`, `fcountry`, `fid`) VALUES ('omar', 'g', 'qady', 'russia', 7);
INSERT INTO `rollandgaross_tournment_organistaion`.`fan` (`ffname`, `fminit`, `flname`, `fcountry`, `fid`) VALUES ('jack', 'h', 'sock', 'france', 8);
INSERT INTO `rollandgaross_tournment_organistaion`.`fan` (`ffname`, `fminit`, `flname`, `fcountry`, `fid`) VALUES ('nour', 'i', 'ali', 'egypt', 9);
INSERT INTO `rollandgaross_tournment_organistaion`.`fan` (`ffname`, `fminit`, `flname`, `fcountry`, `fid`) VALUES ('rabab', 'j', 'mahmed', 'france', 10);
INSERT INTO `rollandgaross_tournment_organistaion`.`fan` (`ffname`, `fminit`, `flname`, `fcountry`, `fid`) VALUES ('peter', 'k', 'meteas', 'france', 11);

COMMIT;


-- -----------------------------------------------------
-- Data for table `rollandgaross_tournment_organistaion`.`play`
-- -----------------------------------------------------
START TRANSACTION;
USE `rollandgaross_tournment_organistaion`;
INSERT INTO `rollandgaross_tournment_organistaion`.`play` (`player_pid`, `match_mno`, `score`) VALUES (111, 11, 3);
INSERT INTO `rollandgaross_tournment_organistaion`.`play` (`player_pid`, `match_mno`, `score`) VALUES (222, 11, 0);
INSERT INTO `rollandgaross_tournment_organistaion`.`play` (`player_pid`, `match_mno`, `score`) VALUES (333, 22, 3);
INSERT INTO `rollandgaross_tournment_organistaion`.`play` (`player_pid`, `match_mno`, `score`) VALUES (444, 22, 1);
INSERT INTO `rollandgaross_tournment_organistaion`.`play` (`player_pid`, `match_mno`, `score`) VALUES (555, 33, 3);
INSERT INTO `rollandgaross_tournment_organistaion`.`play` (`player_pid`, `match_mno`, `score`) VALUES (666, 33, 2);
INSERT INTO `rollandgaross_tournment_organistaion`.`play` (`player_pid`, `match_mno`, `score`) VALUES (777, 44, 1);
INSERT INTO `rollandgaross_tournment_organistaion`.`play` (`player_pid`, `match_mno`, `score`) VALUES (888, 44, 3);
INSERT INTO `rollandgaross_tournment_organistaion`.`play` (`player_pid`, `match_mno`, `score`) VALUES (111, 55, 3);
INSERT INTO `rollandgaross_tournment_organistaion`.`play` (`player_pid`, `match_mno`, `score`) VALUES (333, 55, 1);
INSERT INTO `rollandgaross_tournment_organistaion`.`play` (`player_pid`, `match_mno`, `score`) VALUES (555, 66, 2);
INSERT INTO `rollandgaross_tournment_organistaion`.`play` (`player_pid`, `match_mno`, `score`) VALUES (888, 66, 3);
INSERT INTO `rollandgaross_tournment_organistaion`.`play` (`player_pid`, `match_mno`, `score`) VALUES (111, 77, 3);
INSERT INTO `rollandgaross_tournment_organistaion`.`play` (`player_pid`, `match_mno`, `score`) VALUES (888, 77, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `rollandgaross_tournment_organistaion`.`has`
-- -----------------------------------------------------
START TRANSACTION;
USE `rollandgaross_tournment_organistaion`;
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (11, 1);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (11, 4);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (11, 5);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (11, 6);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (11, 7);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (11, 8);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (11, 9);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (22, 2);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (22, 4);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (22, 5);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (22, 6);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (22, 7);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (22, 8);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (22, 9);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (33, 3);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (33, 4);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (33, 5);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (33, 6);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (33, 7);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (33, 8);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (33, 9);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (44, 1);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (44, 4);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (44, 5);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (44, 6);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (44, 7);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (44, 8);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (44, 9);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (55, 2);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (55, 4);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (55, 5);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (55, 6);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (55, 7);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (55, 8);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (55, 9);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (66, 3);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (66, 4);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (66, 5);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (66, 6);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (66, 7);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (66, 8);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (66, 9);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (77, 1);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (77, 4);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (77, 5);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (77, 6);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (77, 7);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (77, 8);
INSERT INTO `rollandgaross_tournment_organistaion`.`has` (`match_mno`, `referee_rid`) VALUES (77, 9);

COMMIT;


-- -----------------------------------------------------
-- Data for table `rollandgaross_tournment_organistaion`.`fan_has_match`
-- -----------------------------------------------------
START TRANSACTION;
USE `rollandgaross_tournment_organistaion`;
INSERT INTO `rollandgaross_tournment_organistaion`.`fan_has_match` (`fan_fid`, `match_mno`) VALUES (1, 22);
INSERT INTO `rollandgaross_tournment_organistaion`.`fan_has_match` (`fan_fid`, `match_mno`) VALUES (2, 22);
INSERT INTO `rollandgaross_tournment_organistaion`.`fan_has_match` (`fan_fid`, `match_mno`) VALUES (3, 33);
INSERT INTO `rollandgaross_tournment_organistaion`.`fan_has_match` (`fan_fid`, `match_mno`) VALUES (4, 44);
INSERT INTO `rollandgaross_tournment_organistaion`.`fan_has_match` (`fan_fid`, `match_mno`) VALUES (5, 33);
INSERT INTO `rollandgaross_tournment_organistaion`.`fan_has_match` (`fan_fid`, `match_mno`) VALUES (6, 44);
INSERT INTO `rollandgaross_tournment_organistaion`.`fan_has_match` (`fan_fid`, `match_mno`) VALUES (7, 66);
INSERT INTO `rollandgaross_tournment_organistaion`.`fan_has_match` (`fan_fid`, `match_mno`) VALUES (8, 77);
INSERT INTO `rollandgaross_tournment_organistaion`.`fan_has_match` (`fan_fid`, `match_mno`) VALUES (9, 66);
INSERT INTO `rollandgaross_tournment_organistaion`.`fan_has_match` (`fan_fid`, `match_mno`) VALUES (10, 55);
INSERT INTO `rollandgaross_tournment_organistaion`.`fan_has_match` (`fan_fid`, `match_mno`) VALUES (11, 11);

COMMIT;


-- -----------------------------------------------------
-- Data for table `rollandgaross_tournment_organistaion`.`court_has_employee`
-- -----------------------------------------------------
START TRANSACTION;
USE `rollandgaross_tournment_organistaion`;
INSERT INTO `rollandgaross_tournment_organistaion`.`court_has_employee` (`employee_eid`, `court_c_no`) VALUES (1111, 1);
INSERT INTO `rollandgaross_tournment_organistaion`.`court_has_employee` (`employee_eid`, `court_c_no`) VALUES (2222, 1);
INSERT INTO `rollandgaross_tournment_organistaion`.`court_has_employee` (`employee_eid`, `court_c_no`) VALUES (3333, 1);
INSERT INTO `rollandgaross_tournment_organistaion`.`court_has_employee` (`employee_eid`, `court_c_no`) VALUES (4444, 1);
INSERT INTO `rollandgaross_tournment_organistaion`.`court_has_employee` (`employee_eid`, `court_c_no`) VALUES (5555, 2);
INSERT INTO `rollandgaross_tournment_organistaion`.`court_has_employee` (`employee_eid`, `court_c_no`) VALUES (6666, 2);
INSERT INTO `rollandgaross_tournment_organistaion`.`court_has_employee` (`employee_eid`, `court_c_no`) VALUES (7777, 2);
INSERT INTO `rollandgaross_tournment_organistaion`.`court_has_employee` (`employee_eid`, `court_c_no`) VALUES (8888, 2);
INSERT INTO `rollandgaross_tournment_organistaion`.`court_has_employee` (`employee_eid`, `court_c_no`) VALUES (1111, 3);
INSERT INTO `rollandgaross_tournment_organistaion`.`court_has_employee` (`employee_eid`, `court_c_no`) VALUES (2222, 3);
INSERT INTO `rollandgaross_tournment_organistaion`.`court_has_employee` (`employee_eid`, `court_c_no`) VALUES (3333, 3);
INSERT INTO `rollandgaross_tournment_organistaion`.`court_has_employee` (`employee_eid`, `court_c_no`) VALUES (4444, 3);
INSERT INTO `rollandgaross_tournment_organistaion`.`court_has_employee` (`employee_eid`, `court_c_no`) VALUES (5555, 4);
INSERT INTO `rollandgaross_tournment_organistaion`.`court_has_employee` (`employee_eid`, `court_c_no`) VALUES (6666, 4);
INSERT INTO `rollandgaross_tournment_organistaion`.`court_has_employee` (`employee_eid`, `court_c_no`) VALUES (7777, 4);
INSERT INTO `rollandgaross_tournment_organistaion`.`court_has_employee` (`employee_eid`, `court_c_no`) VALUES (8888, 4);

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
