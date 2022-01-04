show tables;

-- 사람의 정보를 저장하고 싶다.
-- 무엇을 저장할까?

-- 키필드 : 데이터를 구분하기 위한 기본키(primary key)가 존재해야 한다.
-- 	        유일한 값 이어야 한다.
-- 번호 : 숫자 -- 키필드
-- 이름 : 문자
-- 나이 : 숫자
-- 성별 : 문자

-- 테이블 작성 : create table 테이블명(필드명 필드형식 필드자료형 제약조건, ....)
create table person(
	idx int auto_increment primary key, -- 키필드로 하겠다. 자동증가
	name varchar(10) not null, -- 문자 10자이내 반드시 입력해야한다.
	age int default 0, -- 숫자로 입력하지않으면 기본값으로 0을 가지게한다.
	gender char(1) check(gender in ('y', 'n')) -- 문자 1개로 'y'또는 'n'만 가진다.
);
-- 테이블 목록 확인
show tables;

-- 데이터 확인하기
-- select 필드명, .... from 테이블명; -- 모두보기

select * from person; -- person테이블의 모든 필드 확인하기

-- 데이터 저장하기
-- insert into 테이블명 (필드명....) values(값....);
insert into person (name) values ('한사람'); -- 문자열은 작은따옴표로 감싼다.
select * from person;

insert into person (name,age,gender) values ('한사람',23,'y');
select * from person;

insert into person (name,age,gender) values ('한사람',23,'Y');
select * from person;

-- 에러! 성병에는 Y,N 이외는 입력 불가
insert into person (name,age,gender) values ('한사람',23,'X'); 
select * from person;
-- 모든 필드에 저장하려면 필드명 생략 가능, 순서는 곡 지켜야한다.
insert into person values (0, '두사람',18,'N'); 
select * from person;
-- 에러! 세번째 나이는 숫자이어야 한다.
insert into person values (0, 18, '두사람','N'); 
select * from person;

insert into person (name,age) values ('세사람', 34);
insert into person (age,name) values (22, '네사람');
select * from person;

-- 에러! 키 필드는 중복된 값을 가질 수 없다.
insert into person values (1, '두사람', 56, 'N');
select * from person;


