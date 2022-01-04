# 1줄 주석
-- 1줄 주석
/*
여러줄 주석
*/

-- 테이블 목록 보기
show tables;
-- 테이블 구조 확인
desc hr_employees;
-- (Type (최대길이) Null(NO-반드시 입력))
/*
						   			 없으면 만들고, 있으면 만들지 마라.
CREATE [ OR REPLACE ] [ TEMPORARY ] TABLE [IF NOT EXISTS] table_name
( 
  column1 datatype [ NULL | NOT NULL]
                   [ DEFAULT default_value ]
                   [ AUTO_INCREMENT ]
    인덱스 생성 X  [ UNIQUE KEY | PRIMARY KEY ]
                   [ COMMENT 'string' ],

  column2 datatype [ NULL | NOT NULL]
                   [ DEFAULT default_value ]
                   [ AUTO_INCREMENT ]
                   [ UNIQUE KEY | PRIMARY KEY ]
                   [ COMMENT 'string' ],
 ...
 );
*/

/*
주소록을 만들어 보자
    
 */
CREATE TABLE address
(
    idx    INT            NOT NULL    AUTO_INCREMENT COMMENT '키필드', 
    name   VARCHAR(30)    not NULL    COMMENT '이름', 
    birth  DATE           NULL        COMMENT '생년월일', 
    phone  VARCHAR(15)    NULL        COMMENT '전화번호', 
    PRIMARY KEY (idx)
);
show tables;
desc address;

-- 암호화 함수
select '1234', password('1234'),  MD5('1234'), SHA('1234'); 
select length('1234'), length(password('1234')),  length(MD5('1234')), length(SHA('1234'));
--               4               41                      32                    40

-- 테이블 삭제명령 -- 복구 못함
-- DROP TABLE 테이블 이름
drop table MEMO;

-- not EXISTS : 없으면 만들고 있으면 만들지 말아라. 오라클 지원X
CREATE TABLE if not exists memo
(
    `idx`       INT            NOT NULL    AUTO_INCREMENT COMMENT '키필드', 
    `name`      VARCHAR(10)    NOT NULL        COMMENT '작성자', 
    `password`  VARCHAR(20)    NOT NULL        COMMENT '비밀번호', 
    `content`   TEXT           NOT NULL        COMMENT '내용', 
    `regDate`   DATETIME       default NOW()   COMMENT '작성일', 
    `IP`        VARCHAR(15)    NOT NULL        COMMENT 'IP', 
     PRIMARY KEY (idx)
);

show tables;
desc memo;

-- 데이터 확인하기
-- SELECT 필드명.... FROM 테이블명 [WHERE 조건]
select * from address; -- *은 모든 필드 표시

-- 데이터 저장하기
-- INSERT INTO 테이블명 (필드명...) VALUES (데이터...);
-- 문자열은 ''(작은따옴표)로 감싸 주어야 한다.
insert into address (name) values ('한사람');
select * from address;
insert into address (birth) values('1992-08-22'); -- 에러! 왜? name은 필수 입력이다.
insert into address (name, birth) values('두사람', '1992-08-22'); -- 필요한 것만 
select * from address;
insert into address (name, birth, phone) values('세사람', '1999-02-05', '010-2345-6789');
select * from address;
insert into address (phone, name, birth) values('010-2345-6789', '네사람', '1965-07-29'); -- 순서만 맞춰라
select * from address;
-- 전체 입력이면 필드명 생략 가능. 데이터는 순서 대로
insert into address values(0, '오사람', '1965-12-16', '010-8585-6789');
select * from address; -- idx는 자동 증가

select name, idx, phone from address;
select name 이름, idx 번호, phone 전화 from address; -- 필드명에 별칭 사용 가능          
select name as 이름, idx as 번호, phone as 전화 from address; -- 필드명에 별칭 사용 가능  as 넣어도되고 안넣어도됨.
select name as 이 름, idx as 번 호, phone as 전 화 from address; -- 에러!!! 별칭에 공백,특수문자 등은 입력X 
select name as "이 름", idx as "번 호", phone as "전 화" from address; -- 별칭에 공백을 넣고 싶으면 ""안에 별칭을 넣으시오 
select name '이 름', idx '번 호', phone '전 화' from address; -- 별칭에 공백을 넣고 싶으면 ''안에 별칭을 넣으시오 

-- 데이터 수정하기
-- UPDATE 테이블명 SET 필드명 = 값 ..... [WHERE 조건]
-- 조건을 주지 않으면 전체가 변경된다.
select * from address;
update address set birth = '1988-05-04' where name='한사람';
select * from address;
update address set phone = '011-5555-6666';
select * from address;

update address set birth = '1988-09-05', phone = '018-255-3236' where name = '한사람';
select * from address;

-- 데이터 삭제하기
-- delete from 테이블명 [where 조건]
-- 조건을 주지 않으면 전체가 삭제된다.

-- select 명령을 이용한 테이블 생성

create table temp as select * from address;
show tables;
select * from temp;
create table temp2 as select name, phone from address;
select * from temp2;

select * from temp;
delete from temp where idx=5;
select * from temp;
delete from temp where idx<=3;
select * from temp;

select * from temp2;
delete from temp2;
select * from temp2;

-- -----------------------------------------------------------------------------------------------------
-- select 명령을 배워보자
-- -----------------------------------------------------------------------------------------------------
-- hr_employees 테이블의 모든 열, 모든 행보기
select 
	*
from 
	hr_employees;

-- 행의 개수 알아보기
select 
	count(*)
from
	hr_employees;

-- +연산자로 문자열을 연결하지 못한다.
select 
	first_name + ' ' + last_name)
from
	hr_employees;

-- 문자열 연결은 concat(문자열1, 문자열2.....)로 한다.
select 
	concat(first_name, ' ' , last_name)
from
	hr_employees;

-- 
select 
	concat(first_name, ' ' , last_name,'님의 연봉은', SALARY,'입니다.') as '사원 연봉'
from
	hr_employees;
	
-- 연산자를 사용 가능하다.
-- 사원의 first_name과 월급을 조회하시오
select 
	FIRST_NAME , round(SALARY/13) 월급 
from
	hr_employees;

-- 조건을 줘보자
-- 1. 연봉이 12000 이상되는 직원들의 LAST_NAME 및 연봉을 조회한다.
select 
	LAST_NAME 이름, SALARY 연봉
from 
	hr_employees
where 
	salary >= 12000;

-- 2. 사원번호가 176 인 사람의 LAST_NAME 과 부서 번호를 조회한다.
select 
	LAST_NAME 이름, DEPARTMENT_ID 부서번호
from 
	hr_employees
where
	EMPLOYEE_ID = 176;
	
-- 3. 연봉이 5000 에서 12000의 범위 이외인 사람들의 LAST_NAME 및 연봉을 조회힌다.
select 
	LAST_NAME 이름, SALARY 연봉
from 
	hr_employees he 
where 
	SALARY <=12000 and SALARY >=5000;
-- 
select 
	LAST_NAME 이름, SALARY 연봉
from 
	hr_employees he 
where
	SALARY between 5000 and 12000;

-- 4. 1998/02/20 일부터 1998/05/01 사이에 고용된 사원들의 LAST_NAME 사번, 고용일자를 조회한다.
--    고용일자 순으로 정렬한다. order by 필드명 [ASC | DESC], .... : 정렬 기준
select
	LAST_NAME 이름, EMPLOYEE_ID 사번, HIRE_DATE 고용일자
from 
	hr_employees
where 
	HIRE_DATE >= '1998/02/20' and HIRE_DATE <= '1998/05/01';
-- 
select
	LAST_NAME 이름, EMPLOYEE_ID 사번, HIRE_DATE 고용일자
from 
	hr_employees
where 
	HIRE_DATE >= '1998-02-20' and HIRE_DATE <= '1998-05-01'order by HIRE_DATE;
-- 
select
	LAST_NAME 이름, EMPLOYEE_ID 사번, HIRE_DATE 고용일자
from 
	hr_employees
where 
	HIRE_DATE between '1998-02-20' and '1998-05-01'order by HIRE_DATE desc;

-- 부서별 오름차순 연봉별 내림차순
select 
	LAST_NAME, DEPARTMENT_ID, SALARY 
from 
	hr_employees
order by
	DEPARTMENT_ID , SALARY desc;

-- 5. 20 번 및 50 번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 부서 번호를 알파벳순으로 조회한다.
select 
	LAST_NAME, DEPARTMENT_ID 
from 
	hr_employees
where 
	DEPARTMENT_ID =20 or DEPARTMENT_ID =50
order by 
	last_name;
-- 
select 
	LAST_NAME, DEPARTMENT_ID 
from 
	hr_employees
where 
	DEPARTMENT_ID in (20, 50)
order by 
	last_name; 
	
-- 20, 50번 부서를 제외한 사원 목록
select 
	LAST_NAME, DEPARTMENT_ID 
from 
	hr_employees
where 
	DEPARTMENT_ID !=20 and DEPARTMENT_ID <> 50
order by 
	last_name; -- 같지않다 : !=, <>
	
select 
	LAST_NAME, DEPARTMENT_ID 
from 
	hr_employees
where 
	DEPARTMENT_ID not in (20, 50)
order by 
	last_name; 
	
-- 6. 20 번 및 50 번 부서에 근무하며, 연봉이 5000 ~ 12,000 사이인 사원들의 LAST_NAME 및 연봉을 조회한다.
select 
	LAST_NAME , DEPARTMENT_ID, SALARY 
from 
	hr_employees 
where 
	DEPARTMENT_ID in (20,50)
	and
	SALARY between 5000 and 12000;

-- 7. 1994년도에 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회한다.
select 
	LAST_NAME, HIRE_DATE 
from 
	hr_employees
where 
	HIRE_DATE between '1994-01-01' and '1994-12-31'

select 
	LAST_NAME, HIRE_DATE 
from 
	hr_employees
where 
	HIRE_DATE >= '1994-01-01' and HIRE_DATE <='1994-12-31';
-- 필드명 like 데이터 : _ 한글자, % 여러글자
select 
	LAST_NAME, HIRE_DATE 
from 
	hr_employees
where 
	HIRE_DATE like '1994%'; -- 1994로 시작하는...
	
-- 이름의 두번째 글자가 e인 직원
select 
	LAST_NAME 
from 
	hr_employees
where 
	LAST_NAME like '_e%';

-- 8월에 입사한 직원만
select 
	LAST_NAME, HIRE_DATE 
from 
	hr_employees
where 
	HIRE_DATE like '%-08-%';

	
-- 8-1. 매니저가 없는 사람들의 LAST_NAME 및 JOB_ID 를 조회한다.
select 
	LAST_NAME , JOB_ID 
from 
	hr_employees
where 
	MANAGER_ID = ''; -- 아무것도 나오지 않는다.

select 
	LAST_NAME , JOB_ID 
from 
	hr_employees
where 
	MANAGER_ID = null; -- 아무것도 나오지 않는다.

select 
	LAST_NAME , JOB_ID 
from 
	hr_employees
where 
	MANAGER_ID is null;

-- Null의 비교는 is null 또는 is not null로 해야만 한다.
	
