-- employees db의 employees 테이블에서 데이터 10만개 가져오기
create table indexTBL(
	first_name VARCHAR(14),
    last_name VARCHAR(16),
	hire_date date
);

INSERT INTO indexTBL
	select first_name, last_name, hire_date
	from employees.employees
	limit 100000;
    
-- 조회 
select * from indexTBL
 WHERE first_name = 'Mary';

-- indexTBL 에 first_name 에 인덱스 생성
create index idx_indexTbl_firstname
	on indexTBL(first_name);