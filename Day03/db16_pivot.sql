-- PIVOT 
CREATE TABLE PIVOTTEST
(
	uName char(3),
    season char(2),
    amount int
);

INSERT INTO sqldb.pivottest
(uName, season, amount)
VALUES
('김범수', '겨울', 10), ('윤종신', '여름',15), ('김범수', '가을', 25), 
('김범수', '봄', 3), ('김범수', '봄', 37), ('윤종신', '겨울', 40), 
('김범수', '여름', 14), ('김범수', '여름', 22), ('윤종신', '여름', 64);

-- 피벗 기능 
SELECT uName
	,SUM(IF(SEASON ='봄' , AMOUNT, 0)) AS '봄'
    ,SUM(IF(SEASON ='여름' , AMOUNT, 0)) AS '여름'
    ,SUM(IF(SEASON ='가을' , AMOUNT, 0)) AS '가을'
    ,SUM(IF(SEASON ='겨울' , AMOUNT, 0)) AS '겨울'
    ,SUM(AMOUNT) AS '합계'
  FROM pivottest
 GROUP BY UNAME;
 