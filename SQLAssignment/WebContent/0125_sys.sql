-- 관리자 계정으로 로그인
-- 1. DBA권한으로 접속하여 SCOTT USER를 생성 한다. 
CREATE USER scott IDENTIFIED BY tiger;
-- 2. 권한 부여
GRANT connect, resource TO scott;