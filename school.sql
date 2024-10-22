-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema school_system
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema school_system
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `school_system` DEFAULT CHARACTER SET utf8 ;
USE `school_system` ;

-- -----------------------------------------------------
-- Table `school_system`.`grade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_system`.`grade` (
  `grade_id` INT NOT NULL,
  `grade_name` VARCHAR(45) NULL,
  PRIMARY KEY (`grade_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school_system`.`class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_system`.`class` (
  `class_id` VARCHAR(5) NOT NULL,
  `class_name` VARCHAR(45) NULL,
  `grade_grade_id` INT NOT NULL,
  PRIMARY KEY (`class_id`),
  INDEX `fk_class_grade1_idx` (`grade_grade_id` ASC) VISIBLE,
  CONSTRAINT `fk_class_grade1`
    FOREIGN KEY (`grade_grade_id`)
    REFERENCES `school_system`.`grade` (`grade_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school_system`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_system`.`student` (
  `sid` VARCHAR(7) NOT NULL,
  `fname` VARCHAR(45) NULL,
  `lname` VARCHAR(45) NULL,
  `dob` DATE NULL,
  `gender` VARCHAR(1) NULL,
  `city` VARCHAR(45) NULL,
  `class_class_id` VARCHAR(5) NOT NULL,
  `parent_name` VARCHAR(100) NULL,
  `tp` VARCHAR(10) NULL,
  `status` TINYINT(1) NULL DEFAULT 1,
  PRIMARY KEY (`sid`),
  INDEX `fk_student_class1_idx` (`class_class_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_class1`
    FOREIGN KEY (`class_class_id`)
    REFERENCES `school_system`.`class` (`class_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school_system`.`subject`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_system`.`subject` (
  `sub_id` VARCHAR(5) NOT NULL,
  `sub_name` VARCHAR(64) NULL,
  `grade_grade_id` INT NOT NULL,
  `teaching_hrs` INT NULL,
  `exam_types` INT NULL,
  `status` TINYINT(1) NULL DEFAULT 1,
  PRIMARY KEY (`sub_id`),
  INDEX `fk_subject_grade1_idx` (`grade_grade_id` ASC) VISIBLE,
  CONSTRAINT `fk_subject_grade1`
    FOREIGN KEY (`grade_grade_id`)
    REFERENCES `school_system`.`grade` (`grade_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school_system`.`result`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_system`.`result` (
  `result_id` VARCHAR(7) NOT NULL,
  `student_sid` VARCHAR(7) NOT NULL,
  `subject_sub_id` VARCHAR(5) NOT NULL,
  `grade` VARCHAR(2) NULL,
  `mark` DOUBLE NOT NULL,
  `status` TINYINT(1) NULL DEFAULT 1,
  PRIMARY KEY (`result_id`),
  INDEX `fk_result_student_idx` (`student_sid` ASC) VISIBLE,
  INDEX `fk_result_subject1_idx` (`subject_sub_id` ASC) VISIBLE,
  CONSTRAINT `fk_result_student`
    FOREIGN KEY (`student_sid`)
    REFERENCES `school_system`.`student` (`sid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_result_subject1`
    FOREIGN KEY (`subject_sub_id`)
    REFERENCES `school_system`.`subject` (`sub_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school_system`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_system`.`staff` (
  `staff_id` VARCHAR(5) NOT NULL,
  `fname` VARCHAR(45) NULL,
  `lname` VARCHAR(45) NULL,
  `dob` DATE NULL,
  `gender` VARCHAR(1) NULL,
  `tp` VARCHAR(10) NULL,
  `role` VARCHAR(4) NULL,
  `email` VARCHAR(100) NULL,
  `pw` VARCHAR(255) NULL,
  `subject_sub_id` VARCHAR(5) NOT NULL,
  `status` TINYINT(1) NULL DEFAULT 1,
  PRIMARY KEY (`staff_id`),
  INDEX `fk_staff_subject1_idx` (`subject_sub_id` ASC) VISIBLE,
  CONSTRAINT `fk_staff_subject1`
    FOREIGN KEY (`subject_sub_id`)
    REFERENCES `school_system`.`subject` (`sub_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `school_system`.`exam`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `school_system`.`exam` (
  `exam_id` VARCHAR(5) NOT NULL,
  `exam_name` VARCHAR(45) NULL,
  `method` VARCHAR(1) NULL,
  `sub_id` VARCHAR(5) NOT NULL,
  `grade_grade_id` INT NOT NULL,
  `date` DATE NULL,
  `time` TIME NULL,
  `duration` INT NULL,
  `total_marks` INT NULL,
  `status` TINYINT(1) NULL DEFAULT 1,
  PRIMARY KEY (`exam_id`),
  INDEX `fk_exam_subject1_idx` (`sub_id` ASC) VISIBLE,
  INDEX `fk_exam_grade1_idx` (`grade_grade_id` ASC) VISIBLE,
  CONSTRAINT `fk_exam_subject1`
    FOREIGN KEY (`sub_id`)
    REFERENCES `school_system`.`subject` (`sub_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_exam_grade1`
    FOREIGN KEY (`grade_grade_id`)
    REFERENCES `school_system`.`grade` (`grade_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



ALTER TABLE `school_system`.`grade` 
DROP COLUMN `grade_name`;

ALTER TABLE `school_system`.`subject` 
DROP FOREIGN KEY `fk_subject_grade1`;
ALTER TABLE `school_system`.`subject` 
CHANGE COLUMN `grade_grade_id` `grade_id` INT NOT NULL ;
ALTER TABLE `school_system`.`subject` 
ADD CONSTRAINT `fk_subject_grade1`
  FOREIGN KEY (`grade_id`)
  REFERENCES `school_system`.`grade` (`grade_id`);


ALTER TABLE `school_system`.`staff` 
DROP FOREIGN KEY `fk_staff_subject1`;
ALTER TABLE `school_system`.`staff` 
CHANGE COLUMN `subject_sub_id` `sub_id` VARCHAR(5) NOT NULL ;
ALTER TABLE `school_system`.`staff` 
ADD CONSTRAINT `fk_staff_subject1`
  FOREIGN KEY (`sub_id`)
  REFERENCES `school_system`.`subject` (`sub_id`);


ALTER TABLE `school_system`.`result` 
DROP FOREIGN KEY `fk_result_student`,
DROP FOREIGN KEY `fk_result_subject1`;
ALTER TABLE `school_system`.`result` 
CHANGE COLUMN `student_sid` `sid` VARCHAR(7) NOT NULL ,
CHANGE COLUMN `subject_sub_id` `sub_id` VARCHAR(5) NOT NULL ;
ALTER TABLE `school_system`.`result` 
ADD CONSTRAINT `fk_result_student`
  FOREIGN KEY (`sid`)
  REFERENCES `school_system`.`student` (`sid`),
ADD CONSTRAINT `fk_result_subject1`
  FOREIGN KEY (`sub_id`)
  REFERENCES `school_system`.`subject` (`sub_id`);



ALTER TABLE `school_system`.`exam` 
DROP FOREIGN KEY `fk_exam_grade1`;
ALTER TABLE `school_system`.`exam` 
CHANGE COLUMN `grade_grade_id` `grade_id` INT NOT NULL ;
ALTER TABLE `school_system`.`exam` 
ADD CONSTRAINT `fk_exam_grade1`
  FOREIGN KEY (`grade_id`)
  REFERENCES `school_system`.`grade` (`grade_id`);


ALTER TABLE `school_system`.`student` 
DROP FOREIGN KEY `fk_student_class1`;
ALTER TABLE `school_system`.`student` 
CHANGE COLUMN `class_class_id` `class_id` VARCHAR(5) NOT NULL ;
ALTER TABLE `school_system`.`student` 
ADD CONSTRAINT `fk_student_class1`
  FOREIGN KEY (`class_id`)
  REFERENCES `school_system`.`class` (`class_id`);



ALTER TABLE `school_system`.`result` 
ADD COLUMN `exam_id` VARCHAR(5) NULL AFTER `status`,
ADD INDEX `k_result_exam_idx` (`exam_id` ASC) VISIBLE;
;
ALTER TABLE `school_system`.`result` 
ADD CONSTRAINT `k_result_exam`
  FOREIGN KEY (`exam_id`)
  REFERENCES `school_system`.`exam` (`exam_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


ALTER TABLE `school_system`.`result` 
DROP FOREIGN KEY `k_result_exam`;
ALTER TABLE `school_system`.`result` 
CHANGE COLUMN `exam_id` `exam_id` VARCHAR(5) NOT NULL AFTER `sub_id`;
ALTER TABLE `school_system`.`result` 
ADD CONSTRAINT `k_result_exam`
  FOREIGN KEY (`exam_id`)
  REFERENCES `school_system`.`exam` (`exam_id`);





-- ********** inserts **************


INSERT INTO `school_system`.`grade` (`grade_id`) VALUES ('1');
INSERT INTO `school_system`.`grade` (`grade_id`) VALUES ('2');
INSERT INTO `school_system`.`grade` (`grade_id`) VALUES ('3');
INSERT INTO `school_system`.`grade` (`grade_id`) VALUES ('4');
INSERT INTO `school_system`.`grade` (`grade_id`) VALUES ('5');


INSERT INTO `school_system`.`class` (`class_id`, `class_name`, `grade_grade_id`) VALUES ('CL001', '1 - A', '1');
INSERT INTO `school_system`.`class` (`class_id`, `class_name`, `grade_grade_id`) VALUES ('CL002', '1 - B', '1');
INSERT INTO `school_system`.`class` (`class_id`, `class_name`, `grade_grade_id`) VALUES ('CL003', '1 - C', '1');
INSERT INTO `school_system`.`class` (`class_id`, `class_name`, `grade_grade_id`) VALUES ('CL004', '2 - A', '2');
INSERT INTO `school_system`.`class` (`class_id`, `class_name`, `grade_grade_id`) VALUES ('CL005', '2 - B', '2');
INSERT INTO `school_system`.`class` (`class_id`, `class_name`, `grade_grade_id`) VALUES ('CL006', '2 - C', '2');
INSERT INTO `school_system`.`class` (`class_id`, `class_name`, `grade_grade_id`) VALUES ('CL007', '3 - A', '3');
INSERT INTO `school_system`.`class` (`class_id`, `class_name`, `grade_grade_id`) VALUES ('CL008', '3 - B', '3');
INSERT INTO `school_system`.`class` (`class_id`, `class_name`, `grade_grade_id`) VALUES ('CL009', '3 - C', '3');
INSERT INTO `school_system`.`class` (`class_id`, `class_name`, `grade_grade_id`) VALUES ('CL010', '4 - A', '4');
INSERT INTO `school_system`.`class` (`class_id`, `class_name`, `grade_grade_id`) VALUES ('CL011', '4 - B', '4');
INSERT INTO `school_system`.`class` (`class_id`, `class_name`, `grade_grade_id`) VALUES ('CL012', '4 - C', '4');
INSERT INTO `school_system`.`class` (`class_id`, `class_name`, `grade_grade_id`) VALUES ('CL013', '5 - A', '5');
INSERT INTO `school_system`.`class` (`class_id`, `class_name`, `grade_grade_id`) VALUES ('CL014', '5 - B', '5');
INSERT INTO `school_system`.`class` (`class_id`, `class_name`, `grade_grade_id`) VALUES ('CL015', '5 - C', '5');



INSERT INTO `school_system`.`subject` (`sub_id`, `sub_name`, `grade_id`, `teaching_hrs`, `exam_types`, `status`) VALUES ('SB001', 'GRADE 1 MATHEMATICS', '1', '50', '13', '1');


INSERT INTO `school_system`.`staff` (`staff_id`, `fname`, `lname`, `dob`, `gender`, `tp`, `role`, `email`, `pw`, `sub_id`, `status`) VALUES ('ST001', 'admin', 'admin', '2000-03-22', 'M', '0772838183', 'ADM', 'admin@gmail.com', 'c93ccd78b2076528346216b3b2f701e6', 'SB001', '1');





-- login - admin@gmail.com
--         admin1234






