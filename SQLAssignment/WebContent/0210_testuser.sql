CREATE OR REPLACE PROCEDURE show_all
IS 
	-- 배열 타입을 만들어 보자
	TYPE emp3_id_table IS TABLE OF emp3.id%TYPE INDEX BY BINARY_INTEGER; -- id타입의 배열
	TYPE emp3_name_table IS TABLE OF emp3.name%TYPE INDEX BY BINARY_INTEGER; -- name 타입의 배열 
	TYPE emp3_sal_table IS TABLE OF emp3.sal%TYPE INDEX BY BINARY_INTEGER; -- sal 타입의 배열 
	-- 실제 배열을 생성한다.
	emp3_id_array emp3_id_table;
	emp3_name_array emp3_name_table;
	emp3_sal_array emp3_sal_table;
	i  BINARY_INTEGER := 0;
BEGIN
	-- 모두 읽어 1개씩 반복해서 배열에 저장  : 첨자가 1부터이다. []가 아니라 ()이다.
	FOR list IN (SELECT * FROM emp3) LOOP 
		i := i + 1;
		emp3_id_array(i) := list.id;
		emp3_name_array(i) := list.name;
		emp3_sal_array(i) := list.sal;
	END LOOP;
	FOR cnt IN 1..i LOOP  
		DBMS_OUTPUT.PUT_LINE(' ');
		DBMS_OUTPUT.PUT_LINE('번호 : ' || cnt);
		DBMS_OUTPUT.PUT_LINE('사번 : ' || emp3_id_array(cnt));
		DBMS_OUTPUT.PUT_LINE('이름 : ' || emp3_name_array(cnt));
		DBMS_OUTPUT.PUT_LINE('연봉 : ' || emp3_sal_array(cnt) || '원');
		DBMS_OUTPUT.PUT_LINE('=========================');
	END LOOP; 
END; 


CALL show_all();


-- PL/SQL 레코드 : 여러 개의 데이터 타입을 갖는 변수들의 집합입니다.
CREATE OR REPLACE PROCEDURE show_emp(vid IN emp3.ID%TYPE)
IS 
	-- 배열의 모양을 지정
	-- TYPE 타입이름 IS RECORD (변수들.....);
	TYPE emp_rec IS RECORD (vid NUMBER , vname varchar2(40), vsal NUMBER);
	-- 실제 배열 변수 선언
	-- 변수명 변수터입;
	emp_row emp_rec;
BEGIN 
	SELECT 
		emp3.ID , emp3.NAME , emp3.SAL 
	INTO 
		-- 변수명.필드명
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

-- 문제 : hr 계정에서 사번을 넘기면 사번, 이름, 부서이름, 도시명을 4줄로 출력해주는 프로시져를 만들어 실행하시오!!!! 



-- PL/SQL Table of Record
-- PL/SQL TABLE 변수 선언과 비슷하며 데이터타입을 %ROWTYPE 으로 선언하면 됩니다.
-- 테이블과 레코드의 조합이다. row의 배열이다.
CREATE OR REPLACE PROCEDURE row_table
IS 
	i BINARY_INTEGER :=0;
	-- row타입의 배열 타입 선언
	TYPE emp_row_type IS TABLE OF emp3%ROWTYPE INDEX BY BINARY_INTEGER;
	emp_row emp_row_type;
BEGIN 
	FOR emp IN (SELECT * FROM emp3) LOOP
		i := i + 1;
		emp_row(i).id := emp.id; 
		emp_row(i).name := emp.name; 
		emp_row(i).sal := emp.sal; 
	END LOOP;
	DBMS_OUTPUT.PUT_LINE('전체 : ' || i || '개의 데이터가 존재 합니다.');
	FOR cnt IN 1..i LOOP
		DBMS_OUTPUT.PUT_LINE('번호 : ' || cnt );
		DBMS_OUTPUT.PUT_LINE('ID : ' || emp_row(cnt).id );
		DBMS_OUTPUT.PUT_LINE('NAME : ' || emp_row(cnt).name );
		DBMS_OUTPUT.PUT_LINE('SAL : ' || emp_row(cnt).sal );
	END LOOP;
END;
CALL row_table();

-- 문제 : hr계정에서 부서번호를 입력하면 해당 부서의 모든 사원을 조회하는 프로시져를 작성하시오
--        XX 부서의 인원


-- 인덱스, 이름과 나이를 저장하는 테이블을 만들고 임시데이터 10개를 저장하는 익명 프로시져를 만들어라

-- 오라클에서 난수 발생 함수
-- DBMS_RANDOM.VALUE(최소값, 최대값)
SELECT DBMS_RANDOM.VALUE(1000, 10000) rand FROM DUAL;
SELECT round(DBMS_RANDOM.VALUE(20, 100)) rand FROM DUAL;
SELECT round(DBMS_RANDOM.VALUE(1, 45)) rand FROM DUAL CONNECT BY LEVEL <=6 ORDER BY rand;

-- 무작위 문자 생성 
SELECT DBMS_RANDOM.STRING('U', 10) rand FROM DUAL; -- 대문자
SELECT DBMS_RANDOM.STRING('L', 10) rand FROM DUAL; -- 소문자
SELECT DBMS_RANDOM.STRING('A', 10) rand FROM DUAL; -- 대/소문자
SELECT DBMS_RANDOM.STRING('X', 10) rand FROM DUAL; -- 영숫자
SELECT DBMS_RANDOM.STRING('P', 30) rand FROM DUAL; -- 문자혼합

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


SELECT DBMS_RANDOM.RANDOM() rand1, round(DBMS_RANDOM.RANDOM()) FROM DUAL; 

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
	UPDATE emp3 SET sal =  sal+(sal * (vrate/100)) WHERE id=vid;	-- 급여를 계산
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
-- for 변수명 IN 시작..종료 LOOP ~ END LOOP

BEGIN 
	FOR i IN 1..10 LOOP -- 1부터 10까지 반복
		DBMS_OUTPUT.PUT_LINE('번호 : ' || i );
	END LOOP;
END;

-- 
BEGIN 
	FOR i IN 10..1 LOOP -- 한번도 반복되지 않는다.
		DBMS_OUTPUT.PUT_LINE('번호 : ' || i );
	END LOOP;
END;

BEGIN 
	FOR i IN REVERSE  1..10 LOOP -- 10 ~ 1까지 반복
		DBMS_OUTPUT.PUT_LINE('번호 : ' || i );
	END LOOP;
END;

-- 단수를 입력받아 구구단을 출력하는 프로시져를 만드시오
 CREATE OR REPLACE PROCEDURE gugu(dan IN NUMBER)
 IS
 BEGIN 
	 DBMS_OUTPUT.PUT_LINE('     ' || dan || '단');
	 FOR i IN 1..9 LOOP 
	 	DBMS_OUTPUT.PUT_LINE(LPAD(i,2,' ') || ' * ' || dan || ' = ' || LPAD(i*dan, 3,' '));
	 END LOOP;
 END;

CALL gugu(5);

-- LOOP 반복문 : 무한 반복 (EXIT WHEN 조건으로 탈출한다)
-- LOOP ~  EXIT WHEN 조건 ~ END LOOP
DECLARE
	v_cnt number := 1;
BEGIN 
	LOOP
		DBMS_OUTPUT.PUT_LINE('번호 : ' || v_cnt);
		v_cnt := v_cnt + 1;
		EXIT WHEN v_cnt>10;
	END LOOP; 
END;

-- WHILE 반복문 
-- WHILE 조건 LOOP ~ END LOOP
DECLARE
	v_cnt number := 1;
BEGIN 
	WHILE v_cnt<=10 LOOP
		DBMS_OUTPUT.PUT_LINE('번호 : ' || v_cnt);
		v_cnt := v_cnt + 1;
	END LOOP; 
END;

SELECT * FROM emp3;

-- 연봉이 40000000미만은 '최저연봉'라고 4000~6000 '표준연봉'라고 6000초과는 '고액연봉' 으로 구분하여 
-- 사번, 이름 , 연봉, 연봉 등급을 출력하시오
BEGIN 
	FOR rec IN (SELECT * FROM emp3) LOOP 
		IF rec.sal < 40000000 THEN 
			DBMS_OUTPUT.PUT_LINE(rec.id || ' ' || rec.name || '(' || rec.sal || ') : 최저연봉');
		ELSIF rec.sal>=40000000 AND rec.sal<=60000000 THEN 
			DBMS_OUTPUT.PUT_LINE(rec.id || ' ' || rec.name || '(' || rec.sal || ') : 표준연봉');		
		ELSE 
			DBMS_OUTPUT.PUT_LINE(rec.id || ' ' || rec.name || '(' || rec.sal || ') : 고액연봉');
		END IF; 
	END LOOP;
END;
/*
암시적 커서의 속성
◈ SQL%ROWCOUNT : 해당 SQL 문에 영향을 받는 행의 수
◈ SQL%FOUND : 해당 SQL 영향을 받는 행의 수가 1 개 이상일 경우 TRUE
◈ SQL%NOTFOUND : 해당 SQL 문에 영향을 받는 행의 수가 없을 경우 TRUE
◈ SQL%ISOPEN : 항상 FALSE, 암시적 커서가 열려 있는지의 여부 검색
*/
-- 암시적 커서 예제
CREATE OR REPLACE PROCEDURE Implicit_Cursor (p_empno emp3.id%TYPE)
is
	v_sal emp3.sal%TYPE;
	v_update_row NUMBER;
BEGIN
	SELECT sal INTO v_sal FROM emp3 WHERE id = p_empno ;
	-- 검색된 데이터가 있을경우
	IF SQL%FOUND THEN
		DBMS_OUTPUT.PUT_LINE('검색한 데이터가 존재합니다 : '||v_sal);
		UPDATE emp3 SET sal = sal*1.1 WHERE id = p_empno;
		-- 수정한 데이터의 카운트를 변수에 저장
		v_update_row := SQL%ROWCOUNT;
		DBMS_OUTPUT.PUT_LINE('급여가 인상된 사원 수 : '|| v_update_row);
	END IF;
END;

CALL Implicit_Cursor(1000);
CALL Implicit_Cursor(19970101);





















