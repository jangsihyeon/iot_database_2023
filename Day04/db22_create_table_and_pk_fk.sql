CREATE TABLE USERTBL(
	USERID CHAR(8) NOT NULL PRIMARY KEY,
    NAME VARCHAR(10) NOT NULL, 
    BIRTHYEAR INT  NOT NULL,
    ADDR VARCHAR(10)
);

-- CREATE TABLE 키로 작성시 안됌..->
-- 외래키로 설정된 USERID에 데이터가 입력되기 위해 입력될 값이 회원 테이블에 USERID열에 존재해야한다는 사항 이해 필요..?
CREATE TABLE BUYTBL (
	NUM INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    USERID CHAR(8)  NOT NULL,
    PRODNAME VARCHAR(10)  NOT NULL,
    PRICE INT,
    FOREIGN KEY(USERID) REFERENCES USERTBL(USERID)
);

-- 실무에 가장 근접한 PK 방법 
-- 기본키 2개 지정
CREATE TABLE PRODTBL (
	PRODCODE CHAR(3) NOT NULL,
    PRODID CHAR(4) NOT NULL,
    PRODDATE DATETIME NOT NULL,
    PRODCUR VARCHAR(10) NULL,
    CONSTRAINT PK_PRODTBL_PRODCODE_PRODID
		PRIMARY KEY (PRODCODE, PRODID)
);

-- 멤버 테이블
CREATE TABLE MEMBERTBL(
	USERID CHAR(8) NOT NULL PRIMARY KEY,
    NAME VARCHAR(10) NOT NULL, 
    EMAIL VARCHAR(50) NULL UNIQUE -- 유니크 제약조건
);

CREATE TABLE STDTBL(
	USERID CHAR(8) NOT NULL PRIMARY KEY,
    NAME VARCHAR(10), 
    GRADE INT CHECK (GRADE >=1 AND GRADE <=4), -- 1~4 학년만
    CONSTRAINT CK_NAME CHECK (NAME IS NOT NULL)  -- = NOT NULL
);

