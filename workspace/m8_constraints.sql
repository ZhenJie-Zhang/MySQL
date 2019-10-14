CREATE TABLE emp1(
	-- column level constraint
	empno		decimal(4)		PRIMARY KEY,
    ename		varchar(30)		NOT NULL,
    hiredate	date			NOT NULL,
    email		VARCHAR(30)		UNIQUE,
    salary		int				NOT NULL,
	deptno		decimal(3)		NOT NULL,
    title		varchar(20)		NOT NULL DEFAULT 'engineer',
    -- table level constraint
    CONSTRAINT emp_deptno_fk FOREIGN KEY (deptno)
    REFERENCES department (deptno)
);

INSERT INTO dept
VALUES (600, 'Public Relations', DEFAULT);

UPDATE dept
SET cityno = DEFAULT
WHERE deptno= 500;

INSERT INTO emp1
VALUES	(1001, '孫悟空', '2013/11/10', 'gg@gmail.com', 56000, 100, 'senior engineer');

-- Error Code: 1062. Duplicate entry '1001' for key 'PRIMARY'
INSERT INTO emp1
VALUES	(1001, '孫悟空', '2013/11/10', 'gg@gmail.com', 56000, 100, 'senior engineer');

-- Error Code: 1062. Duplicate entry 'gg@gmail.com' for key 'email'
INSERT INTO emp1
VALUES	(1002, '孫悟空', '2013/11/10', 'gg@gmail.com', 56000, 100, 'senior engineer');

-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`db01`.`emp1`, CONSTRAINT `emp_deptno_fk` FOREIGN KEY (`deptno`) REFERENCES `department` (`deptno`))
INSERT INTO emp1
VALUES	(1002, '孫悟空', '2013/11/10', 'gg1@gmail.com', 56000, 600, 'senior engineer');

-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`db01`.`emp1`, CONSTRAINT `emp_deptno_fk` FOREIGN KEY (`deptno`) REFERENCES `department` (`deptno`))
DELETE FROM department WHERE deptno = 100;

INSERT INTO emp1
VALUES	(1002, '孫悟空', '2014/11/10', 'gg1@gmail.com', 56000, 200, 'senior engineer');

ALTER TABLE `db01`.`emp1` 
DROP FOREIGN KEY `emp_deptno_fk`;
ALTER TABLE `db01`.`emp1` 
ADD CONSTRAINT `emp_deptno_fk`
  FOREIGN KEY (`deptno`)
  REFERENCES `db01`.`department` (`deptno`)
  ON UPDATE CASCADE;

UPDATE department SET deptno = 201 WHERE deptno = 200;

ALTER TABLE `db01`.`emp1` 
DROP FOREIGN KEY `emp_deptno_fk`;
ALTER TABLE `db01`.`emp1` 
ADD CONSTRAINT `emp_deptno_fk`
  FOREIGN KEY (`deptno`)
  REFERENCES `db01`.`department` (`deptno`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;

DELETE FROM department WHERE deptno = 201;

CREATE TABLE mem(
	memno	int	PRIMARY KEY AUTO_INCREMENT,
    mname	VARCHAR(30)		NOT NULL
);

INSERT INTO mem (mname) VALUES ('David Ho'), ('Maria Wang'), ('Pam Pan'), ('Tina Lee'), ('Jean Tsao');

DROP TABLE mem;

CREATE TABLE mem(
	memno	int	PRIMARY KEY AUTO_INCREMENT,
    mname	VARCHAR(30)		NOT NULL
)AUTO_INCREMENT = 100;

INSERT INTO mem (mname) VALUES ('David Ho'), ('Maria Wang'), ('Pam Pan'), ('Tina Lee'), ('Jean Tsao');