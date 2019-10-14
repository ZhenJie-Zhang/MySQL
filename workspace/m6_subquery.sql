# Module 6 子查詢(Subquery)

-- 找出所有薪資比"潘麗珍"高的員工
SELECT salary
FROM   employee
WHERE  ename = '潘麗珍';

SELECT ename, salary
FROM   employee
WHERE  salary >(SELECT salary
				FROM   employee
                WHERE  ename = '潘麗珍');

-- 找出所有職稱和員工編號為1002相同且薪資比員工編號為1005高的員工
SELECT title
FROM   employee
WHERE  empno = 1002;

SELECT salary
FROM   employee
WHERE  empno = 1005;

SELECT ename, title, salary
FROM   employee
WHERE  title = (SELECT title
				FROM   employee
				WHERE  empno = 1002)
AND   salary > (SELECT salary
				FROM   employee
				WHERE  empno = 1005);

-- 找出所有最低薪資比部門代號為200最低薪資高的部門
SELECT MIN(salary)
FROM   employee
WHERE  deptno = 200;

SELECT deptno, MIN(salary)
FROM   employee
GROUP BY deptno
HAVING MIN(salary) > (SELECT MIN(salary)
					  FROM   employee
                      WHERE  deptno = 200);
                      
-- 找出部門代號為100的每位員工其薪資佔部門代號為100所有員工薪資的百分比
SELECT SUM(salary)
FROM   employee
WHERE  deptno = 100;
              
 SELECT ename, title, salary,
		ROUND (salary * 100 /
			  (SELECT SUM(salary)
               FROM employee
               WHERE deptno = 100),1) 'Percentage'
FROM employee
WHERE deptno = 100;

-- 接上題，定義表格欄位別名，以增加運算效能
SELECT ename, title, salary,
	   ROUND (salary * 100 / t.total,1) 'Percentage' ,t.total
FROM employee, (SELECT SUM(salary) 'total'	-- 欄位別名
				FROM employee
				WHERE deptno = 100) t		-- 表格別名 P.S.不可加單引號
WHERE deptno = 100;

SELECT ROUND(123456.789,1);
SELECT ROUND(123456.789,2);
SELECT ROUND(123456.789,-1);
SELECT ROUND(123456.789,-2);
SELECT ROUND(123456.789,-3);

-- Error Code: 1242. Subquery returns more than 1 row
SELECT empno, ename
FROM employee
WHERE salary = (SELECT MIN(salary)
				FROM   employee
				GROUP BY  deptno);
                
SELECT ename, title, salary
FROM employee
WHERE salary < ANY
			(SELECT salary
			FROM   employee
			WHERE title = 'senior engineer')
AND title <> 'senior engineer';

SELECT ename, title, salary
FROM employee
WHERE salary < 
			(SELECT MAX(salary)
			FROM   employee
			WHERE title = 'senior engineer')
AND title <> 'senior engineer';

-- 找出職稱不是senior engineer且薪資比所有senior engineer薪資來的低的員工
SELECT ename, title, salary
FROM employee
WHERE salary < ALL
			(SELECT salary
			FROM   employee
			WHERE title = 'senior engineer')
AND title <> 'senior engineer';

SELECT ename, title, salary
FROM employee
WHERE salary < 
			(SELECT MIN(salary)
			FROM   employee
			WHERE title = 'senior engineer')
AND title <> 'senior engineer';

-- 
SELECT ename
FROM emp
WHERE empno IN
			(SELECT DISTINCT mgrno
            FROM emp);

-- 
SELECT ename
FROM emp
WHERE empno NOT IN
			(SELECT DISTINCT mgrno
            FROM emp);

SELECT ename, mgrno FROM emp;

SELECT ename
FROM emp
WHERE empno NOT IN
			(SELECT DISTINCT mgrno
            FROM emp
            WHERE mgrno IS NOT NULL);

SELECT SUM(salary)
FROM employee
WHERE deptno = deptno;

SELECT SUM(salary)
FROM employee;

SELECT deptno, SUM(salary)
FROM employee
WHERE deptno = 100;

SELECT deptno, SUM(salary)
FROM employee
GROUP BY deptno with rollup;

-- 
SELECT deptno, e.ename, e.title, e.salary,
		ROUND (salary * 100 /
			  (SELECT SUM(salary)
               FROM employee
               WHERE deptno = e.deptno),1) 'Percentage'
FROM employee e
WHERE e.deptno = 100;

-- 接上題，定義表格欄位別名，以增加運算效能
-- http://www.mysqltutorial.org/mysql-derived-table/
SELECT deptno, ename, title, salary,
	   ROUND (salary * 100 / t.total, 1) 'Percentage' 
FROM employee, (SELECT deptno d, SUM(salary) total	-- 欄位別名
				FROM employee
				WHERE deptno = 100) t		-- 表格別名 P.S.不可加單引號
WHERE deptno = t.d;

-- 
SELECT e.ename, e.salary, e.deptno
FROM employee e
WHERE salary IN (SELECT MIN(salary)
				FROM employee
				GROUP BY deptno
                HAVING deptno = e.deptno);
                
SELECT e.ename, e.salary, e.deptno
FROM employee e
WHERE salary IN (SELECT MIN(salary)
				FROM employee
                WHERE deptno = e.deptno
				GROUP BY deptno);
                
SELECT e.ename, e.salary, e.deptno
FROM employee e
WHERE salary = (SELECT MIN(salary)
				FROM employee
				WHERE deptno = e.deptno);
                
CREATE TABLE emp100 AS
SELECT empno, ename, salary*12 'annualSalary', hiredate
FROM employee
WHERE deptno = 100;
                