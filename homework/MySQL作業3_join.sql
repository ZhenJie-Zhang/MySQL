SELECT * FROM food;
SELECT * FROM place;

-- 1.	查詢所有食物名稱、產地編號、產地名稱和價格
SELECT	food.name, placeid, place.name, price
FROM	food JOIN place
ON		food.placeid = place.id;

SELECT	f.name '食物名稱', f.placeid '產地編號', p.name '產地名稱', f.price '價格(NT$)'
FROM	food f JOIN place p
ON		f.placeid = p.id;

-- 2.	查詢所有食物名稱和產地名稱，並串接成一個字串，中間以空白隔開，並將表頭重新命為'Food name & place'
SELECT	CONCAT(f.name, ' ', p.name) 'Food name & place', f.price '價格(NT$)'
FROM	food f JOIN place p
ON		f.placeid = p.id;

-- 3.	查詢所有'台灣'生產的食物名稱和價格
SELECT	f.name '食物名稱', f.price '價格(NT$)', p.name '產地'
FROM	food f JOIN place p
ON		f.placeid = p.id
WHERE	p.name = '台灣';

-- 4.	查詢所有'台灣'和'日本'生產的食物名稱和價格，並以價格做降冪排序
SELECT	f.name '食物名稱', f.price '價格(NT$)', p.name '產地'
FROM	food f JOIN place p
ON		f.placeid = p.id
WHERE	p.name = '台灣'
OR		p.name = '日本'
ORDER BY price DESC;

-- 5.	查詢前三個價格最高且'台灣'生產的食物名稱、到期日和價格，並以價格做降冪排序
SELECT	f.name '食物名稱', DATE(f.expiredate) '到期日', f.price '價格(NT$)', p.name '產地'
FROM	food f JOIN place p
ON		f.placeid = p.id
WHERE	p.name = '台灣'
ORDER BY price DESC
LIMIT	3;

-- 6.	查詢每個產地(顯示產地名稱)最高、最低、加總和平均價格，表頭分別命名為'Max'、'Min'、'Sum'和'Avg'，結果皆以四捨五入的整數來顯示
SELECT	p.name '產地名稱', MAX(price) 'Max', MIN(price) 'Min', SUM(price) 'Sum', ROUND(AVG(price)) 'Avg'
FROM	food f JOIN place p
ON		f.placeid = p.id
GROUP BY f.placeid;

-- 7.	查詢不同產地(顯示產地名稱)和每個種類的食物數量
SELECT	p.name '產地名稱', f.catalog '種類', COUNT(*) '食物數量'
FROM	food f JOIN place p
ON		f.placeid = p.id
GROUP BY f.placeid, f.catalog
ORDER BY f.placeid, f.catalog;

select @rownum:=@rownum+1 NO, name, price from food, (SELECT @rownum:=0) r;

SELECT	placeid '產地名稱', 
count(case when catalog = '點心'   then 1 end) `點心`, 
count(case when catalog = '飲料'   then 1 end) `飲料`, 
count(case when catalog = '調味品' then 1 end) `調味品`,
count(*) `總數`
FROM food
GROUP BY placeid with rollup;

SELECT	placeid '產地名稱', 
count(case when catalog = '點心'   then catalog end) `點心`, 
count(case when catalog = '飲料'   then catalog end) `飲料`, 
count(case when catalog = '調味品' then catalog end) `調味品`,
count(*) `總數`
FROM food
GROUP BY placeid with rollup;

SELECT	placeid '產地名稱', 
count(catalog = '點心') `點心`, 
count(catalog = '飲料') `飲料`, 
count(catalog = '調味品') `調味品`,
count(*) `總數`
FROM food
GROUP BY placeid with rollup;