-- SELECT 指令
SELECT * FROM employee;
SELECT empno, ename, title FROM employee;

-- 算術運算子範例
select 17/4, 17 div 4, 17%4, 17*NULL;

-- 欄位別名
select ename AS '員工姓名', salary*12 AS '年薪' FROM employee;
select ename '員工姓名', salary*12 '年薪' FROM employee;
select ename AS 'Employee Name', salary*12 AS 'Annual Salary' FROM employee;
select ename 'Employee Name', salary*12 'Annual Salary' FROM employee;

-- String Function (1/2)
SELECT SUBSTRING(ename, 1, 1) '姓氏' FROM employee;
SELECT SUBSTRING(ename, 2) '姓氏' FROM employee;
SELECT SUBSTRING('David Wang', 1, 5) 'substr';
SELECT SUBSTRING('David Wang', 7) 'substr';
SELECT SUBSTRING('David Wang', -4) 'substr';
SELECT SUBSTRING('David Wang', -4, 2) 'substr';

select locate(' ','David Wang');

-- String Function (2/2)
SELECT CONCAT(ename, ' is a ', title) 'CONCAT' FROM employee;
SELECT LENGTH('我是一個student') 'LENGTH';-- bytes
SELECT CHAR_LENGTH('我是一個student') 'CHAR_LENGTH';

-- 日期運算
select sysdate() + interval 5 day;
select hiredate, hiredate + interval 3 month 'test period' from employee;

-- Day and Time Function(1/4)
select sysdate(), sleep(2), sysdate();	-- 指令當下的系統日期時間
select now(), sleep(2), now();			-- 指令開始執行的日期時間

-- Day and Time Function(2/4):只傳回現在的日期或時間
select curdate();
select curtime();
select curdate(), adddate(curdate(),5) 'adddate()';
select curdate(), adddate(curdate(), interval 5 day) 'adddate()';
select curdate(), subdate(curdate(),5) 'subdate()';

-- Day and Time Function(3/4):取得年分、月份、日期
select empno, ename, hiredate, year(hiredate) 'year', month(hiredate) 'month', day(hiredate) 'day' from employee;
select now(), year(now()) 'year', month(now()) 'month', day(now()) 'day';

-- Day and Time Function(4/4):計算出年資
select empno, ename, datediff(now(),hiredate) div 365 'year' from employee;
select empno, ename, hiredate, date(now()),
	datediff(now(),hiredate) div 365 '年資1',
    datediff(now(),hiredate) / 365 'year1',
    round(datediff(now(),hiredate) / 365) 'year2',
    round(datediff(now(),hiredate) / 365,1) 'year3',
    floor(datediff(now(),hiredate) / 365) '年資2',
    round((datediff(now(),hiredate) / 365 - datediff(now(),hiredate) div 365) * 12) '月資1',
    round(datediff(now(),hiredate) % 365 / 30) '月資2'
	from employee;

-- Control Flow Functions(1/2): IF function
SELECT empno, ename, salary,
	salary * IF(salary >= 50000, 2, 1.5) 'bonus'
	from employee;

SELECT empno, ename, salary,
	CASE
		WHEN salary      > 100000 THEN 'A'
        WHEN salary BETWEEN 70000 AND 100000 THEN 'B'
        WHEN salary BETWEEN 50000 AND  69999 THEN 'C'
        WHEN salary BETWEEN 30000 AND  49999 THEN 'D'
        ELSE 'E'
	END 'Grade'
FROM employee;

-- 去除重複的資料列
SELECT deptno FROM employee;
SELECT DISTINCT deptno FROM employee;
SELECT DISTINCT deptno, title FROM employee;

-- WHERE Clause 篩選資料列
SELECT * FROM employee WHERE deptno = 100;
SELECT * FROM employee WHERE title = 'engineer';
SELECT * FROM employee WHERE hiredate = '2007/07/06';
SELECT * FROM employee WHERE salary > 50000;
SELECT * FROM employee WHERE salary BETWEEN 30000 AND 40000;
SELECT * FROM employee WHERE title IN ('manager', 'engineer');
SELECT * FROM department WHERE mgrno IS NULL;

-- WHERE Clause 篩選資料列 使用 LIKE 運算子
SELECT * FROM employee WHERE ename LIKE '林%';
SELECT * FROM employee WHERE ename LIKE '%生';
SELECT * FROM employee WHERE ename LIKE '%麗%';
SELECT * FROM employee WHERE ename LIKE '_麗%';
SELECT * FROM employee WHERE title LIKE '%SA\_%';
SELECT * FROM employee WHERE title LIKE '%SA/_%' ESCAPE '/';

-- WHERE Clause 篩選資料列 使用 LIKE 運算子 增加使用 邏輯運算子(AND, OR)
SELECT * FROM employee WHERE salary >= 45000 AND ename LIKE '林%';
SELECT * FROM employee WHERE salary >= 45000 OR ename LIKE '林%';
SELECT * FROM employee WHERE title = 'manager' OR title = 'engineer';
SELECT * FROM employee WHERE salary >= 30000 AND salary <= 40000;
SELECT * FROM employee WHERE hiredate >= '2007/07/06';

-- WHERE Clause 篩選資料列 使用 LIKE 運算子 增加使用 邏輯運算子(NOT)
SELECT * FROM employee WHERE title NOT IN ('manager', 'engineer');
SELECT * FROM department WHERE mgrno IS NOT NULL;
SELECT * FROM employee WHERE salary NOT BETWEEN 40000 AND 60000;
SELECT * FROM employee WHERE ename NOT LIKE '林%';

-- ORDER BY Clause 欄位排序
SELECT * FROM employee ORDER BY hiredate DESC;
SELECT ename, deptno, salary FROM employee ORDER BY deptno, salary DESC;
SELECT ename, deptno, salary FROM employee WHERE deptno = 100 ORDER BY salary DESC;
SELECT ename, deptno, salary FROM employee ORDER BY deptno DESC, salary DESC;
SELECT ename, salary*12 'Annual' FROM employee ORDER BY Annual;		-- 依欄位名稱排序
SELECT ename, salary*12 'Annual' FROM employee ORDER BY salary*12;	-- 依欄位運算式排序
SELECT ename, deptno, salary FROM employee ORDER BY 3;				-- 依欄位編號排序
SELECT * FROM employee ORDER BY 3;									-- 依欄位編號排序

-- LIMIT Clause 指定傳回數量
SELECT * FROM employee LIMIT 3;
SELECT * FROM employee LIMIT 4, 3;-- 跳過前4筆之後，取3筆資料
SELECT * FROM employee ORDER BY hiredate LIMIT 3;
SELECT * FROM employee ORDER BY salary DESC LIMIT 3;

SELECT SUM(salary), AVG(salary), MAX(salary), MIN(salary) FROM employee;
SELECT COUNT(*) FROM employee;
SELECT COUNT(deptno) FROM employee;
SELECT COUNT(DISTINCT deptno) FROM employee;
SELECT COUNT(*), COUNT(mgrno) 'Count' FROM department;

SELECT deptno, COUNT(*), AVG(salary) 'Average' FROM employee
GROUP BY deptno;
    
SELECT deptno, AVG(salary) 'Average' FROM employee
GROUP BY deptno
ORDER BY AVG(salary);
    
SELECT deptno, title, SUM(salary) 'Total' FROM employee
GROUP BY deptno, title;
    
SELECT deptno, title, SUM(salary) 'Total' FROM employee
GROUP BY deptno, title WITH ROLLUP;

SELECT 	IFNULL(deptno, '總計') '部門代號',  
        IFNULL(title, '小計') '職稱',
        SUM(salary) 'Total' 
FROM employee
GROUP BY deptno, title 
WITH ROLLUP;

SELECT 	IFNULL(deptno, '總計') '部門代號',      
        IF(IFNULL(deptno, 0), IFNULL(title, '小計'), IFNULL(title, '')) '職稱', 
        SUM(salary) 'Total' 
FROM employee
GROUP BY deptno, title 
WITH ROLLUP;


SELECT 	IFNULL(deptno, '總計') '部門代號',
        IFNULL(title, IF(ISNULL(deptno),"","小計")) '職稱',
        SUM(salary) 'Total' 
FROM employee
GROUP BY deptno, title 
WITH ROLLUP;
    
SELECT	title, SUM(salary)
FROM	employee
WHERE	title NOT LIKE '%SA%'
GROUP BY title
HAVING 	SUM(salary) > 100000
ORDER BY SUM(salary) DESC;