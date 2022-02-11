-- PL/SQL 레코드 : 여러 개의 데이터 타입을 갖는 변수들의 집합입니다.
CREATE OR REPLACE PROCEDURE show_emp(vid IN emp3.ID%TYPE)
IS 
   -- 배열의 모양을 지정
   TYPE emp_rec IS RECORD (vid NUMBER , vname varchar2(40), vsal NUMBER);
   -- 실제 배열 변수 선언
   emp_row emp_rec;
BEGIN 
   SELECT 
      emp3.ID , emp3.NAME , emp3.SAL 
   INTO 
      emp_row.vid, emp_row.vname, emp_row.vsal
   FROM 
      emp3
   WHERE 
      id=vid;
   DBMS_OUTPUT.PUT_LINE('사번 : ' || emp_row.vid);
   DBMS_OUTPUT.PUT_LINE('이름 : ' || emp_row.vname);
   DBMS_OUTPUT.PUT_LINE('연봉 : ' || emp_row.vsal || '원');
END;

CALL show_emp(19960101);
CALL show_emp(19970101);

-- 문제: hr 계정에서 사번을 넘기면 사번, 이름, 부서이름, 도시명을 4줄로 출력해주는 프로시져를 만들어봐라

-- PL/SQL Table of Record
-- PL/SQL 변수 선언과 비슷하며 데이터 타입을 %ROWTYPE 으로 선언하면 됩니다.
-- 테이블과 레코드의 조합이다. row의 배열이다.
CREATE OR REPLACE PROCEDURE row_table
IS 
	i BINARY_INTEGER := 0;
	-- row타입의 배열 타입 선언
	TYPE emp_row_type IS TABLE OF emp3%rowtype INDEX BY BINARY_INTEGER;
	emp_row emp_row_type;
BEGIN
	FOR emp IN (SELECT * FROM EMP3 ) LOOP
		i := i + 1;
	emp_row(i).id := emp.id; 
	emp_row(i).name := emp.name; 
	emp_row(i).sal := emp.sal; 
	END LOOP;
	DBMS_OUTPUT.PUT_LINE('전체 : ' || i || '개의 데이터가 존재합니다.');
	fOR cnt IN 1..i LOOP
		DBMS_OUTPUT.PUT_LINE('번호 : ' || cnt);
		DBMS_OUTPUT.PUT_LINE('ID : ' || emp_row(cnt).id);
		DBMS_OUTPUT.PUT_LINE('NAME : ' || emp_row(cnt).name);
		DBMS_OUTPUT.PUT_LINE('SAL : ' || emp_row(cnt).sal);
	END LOOP;
END;

CALL row_table();

-- 문제 : hr계정에서 부서번호를 입력하면 해당 부서의 모든 사원을 조회 하는 프로시져를 작성하시오
-- 		  XX부서의 인원

-- 인덱스, 이름과 나이를 저장하는 테이블을 만들고, 임시데이터 10개를 저장하는 익명 프로시져를 만들어라

-- 오라클에서 난수 발생 함수
-- DBMS_RANDOM.VALUE(최소값, 최대값)
SELECT DBMS_RANDOM.VALUE(1000,10000) rand FROM dual;
SELECT round(DBMS_RANDOM.VALUE(20,100)) rand FROM dual;

SELECT round(DBMS_RANDOM.VALUE(1,45)) rand FROM dual CONNECT BY LEVEL <=6 ORDER BY rand;
-- 무작위 문자 생성 
SELECT DBMS_RANDOM.STRING('U', 10) rand FROM DUAL; -- 대문자
SELECT DBMS_RANDOM.STRING('L', 10) rand FROM DUAL; -- 소문자
SELECT DBMS_RANDOM.STRING('A', 10) rand FROM DUAL; -- 대/소문자
SELECT DBMS_RANDOM.STRING('X', 10) rand FROM DUAL; -- 대영/숫자
SELECT DBMS_RANDOM.STRING('P', 30) rand FROM DUAL; -- 특수문자혼합

CREATE SEQUENCE imsi_idx_seq;
CREATE TABLE imsi(idx NUMBER PRIMARY KEY, name varchar2(100) NOT NULL , age NUMBER);

BEGIN 
   FOR i IN 1..30 LOOP 
      INSERT INTO imsi VALUES 
      (imsi_idx_seq.nextval,DBMS_RANDOM.STRING('X', 10), round(DBMS_RANDOM.VALUE(20, 60)));
      COMMIT;
   END LOOP;
END;

SELECT * FROM imsi;

DROP SEQUENCE imsi_idx_seq;
DROP TABLE imsi;

-- 특정 사원의 급여를 일정%센트 인상/인하하는 프로시져
-- 인수 : 사번, 비율
-- 변경전 연봉 :
-- 변경후 연봉 : 를 조회하는 프로시져를 작성하시오
SELECT * FROM emp3; 

CREATE OR REPLACE PROCEDURE update_sal(vid NUMBER, vrate number)
IS 
   sal1 NUMBER;
   sal2 NUMBER;
BEGIN
   SELECT sal INTO sal1 FROM emp3 WHERE id=vid;
   UPDATE emp3 SET sal =  sal+(sal * (vrate/100)) WHERE id=vid;   -- 급여를 계산
   COMMIT;
   SELECT sal INTO sal2 FROM emp3 WHERE id=vid;
   DBMS_OUTPUT.PUT_LINE('번호 : ' || vid );
   DBMS_OUTPUT.PUT_LINE('변경 비율 : ' || vrate/100*100 || '%' );
   DBMS_OUTPUT.PUT_LINE('변경 전 : ' || sal1 );
   DBMS_OUTPUT.PUT_LINE('변경 후 : ' || sal2 );
END;

CALL update_sal(19960101, 10);
CALL update_sal(19960101, -20);

-- FOR LOOP 문
-- for 변수명 in 시작.. 종료 LOOP ~  END LOOP
