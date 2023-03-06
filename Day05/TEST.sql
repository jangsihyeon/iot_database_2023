/* sql 코테 */
-- 1
SELECT CONCAT(substring(m.Names, 1, 1), ',', substring(m.Names, 2,3)) AS '회원명'
 	,  REPLACE(m.Addr, '부산시 ', '') as '주소'
	,  m.Mobile AS '폰번호'
    ,  CONCAT(UPPER(substring_index(m.Email, '@', 1))
	, '@'
    , UPPER(substring_index(m.Email, '@', -1))) AS '이메일'
  FROM membertbl AS m;


-- 2 
SELECT CASE 
     WHEN b.Division = 'B001' then '공포/스릴러'
     WHEN b.Division = 'B002' then '로맨스'
     WHEN b.Division = 'B003' then '무협'
     WHEN b.Division = 'B004' then '전쟁/역사'
     WHEN b.Division = 'B005' then '추리'
	 ELSE  'SF/판타지'
     END AS '장르'
     , b.Author AS '작가'
	 , b.Names AS '책제목'
   FROM bookrentalshop.bookstbl AS b
  ORDER BY b.Division DESC, b.Author;
  
-- 3
INSERT INTO divtbl
(Division, Names) 
VALUES 
('I002', '네트워크');

SELECT *
 FROM divtbl;
 
-- 4 

UPDATE membertbl
 SET Levels ='D'
   , Mobile='010-9839-9999'
 WHERE Names = '성명건';

SELECT *
 FROM membertbl;
 
-- 5

SELECT CASE WHEN GROUPING(B.Division) = 1 THEN '--합계--'
     WHEN b.Division = 'B001' then '공포/스릴러'
     WHEN b.Division = 'B002' then '로맨스'
     WHEN b.Division = 'B003' then '무협'
     WHEN b.Division = 'B004' then '전쟁/역사'
     WHEN b.Division = 'B005' then '추리'
	 ELSE  'SF/판타지'
     END AS '장르'
	,CONCAT(FORMAT(SUM(Price), '0.000'), '원') AS '장르별 총 합계'
   FROM bookrentalshop.bookstbl AS b
  GROUP BY B.Division 
   WITH ROLLUP 
   ORDER BY b.Division DESC;
   
   




  
