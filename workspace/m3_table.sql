-- 使用指令輸入新增表格
CREATE TABLE employee(
	empno		decimal(4)		PRIMARY KEY,
    ename		varchar(30)		NOT NULL,
    hiredate	date			NOT NULL,
    salary		int				NOT NULL,
	deptno		decimal(3)		NOT NULL,
    title		varchar(20)		NOT NULL
);

-- 使用視窗介面新增表格的指令內容
CREATE TABLE `db01`.`department` (
  `deptno` DECIMAL(3) NOT NULL,
  `dname` VARCHAR(30) NOT NULL,
  `mgrno` DECIMAL(4) NULL,
  PRIMARY KEY (`deptno`));

-- 顯示資料表的屬性內容
SHOW TABLE STATUS IN db01;
SHOW TABLES;
DESC employee;

-- 表格欄位的資料型態指令變更 
desc t;  
create table t(a int, b char(10), c float);
alter table t add  d varchar(30);
alter table t modify d varchar(50);
alter table t change d e decimal(10,2);
alter table t drop c;
alter table t rename t1;
desc t1;
drop table t1;


alter table t add  d varchar(30) first;
alter table t modify  d varchar(50) first;
drop table t;

CREATE TABLE emp LIKE employee;
DROP TABLE emp;


-- 1.	建立一資料表名為食物(food)，有編號、名稱、到期日、產地編號、價格、種類六個欄位，分別定義如下：id(char(5),PK), name(varchar(30)), expiredate(datetime), placeid(char(2)), price(int unsigned), catalog(varchar(20))
CREATE TABLE food(
	id			char(5)			primary key,
    name		varchar(30)		not null,
    expiredate	datetime		not null,
    placeid		char(2)			not null,
    price		int unsigned	not null,
    catalog		varchar(20)		not null
);

-- 2.	建立一資料表名為產地(place)，有編號、名稱兩個欄位，分別定義如下：id(char(2),PK), name(varchar(20))
CREATE TABLE place(
	id			char(2)			primary key,
    name		varchar(20)		not null
);

-- 3.	利用複製表格結構的方式複製food產生一個新的表格名為food1
CREATE TABLE food1 LIKE food;

-- 4.	利用food1新增、修改、重新命名和刪除一個欄位
ALTER TABLE food1 ADD d int;
DESC food1;
ALTER TABLE food1 MODIFY d varchar(30);
ALTER TABLE food1 CHANGE f d char(3) NOT NULL;
ALTER TABLE food1 DROP d;

-- 5.	將food1重新命名為food2
ALTER TABLE food1 RENAME food2;

-- 6.	刪除food2資料表
drop table food2;