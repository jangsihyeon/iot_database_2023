-- INSERT 
INSERT INTO usertbl
(userID, name, birthYear, addr, mobile1, mobile2, height, mDate)
VALUES
('JSH' , '장시현', 2000, '부산', '010', '88887777', 155, '2023-03-02');

-- 컬럼을 다 적을 때 입력안할 컬럼은 NULL로 지정 
INSERT INTO usertbl
(userID, name, birthYear, addr, mobile1, mobile2, height, mDate)
VALUES
('HGS' , '홍길순', 1987, '제주', NULL, NULL, NULL, NULL);

-- NULL 컬럼은 생략 가능 
INSERT INTO usertbl
(userID, name, birthYear, addr)
VALUES
('SHM' , '손흥민', 1993, '홍천');

-- 컬럼 지정을 생략가능 (단, 입력할 값의 순서가 컬럼 순서와 일치해야함)
INSERT INTO usertbl
(userID, name, birthYear, addr, mobile1, mobile2, height, mDate)
VALUES
('SJW' , '손정웅', 1969, '홍천', '010', '55664433', '176', NULL);

-- AUTO_INCREMENT 의 경우 필드 값을 입력하지 않아도 ㄱㅊ
INSERT INTO buytbl
(userID, prodName, groupName, price, amount)
VAlUES
('JSH', '노트북', '전자', 5000000, 1)