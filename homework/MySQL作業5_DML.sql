
SELECT * FROM food;

-- 1.	以不列舉欄位的方式新增一筆食物資料
INSERT INTO food VALUES ('DK004', '美人茶', '2021/06/25', 'TW', 780, '飲料');

-- 2.	以列舉欄位的方式新增一筆食物資料
INSERT INTO food(id, name, expiredate, placeid, price, catalog)
VALUES ('CK006', '羊羹', '2020/06/25', 'JP', 550, '點心');

-- 3.	以不列舉欄位的方式新增多產地資料
INSERT INTO food
VALUES 	('SG003', '白醋', '2020/06/25', 'TW', 60, '調味品'),
		('OL004', '葵花子油', '2020/06/25', 'TL', 420, '調味品');

-- 4.	修改一筆食物資料的價格
UPDATE food SET price = 80 WHERE id = 'CK005';

-- 5.	按價格分250以下、251~500和501以上三種分別增加8%,5%和3%且價格無條件捨去成整數
SELECT name, price '原價', 
		ROUND(price * CASE 
					  WHEN price <= 250                  THEN 1.08
                      WHEN price >  250 AND price <= 500 THEN 1.05
                      WHEN price >  500                  THEN 1.03
                      END) '價格(稅)'
FROM food;

-- 6.	刪除一筆食物資料
DELETE FROM food WHERE id = 'DK004';