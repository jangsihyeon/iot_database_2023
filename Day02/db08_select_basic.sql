-- Active: 1677474333407@@127.0.0.1@3306@employees
-- 사용 데이터베이스 변경
USE homeplus;

-- SELECT ALL  대신 SELECT *
-- 한문장 끝일때는 ; 으로 마무리
SELECT * FROM indextbl;
SELECT * FROM homeplus.indextbl;    /* 동일한 의미 */

-- homeplus_user 서버에서는 x
SELECT * FROM employees.titles;    -- 다른 DB의 테이블에서 데이터를 가져올려면 

-- 필요한 컬럼만 가져오겠다. 
SELECT first_name, last_name FROM indextbl;

-- sqlDB 사용 
USE sqldb;

-- 조건절로 검색 
SELECT userID
	   ,name        -- name은 키워드(sql만)
       ,birthYear
       ,height 
   FROM usertbl
   WHERE name = '김경호';    

-- 관계 연산자
SELECT * 
  FROM usertbl
WHERE birthYear >= 1970
  AND height >= 182;
  
-- 사이의 값을 조회
SELECT * 
  FROM usertbl
  WHERE height >=180
   AND height  <=183;
  
SELECT * 
  FROM usertbl
  WHERE height BETWEEN 180 AND 183;
  
-- IN 연산
SELECT *
  FROM usertbl
 WHERE addr IN ('경남' , '경북' , '전남');
 
-- 문자열 검색 -- 뉴스 본문 안에서 일정 단어를 검색  % OR _
SELECT * 
  FROM usertbl
 WHERE name LIKE '김__';
 
 --  SubQuery (서브쿼리)
 -- 1. 컬럼위치 
 -- 2. 테이블 위치
 -- 3. 조건절 위치 
 -- WHERE 절에 서브쿼리 컬럼이 한개 이상이거나 결과가 한개 이상이면 
 -- 조건연산자로 조회할 수 없음 
 SELECT name 
      , height
   FROM usertbl
  WHERE height > (SELECT height FROM usertbl WHERE name LIKE '김경호%');
  
-- 가상테이블 
-- AS 별명 
SELECT u.userID
	  ,u.name
      ,(2023-u.birthYear)
  FROM (
		SELECT userID, name, birthYear, addr
        FROM usertbl
        ) AS u 
 WHERE u.birthYear > 1969 ;
 
-- 컬럼에 쓰는 서브쿼리 
SELECT b.userID
      , (SELECT name FROM usertbl WHERE userID = b.userID) AS age
	    , b.prodName
      , b.price * b.amount
  FROM buytbl AS b;
  
-- 정렬 ORDER BY : DEFAULT ASC[ending] 안적어도 오름차순
-- 내림차순 DESC 
SELECT *
  FROM usertbl
 WHERE birthYear > 1069
 ORDER BY height DESC;

-- 중복 제거 / 중복 제거할 컬럼만 
SELECT DISTINCT addr
	FROM usertbl;
 
-- LIMIT 갯수 제한
USE homeplus;

SELECT * FROM indexTbl
  LIMIT 5;
  
USE sqldb;
-- 조회하면서 새로운 테이블 생성
CREATE TABLE elec_buytbl_new     -- 셀렉트 된 내용으로 새 테이블을 만듦 (새로 만드는 table은 pk 가 설정이 안됌 -> 잠시 쓰려고 만들때 위주 사용)
SELECT num
	  , prodName
      , price
  FROM buytbl
WHERE groupName = '전자';



 