-- 1.	查詢所有比'鳳梨酥'貴的食物名稱、到期日和價格
SELECT price
FROM   food
WHERE  name = '鳳梨酥';

SELECT name, date(expiredate), price
FROM   food
WHERE  price > (SELECT price
				FROM   food
				WHERE  name = '鳳梨酥');
                
-- 2.	查詢所有比'曲奇餅乾'便宜且種類是'點心'的食物名稱、到期日和價格
SELECT price
FROM   food
WHERE  name = '曲奇餅乾';

SELECT name, date(expiredate), price
FROM   food
WHERE  price > (SELECT price
				FROM   food
				WHERE  name = '曲奇餅乾')
AND catalog = '點心';

-- 3.	查詢所有和'鳳梨酥'同一年到期的食物名稱、到期日和價格
SELECT YEAR(expiredate)
FROM   food
WHERE  name = '鳳梨酥';

SELECT name, date(expiredate), price
FROM   food
WHERE  YEAR(expiredate) =  (SELECT YEAR(expiredate)
							FROM   food
							WHERE  name = '鳳梨酥');

-- 	4.	查詢所有比平均價格高的食物名稱、到期日和價格
SELECT AVG(price)
FROM   food;

SELECT name, date(expiredate), price
FROM   food
WHERE  price >  (SELECT AVG(price)
				 FROM   food);

-- 5.	查詢所有比平均價格低的'台灣'食物名稱、到期日和價格
SELECT AVG(price)
FROM   food;

SELECT name, date(expiredate), price, placeid
FROM   food
WHERE  price <  (SELECT AVG(price)
				 FROM   food)
AND placeid = 'TW';

-- 6.	查詢所有種類和'仙貝'相同且價格比'仙貝'便宜的食物名稱、到期日和價格
SELECT catalog
FROM   food
WHERE  name = '仙貝';

SELECT price
FROM   food
WHERE  name = '仙貝';

SELECT name, date(expiredate), price
FROM   food
WHERE catalog =  (SELECT catalog
				  FROM   food
				  WHERE  name = '仙貝')
AND price < (SELECT price
			 FROM   food
			 WHERE  name = '仙貝');

-- 7.	查詢所有產地和'仙貝'相同且過期超過6個月以上的食物名稱、到期日和價格
SELECT placeid
FROM   food
WHERE  name = '仙貝';

SELECT placeid, name,date(expiredate), 
		DATE(expiredate) + INTERVAL 6 MONTH, 
        CURDATE(),
        (DATE(expiredate) + INTERVAL 6 MONTH) > DATE('2018/12/31'),
        (DATE(expiredate) + INTERVAL 6 MONTH) > CURDATE()
FROM   food
WHERE placeid = 'jp';

SELECT name, date(expiredate), price, CURDATE(), (date(expiredate) + INTERVAL 6 MONTH) > CURDATE() 
FROM   food
WHERE placeid = (SELECT placeid
				 FROM   food
				 WHERE  name = '仙貝')
AND (DATE(expiredate) + INTERVAL 6 MONTH) > CURDATE();

-- 8.	查詢每個產地價格最低的食物名稱、到期日和價格
SELECT placeid, MIN(price)
FROM   food
GROUP BY placeid;

SELECT name, date(expiredate), price, placeid
FROM   food f
WHERE price IN (SELECT MIN(price)
				FROM   food
				GROUP BY placeid
				HAVING  placeid = f.placeid);

SELECT name, date(expiredate), price, placeid
FROM   food f
WHERE price IN (SELECT MIN(price)
				FROM   food
                WHERE placeid = f.placeid
				GROUP BY placeid);

-- 9.	查詢每個種類的食物價格最高者的食物名稱和價格
SELECT placeid, catalog, name, MAX(price)
FROM   food
GROUP BY catalog;

SELECT placeid, catalog, name, price
FROM   food f
WHERE price IN (SELECT MAX(price)
				FROM   food
				GROUP BY catalog);

-- 10.	查詢所有種類不是'點心'但比種類是'點心'貴的食物名稱、種類和價格，並以價格做降冪排序
SELECT placeid, catalog, name, price
FROM   food
WHERE catalog != '點心';

SELECT placeid, catalog, name, price
FROM   food
WHERE catalog = '點心';

SELECT placeid, catalog, name, price
FROM   food f
WHERE catalog != '點心'
AND price > ALL 
			(SELECT price
			 FROM food
			 WHERE catalog = '點心');

-- 11.	查詢每個產地(顯示產地名稱)的食物價格最高者的食物名稱和價格
SELECT placeid, catalog, name, MAX(price)
FROM   food
GROUP BY placeid;

SELECT placeid, catalog, name, price
FROM   food f
WHERE price IN (SELECT MAX(price)
				FROM food
                WHERE placeid = f.placeid
                GROUP BY placeid);

SELECT p.name, f.catalog, f.name, MAX(f.price)
FROM   food f JOIN place p
ON     f.placeid = p.id
GROUP BY f.placeid;

SELECT p.name '產地', f.catalog '種類', f.name '名稱', f.price '價格'
FROM   food f JOIN place p
ON     f.placeid = p.id
WHERE  f.price IN (SELECT MAX(price)
				   FROM food
				   WHERE placeid = f.placeid
                   GROUP BY placeid)
ORDER BY p.name;

SELECT p.name '產地', f.catalog '種類', f.name '名稱', f.price '價格'
FROM   food f JOIN place p
ON     f.placeid = p.id
WHERE  f.price IN (SELECT MAX(price)
				   FROM food, place pp
				   WHERE placeid = f.placeid
                   GROUP BY pp.name)
ORDER BY p.name;

SELECT p.name '產地', f.catalog '種類', f.name '名稱', f.price '價格'
FROM   food f JOIN place p
ON     f.placeid = p.id
WHERE  f.price IN (SELECT MAX(ff.price)
				   FROM food ff, place pp
				   WHERE ff.placeid = f.placeid
                   GROUP BY pp.name)
ORDER BY p.name;

-- 以產地中文名，群組分別篩選食物最高價者，再去做表格印出
SELECT place.name '產地', catalog '種類', food.name '名稱', price '價格'
FROM   food JOIN place
ON     placeid = place.id
WHERE  price IN (SELECT MAX(food.price)
				   FROM food JOIN place
				   ON food.placeid = place.id
                   GROUP BY place.name)
ORDER BY place.name;

-- 以產地中文名，群組分別篩選食物最高價者，再去做表格印出，將main query的place全名改成"別名p"表示
SELECT p.name '產地', catalog '種類', food.name '名稱', price '價格'
FROM   food JOIN place p
ON     placeid = p.id
WHERE  price IN (SELECT MAX(food.price)
				   FROM food JOIN place
				   ON food.placeid = place.id
                   GROUP BY place.name)
ORDER BY p.name;

-- 以產地中文名，群組分別篩選食物最高價者，再去做表格印出，將指定的全名改成"別名"表示
SELECT p.name '產地', catalog '種類', f.name '名稱', price '價格'
FROM   food f JOIN place p
ON     f.placeid = p.id
WHERE  f.price IN (SELECT MAX(ff.price)
				   FROM food ff JOIN place pp
				   ON ff.placeid = pp.id
                   GROUP BY pp.name)
ORDER BY p.name;
