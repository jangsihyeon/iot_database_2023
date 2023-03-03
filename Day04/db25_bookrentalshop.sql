/* 책대여점 데이터 베이스 실습 */
-- 1. divtbl
SELECT *
  FROM divtbl;
  
--  2. bookstbl
SELECT *
  FROM bookstbl;

-- 3. membertbl
SELECT *
  FROM membertbl;
  
-- 4. rentaltbl 
SELECT *
FROM rentaltbl;

-- 책을 봅시다. 
-- DATE_FORMAT -> dtype이 date 혹은 datetime 이여야함 -> 문자열도 바뀜(mysql 특징)
SELECT replace(b.Author, ',' , '/') AS '저자명'
     , b.Division AS '장르코드' 
	 , b.Names AS '책제목'
     , DATE_FORMAT( b.ReleaseDate, '%Y년 %m월 %d일') AS '출판일'
	 , format(b.Price, '0,000') AS '금액' 
  FROM bookstbl AS b;

-- DATE_FORMAT 예제 -- CTRL+L : 한줄 지우기
SELECT date_format('2023-03-03 17:05:10', '%Y년 %m월 %d일 %H시 %i분 %s초') AS '일시';

-- 회원을 봅시다
SELECT m.Names AS '회원명' 
	 , m.Levels AS '등급'
     , m.Addr AS '주소'
     , m.Mobile AS '연락처'
     , CONCAT(upper(substring_index(m.Email, '@', 1))
			, '@'
			, lower(substring_index(m.Email, '@', -1))) AS '이메일'
  FROM membertbl AS m
 order by m.Names ASC;