-- 1.	使用food和place資料表的食物編號、食物名稱、到期日、產地名稱和價格來建立一個View名為food_vw；並使用food_vw來查詢所有資料
SELECT f.id '食物編號', f.name '食物名稱', f.expiredate '到期日', p.name '產地名稱', price '價格'
FROM food f JOIN place p
ON f.placeid = p.id;

CREATE VIEW food_vw
AS  SELECT f.id '食物編號', f.name '食物名稱', DATE(f.expiredate) '到期日', p.name '產地名稱', price '價格'
	FROM food f JOIN place p
	ON f.placeid = p.id;

DROP VIEW food_vw;

SELECT * FROM food_vw;

-- 2.	新建一個View名為place_vw，欄位為每個產地最低價格、最高價格和平均價格
SELECT p.name '產地名稱', MIN(price) '最低價格', MAX(price) '最高價格', ROUND(AVG(price)) '平均價格'
FROM food f JOIN place p
ON f.placeid = p.id
GROUP BY p.id;

CREATE VIEW place_vw
AS  SELECT p.name '產地名稱', MIN(price) '最低價格', MAX(price) '最高價格', ROUND(AVG(price)) '平均價格'
	FROM food f JOIN place p
	ON f.placeid = p.id
    GROUP BY p.id;

SELECT * FROM place_vw;

-- 3.	新建一個View名為food_dessert_vw，有food資料表所有欄位，包含種類為'點心'的資料
SELECT * 
FROM food f JOIN place p
ON f.placeid = p.id
WHERE f.catalog = '點心';

CREATE VIEW food_dessert_vw
AS  SELECT f.*, p.name PlaceName
	FROM food f JOIN place p
	ON f.placeid = p.id
	WHERE f.catalog = '點心';

SELECT * FROM food_dessert_vw;
DROP VIEW food_dessert_vw;

-- 4.	使用food_dessert_vw去修改'太陽餅'的價格
UPDATE food_dessert_vw
SET price = 300 WHERE id = 'CK004';