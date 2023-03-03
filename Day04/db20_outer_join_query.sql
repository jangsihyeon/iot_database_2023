-- 쇼핑몰에 가입하고 물건을 한번도 구매하지 않은 회원까지 모두 출력 
-- RIGHT JOIN = BUYTBL의 13개 -> BUYTBL이 USERTBL의 자식(그 말은 NULL값이 거의 X)
-- LEFT JOIN = NULL값들 포함 21개의 데이터 (?)
-- 기준의 서로 만족하는것을 내주는게 JOIN (테이블을 묶어서 집합으로 만들어주는게 JOIN)
-- LEFT/ RIGHT JOIN은 서로 기준의 방향에 있는 테이블 모두 출력
-- JOIN 할때는 REVERSE로 확인 
SELECT U.*
	 , B.PRODNAME
     , B.GROUPNAME
     , B.PRICE
     , B.AMOUNT
  FROM usertbl AS U  -- 조인할때는 별명이 편함
  LEFT OUTER JOIN BUYTBL AS B 
    ON U.userID = B.USERID
  WHERE B.USERID IS NULL;
  
-- 학생중 동아리에 가입하지 않은 학생
SELECT S.STDNAME, S.ADDR
	 , J.NUM, C.CLUBNAME, C.ROONO
  FROM STDTBL AS S
 LEFT OUTER JOIN STDCLUBTBL AS J 
   ON S.STDNAME = J.STDNAME
 LEFT OUTER JOIN CLUBTBL AS C
   ON C.CLUBNAME = J.CLUBNAME
 UNION 
 -- 집합(두 쿼리 결과를 합쳐줌) -> 같은 결과값(중복을 제거)
 -- UNION ALL은 중복을 무시하고 출력 -> 결과가 더 많음 !
 -- JOIN이 아님 !! 두 셀렉트의 결과를 하나로 합쳐줌 
 -- 컬럼의 개수가 맞아야지 UNION 가능 (DTYPE도 같아야함)
SELECT S.STDNAME, S.ADDR
	 , J.NUM, C.CLUBNAME, C.ROONO
  FROM STDTBL AS S
 LEFT OUTER JOIN STDCLUBTBL AS J 
   ON S.STDNAME = J.STDNAME
 RIGHT OUTER JOIN CLUBTBL AS C
   ON C.CLUBNAME = J.CLUBNAME;
-- 이거 두개 다 하는게 FULL OUTER JOIN -> MUSQL에는 없음 

-- INNER JOIN의 약식표현 
SELECT U.*
	 , B.PRODNAME
     , B.GROUPNAME
     , B.PRICE
     , B.AMOUNT
  FROM usertbl AS U , BUYTBL AS B 
 WHERE U.USERID = B.USERID;
 
-- IN  : 조건이 만족하는것 
-- NOT IN : 조건이 만족하지 않은 것 
SELECT name
     , HEIGHT
  FROM USERTBL
 WHERE HEIGHT NOT IN (SELECT HEIGHT 
					FROM USERTBL 
				   WHERE NAME LIKE '김경호%');