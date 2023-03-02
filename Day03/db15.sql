-- 변수 사용 
USE sqldb;

SET @myVar1 = 5;
SELECT @myVar;
SET @myVar = '가수이름==>';

SELECT @myVar, name
  FROM usertbl
 WHERE height > 170;
 
SELECT name, height + @myVar1
  FROM usertbl;

-- 형변환 
SELECT CAST(birthYear AS CHAR) FROM usertbl;
-- 위랑 똑같음 (쓰는 방식의 차이)
SELECT CONVERT(birthYear , CHAR) FROM usertbl;
-- ADDR 같은건  CAST, CONVERT로도 못바꿈 (DB 마다 다르게 반응 <0 OR 에러>) 
SELECT CAST(CONVERT(birthYear, CHAR)AS SIGNED INTEGER) FROM usertbl;

-- 암시적 형변환
SELECT 200+300;

SELECT CONCAT('HELLO ', 'WOLRD');  -- 문자열 합치기

SELECT '200'+ '300' ; -- MySQL 이외에서는 200300 으로 출력
SELECT CONCAT('200 ', '300');

SELECT 1 = 1;   -- 1은 TRUE, 0은  FALSE

/* 내장함수 리스트 */ 
-- 흐름 함수 
-- 100 > 200 ? '참' : '거짓'
SELECT IF (100 < 200, '참', '거짓');

-- NULL은 계산이 오류 (결과도 NULL) 
SELECT IFNULL(NULL, 0)+100;

-- NULLIF 는 많이 사용 안됌 
SELECT NULLIF(100, 100);

-- 쿼리 작성할 때 많이 사용 
SELECT name
	, birthYear
    , addr
    , CASE addr
      WHEN '서울' THEN '수도권'
	  WHEN '경기' THEN '수도권'
      WHEN '부산' THEN '광역권'
      WHEN '한양' THEN '조선권'
      ELSE '지역권' END AS '권역'
  FROM usertbl;
  
-- 문자열 함수 
SELECT ASCII('A'), CHAR(65);
SELECT ASCII('안'), CHAR(236);  -- 한글은 사용하면 안됨
 
-- CHAR_LENGTH(글자길이), LENGTH(byte)
SELECT CHAR_LENGTH('ABC'), LENGTH('ABC');
SELECT CHAR_LENGTH('가나다'), LENGTH('가나다');    -- 한글은 한글자당 3bytes

SELECT REPLACE('HELLO WORLD', 'HELLO', 'BYEBYE');

-- DB는 인덱스를 1부터 시작 
SELECT INSTR('안녕하세요, 여러분' , '여');

-- LEFT, RIGHT
SELECT LEFT('ABCDEFGHIJKLMN', 3);
SELECT RIGHT('ABCDEFGHIJKLMN', 3);

-- UPPER, LOWER
SELECT UPPER('HELLo, wolrd'), LOWER('HELLo, wolrd');

-- LTRIM, RTRIM, TRIM 
SELECT LTRIM('          HELLo, wolrd          ') AS 'LTRIM';
SELECT RTRIM('          HELLo, wolrd          ') AS 'RTRIM';
SELECT TRIM('          HELLo, wolrd          ') AS 'TRIM';

-- HELLO * 3
SELECT REPEAT('HELLO', 3);

-- SUBSTRING 
SELECT SUBSTRING('대한민국만세' , 5, 2);

-- 수학함수 
SELECT ABS(-10);

SELECT CEILING(4.3), FLOOR(4.9), ROUND(4.4);

SELECT MOD(157, 10);


-- RANDOM 
SELECT RAND(), FLOOR(1+RAND()*6);   -- 주사위 놀이 

-- 날짜 및 시간 함수 
SELECT NOW();
SELECT ADDDATE('2023-03-02', INTERVAL 10 DAY);

SELECT YEAR(NOW());
SELECT MONTH(NOW());
SELECT HOUR(NOW());
SELECT DAYOFWEEK(NOW());
SELECT LAST_DAY(NOW());

-- 시스템 함수 
SELECT USER();

SELECT DATABASE();

-- ROW_COUNT()
USE sqldb;
UPDATE buytbl SET PRICE = PRICE *2;
SELECT row_count();

SELECT VERSION();
