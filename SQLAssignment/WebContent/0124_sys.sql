-- 날짜 확인하기
SELECT SYSDATE FROM dual;
-- 오라클은 select명령에서 from절을 생략할 수 없다.
SELECT 12+45*4;
SELECT 12+45*4 FROM dual;

-- dual테이블은 더비 테이블로 from을 생략하지 않도록 하기위해 만들어져 있다.
SELECT * FROM dual;

SELECT sysdate now, sysdate AS 날짜, sysdate AS "날 짜" FROM dual; -- 별칭 사용 가능

SELECT 'a' + 'b' FROM dual; -- 에러 : 문자를 어떻게 더하니....

SELECT 'a' || 'b' FROM dual; -- 문자열을 더할때는 ||연산자 사용

-- 실습 계정을 하나 만들어 보자
-- CREATE USER 계정명 IDENTIFIED BY 비번;
CREATE USER TESTUSER IDENTIFIED BY 123456;
-- 권한 설정
GRANT CONNECT, RESOURCE TO TESTUSER;


SELECT * FROM temp;

SELECT * FROM testuser.temp;

-- View를 만들수 있는 권한 부여 
GRANT CREATE VIEW  TO TESTUSER;
