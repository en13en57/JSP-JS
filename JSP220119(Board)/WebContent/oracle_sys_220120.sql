-- 톰캣과 포트번호 충돌시 포트 번호 변경 방법
-- 1) 현재 웹 관리 포트번호 확인
select dbms_xdb.gethttpport as "HTTP-Port" from dual;

-- 2) 현재 웹 포트 번호 변경하기
--    아래 세줄을 블록으로 감싸고, Ctrl + Enter치면 된다.
begin
dbms_xdb.sethttpport('22222');
end;

select dbms_xdb.gethttpport as "HTTP-Port" from dual;

-- 쿼리 연습을 위하여 XE에는 hr 계정이 만들어져있다.
-- 하지만 계정이 중지되어있다. 사용하려면 계정 중지를 해제해야 한다.
-- 계정 정보 출력
select username,account_status,lock_date from dba_users;

-- hr 계정 락 해제
alter user hr account unlock;
-- hr 계정 암호 변경
alter user hr identified by "123456";

-- 계정 생성하기!!

-- 1. DBA권한으로 접속하여 SCOTT USER를 생성 한다. 
-- CREATE USER 유저아이디 IDENTIFIED BY 비번;
CREATE USER scott IDENTIFIED BY tiger;

-- 2. 권한 부여
GRANT connect, resource TO scott;

-- JSP 실습용 계정
CREATE USER jspuser IDENTIFIED BY "123456";
GRANT connect, resource TO jspuser;

-- Querry 실습용 계정 생성
CREATE USER oracleuser IDENTIFIED BY "123456";
GRANT connect, resource TO oracleuser;


