-- use DB명; 
-- 뒤의 데이터 베이스를 사용하겠다.
USE mysql;
SELECT HOST, USER, PASSWORD FROM USER;

-- DB 만들기
-- creat database DB명
-- DB 삭제
-- drop database DB명
CREATE DATABASE mydb;
-- 데이터베이스 목록확인
-- show databases;
SHOW DATABASES;
USE mydb;
-- 테이블 목록 확인
-- show tables;
SHOW TABLES;