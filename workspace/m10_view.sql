CREATE VIEW empvu100
AS 	SELECT empno, ename, salary
	FROM employee
	WHERE deptno = 100;
    
SELECT * FROM empvu100;

CREATE VIEW salvu100
AS 	SELECT empno id, ename name, salary * 12 'annual_salary'
	FROM employee
	WHERE deptno = 100;

SELECT * FROM salvu100;

CREATE VIEW salvu100_1 (id, name, annual_salary)
AS 	SELECT empno, ename, salary * 12
	FROM employee
	WHERE deptno = 100;

SELECT * FROM salvu100_1;

CREATE VIEW dept_sum_vw 
	(name, minsal, maxsal, avgsal)
AS 	SELECT d.dname, min(salary), max(salary), avg(salary)
	FROM employee e, department d
    WHERE e.deptno = d.deptno
	GROUP BY d.dname;
    
SELECT * FROM dept_sum_vw;

UPDATE empvu100
SET ename = '沙悟淨' WHERE empno = 1009;

-- Error Code: 1054. Unknown column 'enmae' in 'field list'
UPDATE empvu100
SET enmae = '孫大為' WHERE empno = 1003;

-- Error Code: 1054. Unknown column 'title' in 'field list'
UPDATE empvu100
SET title = 'SA' WHERE empno = 1009;

DELETE FROM empvu100 WHERE empno = 1009;

CREATE VIEW emp_sal_vw
AS SELECT	empno, ename, salary
			FROM employee
            WHERE salary <= 40000
            WITH CHECK OPTION;

-- Error Code: 1369. CHECK OPTION failed 'db01.emp_sal_vw'
UPDATE emp_sal_vw
SET salary = 40001 WHERE empno = 1002;