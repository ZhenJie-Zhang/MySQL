
use db50;

/*
1. 查询" 01 "课程比" 02 "课程成绩高的学生的信息及课程分数
 
1.1 查询同时存在" 01 "课程和" 02 "课程的情况
 
1.2 查询存在" 01 "课程但可能不存在" 02 "课程的情况(不存在时显示为 null )
 
1.3 查询不存在" 01 "课程但存在" 02 "课程的情况
 
2. 查询平均成绩大于等于 60 分的同学的学生编号和学生姓名和平均成绩
 
3. 查询在 SC 表存在成绩的学生信息
 
4. 查询所有同学的学生编号、学生姓名、选课总数、所有课程的总成绩(没成绩的显示为 null )
 
4.1 查有成绩的学生信息
 
5. 查询「李」姓老师的数量
 
6. 查询学过「张三」老师授课的同学的信息
 
7. 查询没有学全所有课程的同学的信息
 
8. 查询至少有一门课与学号为" 01 "的同学所学相同的同学的信息
 
9. 查询和" 01 "号的同学学习的课程 完全相同的其他同学的信息
 
10. 查询没学过"张三"老师讲授的任一门课程的学生姓名
 
11. 查询两门及其以上不及格课程的同学的学号，姓名及其平均成绩
 
12. 检索" 01 "课程分数小于 60，按分数降序排列的学生信息
 
13. 按平均成绩从高到低显示所有学生的所有课程的成绩以及平均成绩
 
14. 查询各科成绩最高分、最低分和平均分：
 
以如下形式显示：课程 ID，课程 name，最高分，最低分，平均分，及格率，中等率，优良率，优秀率
 
及格为>=60，中等为：70-80，优良为：80-90，优秀为：>=90
 
要求输出课程号和选修人数，查询结果按人数降序排列，若人数相同，按课程号升序排列
 
15. 按各科成绩进行排序，并显示排名， Score 重复时保留名次空缺
 
15.1 按各科成绩进行排序，并显示排名， Score 重复时合并名次
 
16. 查询学生的总成绩，并进行排名，总分重复时保留名次空缺
 
16.1 查询学生的总成绩，并进行排名，总分重复时不保留名次空缺
 
17. 统计各科成绩各分数段人数：课程编号，课程名称，[100-85]，[85-70]，[70-60]，[60-0] 及所占百分比
 
18. 查询各科成绩前三名的记录
 
19. 查询每门课程被选修的学生数
 
20. 查询出只选修两门课程的学生学号和姓名
 
21. 查询男生、女生人数
 
22. 查询名字中含有「风」字的学生信息
 
23. 查询同名同性学生名单，并统计同名人数
 
24. 查询 1990 年出生的学生名单
 
25. 查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
 
26. 查询平均成绩大于等于 85 的所有学生的学号、姓名和平均成绩
 
27. 查询课程名称为「数学」，且分数低于 60 的学生姓名和分数
 
28. 查询所有学生的课程及分数情况（存在学生没成绩，没选课的情况）
 
29. 查询任何一门课程成绩在 70 分以上的姓名、课程名称和分数
 
30. 查询不及格的课程
 
31. 查询课程编号为 01 且课程成绩在 80 分以上的学生的学号和姓名
 
32. 求每门课程的学生人数
 
33. 成绩不重复，查询选修「张三」老师所授课程的学生中，成绩最高的学生信息及其成绩
 
34. 成绩有重复的情况下，查询选修「张三」老师所授课程的学生中，成绩最高的学生信息及其成绩
 
35. 查询不同课程成绩相同的学生的学生编号、课程编号、学生成绩
 
36. 查询每门功成绩最好的前两名
 
37. 统计每门课程的学生选修人数（超过 5 人的课程才统计）。
 
38. 检索至少选修两门课程的学生学号
 
39. 查询选修了全部课程的学生信息
 
40. 查询各学生的年龄，只按年份来算
 
41. 按照出生日期来算，当前月日 < 出生年月的月日则，年龄减一
 
42. 查询本周过生日的学生
 
43. 查询下周过生日的学生
 
44. 查询本月过生日的学生
 
45. 查询下月过生日的学生

*/
-- 1. 查询" 01 "课程比" 02 "课程成绩高的学生的信息及课程分数
SELECT * FROM sc;
SELECT * FROM course;
SELECT * FROM student;

SELECT * FROM sc
	RIGHT JOIN course  c ON sc.CId = c.Cid
    RIGHT JOIN student s ON sc.SId = s.SId;

SELECT * FROM sc
	RIGHT JOIN course  c ON sc.CId = c.Cid
	RIGHT JOIN student s ON sc.SId = s.SId
WHERE c.CId = '01' OR c.CId = '02';

SELECT * FROM sc
	RIGHT JOIN course  c ON sc.CId = c.Cid
	RIGHT JOIN student s ON sc.SId = s.SId
WHERE s.Sname = '赵雷';

SELECT c.CId, score, s.Sname  FROM sc
	RIGHT JOIN course  c ON sc.CId = c.Cid
	RIGHT JOIN student s ON sc.SId = s.SId
WHERE c.CId = '01' OR c.CId = '02';

SELECT score, SId  FROM sc
WHERE CId = '01';

SELECT s.Sname, c.CId, c.Cname, score
		FROM sc
		RIGHT JOIN course  c ON sc.CId = c.Cid
		RIGHT JOIN student s ON sc.SId = s.SId
WHERE ( SELECT score  FROM sc WHERE CId = '01' AND SId = s.SId) 
 >ANY ( SELECT score  FROM sc WHERE CId = '02' AND SId = s.SId);
 
 SELECT s.Sname, 
		case when c.Cname = '语文'   then score end `语文`, 
        case when c.Cname = '数学'   then score end `数学`, 
        case when c.Cname = '英语'   then score end `英语`
		FROM sc
		RIGHT JOIN course  c ON sc.CId = c.Cid
		RIGHT JOIN student s ON sc.SId = s.SId
WHERE ( SELECT score  FROM sc WHERE CId = '01' AND SId = s.SId) 
 >ANY ( SELECT score  FROM sc WHERE CId = '02' AND SId = s.SId);
 
SELECT s.Sname, 
		SUM(case when c.Cname = '语文'   then score end) `语文`, 
        SUM(case when c.Cname = '数学'   then score end) `数学`, 
        SUM(case when c.Cname = '英语'   then score end) `英语`
		FROM sc
		RIGHT JOIN course  c ON sc.CId = c.Cid
		RIGHT JOIN student s ON sc.SId = s.SId
WHERE ( SELECT score  FROM sc WHERE CId = '01' AND SId = s.SId) 
 >ANY ( SELECT score  FROM sc WHERE CId = '02' AND SId = s.SId)
GROUP BY s.Sname;
 
SELECT s.Sname '姓名', 
		SUM(case when c.Cname = '语文'   then score else 0 end) `语文`, 
        SUM(case when c.Cname = '数学'   then score else 0 end) `数学`, 
        SUM(case when c.Cname = '英语'   then score else 0 end) `英语`
		FROM sc
		RIGHT JOIN course  c ON sc.CId = c.Cid
		RIGHT JOIN student s ON sc.SId = s.SId
WHERE ( SELECT score  FROM sc WHERE CId = '01' AND SId = s.SId) 
 >ANY ( SELECT score  FROM sc WHERE CId = '02' AND SId = s.SId)
GROUP BY s.Sname;

SELECT s.Sname '姓名', 
		SUM(case when c.Cname = '语文'   then score end) `语文`, 
        SUM(case when c.Cname = '数学'   then score end) `数学`, 
        SUM(case when c.Cname = '英语'   then score end) `英语`
		FROM sc
		RIGHT JOIN course  c ON sc.CId = c.Cid
		RIGHT JOIN student s ON sc.SId = s.SId
GROUP BY s.Sname;

SELECT * FROM
(SELECT SId,score FROM SC WHERE CId='01')  t1,
(SELECT SId,score FROM SC WHERE CId='02')  t2
WHERE t1.SId=t2.SId
AND t1.score>t2.score;

-- 1.1 查询同时存在" 01 "课程和" 02 "课程的情况
SELECT s.Sname, concat(c.CId,'-',c.Cname) '課程', score
FROM sc
RIGHT JOIN course  c ON sc.CId = c.Cid
RIGHT JOIN student s ON sc.SId = s.SId
WHERE c.CId = '01' OR c.CId = '02';

SELECT s.Sname,
		SUM(case when c.CId = '01' then score else 0 end) `语文`,
		SUM(case when c.CId = '02' then score else 0 end) `数学`
FROM sc
RIGHT JOIN course  c ON sc.CId = c.Cid
RIGHT JOIN student s ON sc.SId = s.SId
WHERE c.CId = '01' OR c.CId = '02'
GROUP BY s.Sname;


-- 1.2 查询存在" 01 "课程但可能不存在" 02 "课程的情况(不存在时显示为 null )
SELECT s.Sname, c.CId, c.Cname, score
		FROM sc
		RIGHT JOIN course  c ON sc.CId = c.Cid
		RIGHT JOIN student s ON sc.SId = s.SId
WHERE c.CId = '01' OR c.CId = '02';

SELECT SId, CId, score
FROM sc
WHERE CId = '01' OR CId = '02';

SELECT s.Sname, c.CId, c.Cname, score
		FROM sc
		RIGHT JOIN course  c ON sc.CId = c.Cid
		RIGHT JOIN student s ON sc.SId = s.SId
WHERE ( SELECT CId  FROM sc WHERE CId = '01' AND SId = s.SId) 
AND   ( SELECT CId  FROM sc WHERE CId = '02' AND SId = s.SId);

SELECT s.Sname '姓名', 
SUM(case when c.Cname = '语文'   then score else null end) `语文`, 
SUM(case when c.Cname = '数学'   then score else null end) `数学`, 
SUM(case when c.Cname = '英语'   then score else null end) `英语`
FROM sc
RIGHT JOIN course  c ON sc.CId = c.Cid
RIGHT JOIN student s ON sc.SId = s.SId
GROUP BY s.Sname;

-- 1.3 查询不存在" 01 "课程但存在" 02 "课程的情况
select SId from sc where sc.CId='01';

select *
from sc
where sc.SId not in (select SId from sc where sc.CId='01')
and  sc.CId='02';

-- 2. 查询平均成绩大于等于 60 分的同学的学生编号和学生姓名和平均成绩
SELECT Student.*,t1.scavg 
FROM Student INNER JOIN
	(SELECT SC.SId,AVG(SC.score)AS scavg 
	FROM SC 
    GROUP BY SC.SId
HAVING AVG(SC.score)>=60)AS t1
ON Student.SId=t1.SId;

-- 3. 查询在 SC 表存在成绩的学生信息
SELECT distinct *
FROM sc
JOIN student s ON sc.SId = s.SId;

-- 4. 查询所有同学的学生编号、学生姓名、选课总数、所有课程的总成绩(没成绩的显示为 null )
SELECT s.SID '学生编号', s.Sname '学生姓名', 
count(c.CID) '选课总数',
SUM(case when c.Cname = '语文'   then score else null end) `语文`, 
SUM(case when c.Cname = '数学'   then score else null end) `数学`, 
SUM(case when c.Cname = '英语'   then score else null end) `英语`,
SUM(score) `總和`
FROM sc
RIGHT JOIN course  c ON sc.CId = c.Cid
RIGHT JOIN student s ON sc.SId = s.SId
GROUP BY s.SId;

-- 4.1 查有成绩的学生信息
SELECT s.*
FROM sc
RIGHT JOIN course  c ON sc.CId = c.Cid
RIGHT JOIN student s ON sc.SId = s.SId
GROUP BY s.Sname;

-- 5. 查询「李」姓老师的数量
select * from teacher;
select * from teacher where Tname like '李%';
select count(*) '「李」姓老师的数量' from teacher where Tname like '李%';
select count(*) '「李」姓學生的数量' from student where Sname like '李%';

-- 6. 查询学过「张三」老师授课的同学的信息
SELECT s.*
FROM sc
RIGHT JOIN course  c ON sc.CId = c.CId
RIGHT JOIN student s ON sc.SId = s.SId
RIGHT JOIN teacher t ON  t.TId = c.TId
WHERE Tname = '张三';

-- 7. 查询没有学全所有课程的同学的信息
SELECT *
FROM sc
RIGHT JOIN course  c ON sc.CId = c.CId
RIGHT JOIN student s ON sc.SId = s.SId
LEFT JOIN teacher t ON  t.TId = c.TId;

SELECT s.SId, count(c.CId)
FROM sc
RIGHT JOIN course  c ON sc.CId = c.CId
RIGHT JOIN student s ON sc.SId = s.SId
LEFT JOIN teacher t ON  t.TId = c.TId
group by s.SId;

select count(CId) from sc group by SId;
select count(CId) from course;

SELECT s.*
FROM sc
RIGHT JOIN course  c ON sc.CId = c.CId
RIGHT JOIN student s ON sc.SId = s.SId
LEFT JOIN teacher t ON  t.TId = c.TId
WHERE (	select count(c.CId) 	
		from sc 
		RIGHT JOIN student ON sc.SId = student.SId 
		where student.SId = s.SId 
		group by student.SId) 
	< (select count(CId) from course)
group by s.Sname;

-- 8. 查询至少有一门课与学号为" 01 "的同学所学相同的同学的信息
select * from sc where SId = '01';

SELECT s.*
FROM sc
RIGHT JOIN course  c ON sc.CId = c.CId
RIGHT JOIN student s ON sc.SId = s.SId
LEFT JOIN teacher t ON  t.TId = c.TId
where sc.CId in (select CId from sc where SId = '01')
group by s.SId;

-- 9. 查询和" 01 "号的同学学习的课程 完全相同的其他同学的信息
SELECT s.*
FROM sc
RIGHT JOIN course  c ON sc.CId = c.CId
RIGHT JOIN student s ON sc.SId = s.SId
LEFT JOIN teacher t ON  t.TId = c.TId
where sc.CId IN (select CId from sc where SId = '01')
group by sc.SId;

-- 10. 查询没学过"张三"老师讲授的任一门课程的学生姓名
SELECT *
FROM sc
RIGHT JOIN course  c ON sc.CId = c.CId
RIGHT JOIN student s ON sc.SId = s.SId
LEFT JOIN teacher t ON  t.TId = c.TId;

SELECT *
FROM sc
RIGHT JOIN course  c ON sc.CId = c.CId
RIGHT JOIN student s ON sc.SId = s.SId
LEFT JOIN teacher t ON  t.TId = c.TId
WHERE IFNULL(Tname,0) != '张三'
group by s.SId;

SELECT s.Sname
FROM sc
RIGHT JOIN course  c ON sc.CId = c.CId
RIGHT JOIN student s ON sc.SId = s.SId
LEFT JOIN teacher t ON  t.TId = c.TId
WHERE IFNULL(Tname,0) = '张三'
group by s.SId;

SELECT distinct s.*
FROM sc
RIGHT JOIN course  c ON sc.CId = c.CId
RIGHT JOIN student s ON sc.SId = s.SId
LEFT JOIN teacher t ON  t.TId = c.TId
WHERE s.Sname NOT IN (	SELECT distinct s.Sname
						FROM sc
						RIGHT JOIN course  c ON sc.CId = c.CId
						RIGHT JOIN student s ON sc.SId = s.SId
						LEFT JOIN teacher t ON  t.TId = c.TId
						WHERE IFNULL(Tname,0) = '张三');

-- 11. 查询两门及其以上不及格课程的同学的学号，姓名及其平均成绩
SELECT *
FROM sc
RIGHT JOIN course  c ON sc.CId = c.CId
RIGHT JOIN student s ON sc.SId = s.SId
LEFT JOIN teacher t ON  t.TId = c.TId;

SELECT s.Sname, c.Cname, sc.score
FROM sc
RIGHT JOIN course  c ON sc.CId = c.CId
RIGHT JOIN student s ON sc.SId = s.SId
LEFT JOIN teacher t ON  t.TId = c.TId
group by s.SId, c.Cname;

SELECT *
FROM sc
RIGHT JOIN course  c ON sc.CId = c.CId
RIGHT JOIN student s ON sc.SId = s.SId
LEFT JOIN teacher t ON  t.TId = c.TId
where ifnull(score,0) < 60
group by s.SId, c.Cname;

SELECT s.SId, s.Sname, c.Cname, sc.score
FROM sc
RIGHT JOIN course  c ON sc.CId = c.CId
RIGHT JOIN student s ON sc.SId = s.SId
LEFT JOIN teacher t ON  t.TId = c.TId
where ifnull(score,0) < 60
group by s.SId, c.Cname;

SELECT s.Sname,
		SUM(case when c.Cname = '语文'   then score else 0 end) `语文`, 
		SUM(case when c.Cname = '数学'   then score else 0 end) `数学`, 
		SUM(case when c.Cname = '英语'   then score else 0 end) `英语`
FROM sc
RIGHT JOIN course  c ON sc.CId = c.CId
RIGHT JOIN student s ON sc.SId = s.SId
LEFT JOIN teacher t ON  t.TId = c.TId
where ifnull(score,0) < 60
group by s.SId;

SELECT s.SID, s.Sname, avg(sc.score)
FROM sc
RIGHT JOIN student s ON sc.SId = s.SId
where sc.score < 60 or isnull(sc.score)
group by s.SId
HAVING count(sc.score)>=2 or count(sc.score)=0 ;

-- 12. 检索" 01 "课程分数小于 60，按分数降序排列的学生信息
SELECT s.*, sc.score
FROM sc
RIGHT JOIN course  c ON sc.CId = c.CId
RIGHT JOIN student s ON sc.SId = s.SId
where (sc.score < 60 and sc.CId = '01') or isnull(sc.score)
order by sc.score desc;

-- 13. 按平均成绩从高到低显示所有学生的所有课程的成绩以及平均成绩
SELECT s.*,
round(avg(score),1) `平均`
FROM sc
RIGHT JOIN course  c ON sc.CId = c.CId
RIGHT JOIN student s ON sc.SId = s.SId
group by s.SId
order by `平均` desc;

SELECT s.*,
SUM(case when c.Cname = '语文'   then score else null end) `语文`, 
SUM(case when c.Cname = '数学'   then score else null end) `数学`, 
SUM(case when c.Cname = '英语'   then score else null end) `英语`,
SUM(score) `總和`,
round(avg(score),1) `平均`
FROM sc
RIGHT JOIN course  c ON sc.CId = c.CId
RIGHT JOIN student s ON sc.SId = s.SId
group by s.SId
order by `平均` desc;

-- 14. 查询各科成绩最高分、最低分和平均分：
 
-- 以如下形式显示：课程 ID，课程 name，最高分，最低分，平均分，及格率，中等率，优良率，优秀率
 
-- 及格为>=60，中等为：70-80，优良为：80-90，优秀为：>=90
 
-- 要求输出课程号和选修人数，查询结果按人数降序排列，若人数相同，按课程号升序排列
SELECT s.*,
SUM(case when c.Cname = '语文'   then score else null end) `语文`, 
SUM(case when c.Cname = '数学'   then score else null end) `数学`, 
SUM(case when c.Cname = '英语'   then score else null end) `英语`,
SUM(score) `總和`,
round(avg(score),1) `平均`
FROM sc
RIGHT JOIN course  c ON sc.CId = c.CId
RIGHT JOIN student s ON sc.SId = s.SId
group by s.SId;

SELECT *
FROM sc
JOIN course  c ON sc.CId = c.CId
JOIN student s ON sc.SId = s.SId;

SELECT c.CId '课程 ID', c.Cname '课程 name', count(*) '选修人数', max(sc.score) '最高分', min(sc.score) '最低分', round(avg(sc.score),1) '平均分',
round(count(case when sc.score >= 60 then 1 end) / count(*) *100, 1) '及格率',
round(count(case when sc.score between 70 and 80 then 1 end) / count(*) *100, 1) '中等率',
round(count(case when sc.score between 80 and 90 then 1 end) / count(*) *100, 1) '优良率',
round(count(case when sc.score >= 90 then 1 end) / count(*) *100, 1) '优秀率'
FROM sc
JOIN course  c ON sc.CId = c.CId
JOIN student s ON sc.SId = s.SId
group by c.Cname
order by `选修人数` desc, `课程 ID`;

-- 15. 按各科成绩进行排序，并显示排名， Score 重复时保留名次空缺
select @rownum:=@rownum+1 'NO.', c.Cname, s.Sname, sc.score
from (select @rownum:=0) r, sc
JOIN course  c ON sc.CId = c.CId
JOIN student s ON sc.SId = s.SId
where c.CId = '01'
group by c.Cname, s.Sname
order by c.Cname, sc.score desc;

select @rownum:=@rownum+1 'NO.', t.*
from	
	(	select CId, SId, score
		from sc
        where CId = '01') t,
	 (	select @rownum:=0) r
order by score desc;

select @rownum:=@rownum+1 'NO.', t1.*
from(select CId, SId, score from sc where CId = '01') t1,
	(select @rownum:=0) r
order by t1.score desc;

select *
from
(
	(select @rownum:=@rownum+1 'NO', t1.*
	from(select CId, SId, score from sc where CId = '01') t1,(select @rownum:=0) r
	order by t1.score desc) join
	(select @rownum:=@rownum+1 'NO', t2.*
	from(select CId, SId, score from sc where CId = '02') t2,(select @rownum:=0) r
	order by t2.score desc) on t1.NO=t2.NO
) t ;
     
select @rownum:=@rownum+1'NO.', t.*
from	
	(	select c.Cname, s.Sname, sc.score
		from sc
		JOIN course  c ON sc.CId = c.CId
		JOIN student s ON sc.SId = s.SId) t,
	 (	select @rownum:=0) r
group by Cname, Sname
order by Cname, score desc;
