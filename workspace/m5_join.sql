# Module 5 資料連結(Join)
--  Cross Join
SELECT ename, dname FROM emp, dept;
SELECT ename, dname FROM emp CROSS JOIN dept;

-- Inner Join - Equal Join
SELECT ename, dname 
FROM   emp, dept
WHERE  emp.deptno = dept.deptno;

-- Error Code: 1052. Column 'deptno' in field list is ambiguous
SELECT ename, deptno, dname 
FROM   emp, dept
WHERE  emp.deptno = dept.deptno;

-- MySQL Join Types
SELECT ename, emp.deptno, dname 
FROM   emp, dept
WHERE  emp.deptno = dept.deptno;

-- ANSI Join Types
SELECT 	ename, emp.deptno, dname 
FROM 	emp JOIN dept
ON 		emp.deptno = dept.deptno;

-- 使用JOIN USING，USING中的欄位，不可使用alias.column，使用條件為兩個表格中要有相同的欄位名稱
SELECT ename, emp.deptno, dname 
FROM   emp JOIN dept
USING  (deptno);
 
-- 使用NATUREAL JOIN，使用條件為兩個表格中要有相同的欄位名稱
SELECT ename, emp.deptno, dname 
FROM   emp NATURAL JOIN dept;

-- 加入AND運算子，增加篩選條件
SELECT ename, emp.deptno, dname 
FROM emp, dept
WHERE emp.deptno = dept.deptno
AND title = 'engineer';

-- ANSI Join Types，加入WHERE，增加篩選條件
SELECT ename, emp.deptno, dname 
  FROM emp JOIN dept
    ON emp.deptno = dept.deptno
 WHERE title = 'engineer';
 
 -- 表格別名(愈短愈好，可增進效能)
SELECT e.ename, e.deptno, d.dname 
FROM emp e, dept d
WHERE e.deptno = d.deptno;

SELECT e.ename, e.deptno, d.dname 
FROM   emp e JOIN dept d
ON     e.deptno = d.deptno;

SELECT 	e.ename, d.dname, c.cname 
FROM 	emp e, dept d, city c
WHERE 	e.deptno = d.deptno
AND 	d.cityno = c.cityno;

-- JOIN N個表格
SELECT e.ename, d.dname, c.cname 
FROM   emp  e
JOIN   dept d ON e.deptno = d.deptno
JOIN   city c ON c.cityno = d.cityno;
            
SELECT 	e.ename, e.salary, g.level
FROM 	emp e, grade g
WHERE 	e.salary BETWEEN g.lowest AND g.highest;

-- Inner Join- Non-Equal Join
SELECT 	e.ename, d.dname, e.salary, g.level
FROM 	emp e, grade g, dept d
WHERE 	e.deptno = d.deptno
AND 	e.salary BETWEEN g.lowest AND g.highest;

-- Left Outer Join
SELECT 	e.ename, e.deptno, d.dname 
FROM 	emp e LEFT JOIN dept d ON e.deptno = d.deptno;

-- Right Outer Join
SELECT 	e.ename, d.deptno, d.dname 
FROM 	emp e RIGHT JOIN dept d ON e.deptno = d.deptno;

-- Full Outer Join (UNION)
SELECT 	e.ename, e.deptno, d.dname 
FROM 	emp e LEFT JOIN dept d ON e.deptno = d.deptno
UNION
SELECT 	e.ename, d.deptno, d.dname 
FROM 	emp e RIGHT JOIN dept d ON e.deptno = d.deptno;

-- Self Join
SELECT 	worker.ename 'worker name',
		manager.ename 'manager name'
FROM	emp worker, emp manager -- 一定要有別名
WHERE	worker.mgrno = manager.empno;

SELECT 	worker.ename 'worker name',
		manager.ename 'manager name'
FROM	emp worker JOIN emp manager -- 一定要有別名
ON		worker.mgrno = manager.empno;

SELECT 	*
FROM 	emp JOIN dept
ON 		emp.deptno = dept.deptno;

SELECT 	e.*, d.dname, d.cityno
FROM 	emp e 
		INNER JOIN dept d ON e.deptno = d.deptno;