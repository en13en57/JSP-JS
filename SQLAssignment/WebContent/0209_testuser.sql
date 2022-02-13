-- 가장 간단한 형태의 익명 프로시져
BEGIN
	DBMS_OUTPUT.PUT_LINE('Hello PL/SQL!!!'); -- 화면에 출력해라
END;


BEGIN
	FOR cnt IN 1..10 LOOP
		DBMS_OUTPUT.PUT_LINE('Hello Oracle!!');
	END LOOP;
END;

DECLARE -- 선언부
	vsum NUMBER :=  0;
BEGIN -- 시작
	FOR cnt IN 1..100 LOOP
		vsum := vsum + cnt;
	END LOOP;
	DBMS_OUTPUT.PUT_LINE('1~100까지 합 = ' || vsum);
END; -- 종료

-- 사원 정보를 저장하는 프로시져를 만들어 보자!!!
-- -------------------------------------------------
-- 1) select 결과를 이용하여 테이블 만들기
CREATE TABLE emp3 AS SELECT EMP_ID id, EMP_NAME name, SALARY sal FROM TEMP t;
-- 2) 만들어진 테이블 확인
SELECT * FROM emp3;
-- 3) 사원 등록 프로시져 만들기
CREATE OR REPLACE PROCEDURE insert_emp3(
	vid IN NUMBER,
	vname IN varchar2,
	vsal IN NUMBER 
)
IS 
BEGIN 
	INSERT INTO emp3 (id, name, sal) VALUES (vid, vname, vsal);
	COMMIT;
	DBMS_OUTPUT.PUT_LINE('사번 : ' || vid);
	DBMS_OUTPUT.PUT_LINE('이름 : ' || vname);
	DBMS_OUTPUT.PUT_LINE('연봉 : ' || vsal);
	DBMS_OUTPUT.PUT_LINE('저장 성공!!!');
END;
-- 4) 프로시져 호출
CALL insert_emp3(20220101, '나그네', 38900000);

SELECT * FROM emp3;

-- -------------------------------------------------------
-- 사번을 인수로 받아 연봉을 10% 인상 시키는 프로시저 작성
-- -------------------------------------------------------
CREATE OR REPLACE PROCEDURE update_sal(
	vid IN NUMBER -- 사번을 인수로 받는다. 
)
IS 
	salary NUMBER; -- 출력에 사용될 변수 선언
BEGIN 
	-- DB에서 지정 사번의 연봉을 가져와 salary변수에 저장 
	SELECT sal INTO salary FROM emp3 WHERE id=vid; 
	DBMS_OUTPUT.PUT_LINE('변경전 연봉 : ' || salary); -- 출력
	UPDATE emp3 SET sal = sal * 1.1 WHERE id=vid; -- 연봉 10%인상
	COMMIT; -- DB에 적용
	SELECT sal INTO salary FROM emp3 WHERE id=vid; -- 변경된 연봉 얻기
	DBMS_OUTPUT.PUT_LINE('변경후 연봉 : ' || salary); -- 출력
END;

CALL update_sal(19970101);

-- 프로시져 조회하기
SELECT * FROM USER_PROCEDURES;
-- 프로시져 내용까지 조회하기
SELECT * FROM USER_SOURCE;

SELECT * FROM emp3;
-- 프로시져와 함수의 차이는 리턴값이 있느냐 없느냐이다.
CREATE OR REPLACE  FUNCTION 
	fn_getsal(vid IN NUMBER ) RETURN NUMBER 
IS 
	vsal NUMBER;
BEGIN
	SELECT sal INTO vsal FROM emp3 WHERE id = vid;
	RETURN vsal;
END;

-- 함수의 호출
SELECT fn_getsal(19960101) FROM dual;

SELECT * FROM USER_SOURCE;


-- 지정 사번의 월급을 보너스 600%일때 가져오는 함수
CREATE OR REPLACE  FUNCTION 
	fn_getsal2(vid IN NUMBER ) RETURN NUMBER 
IS 
	vsal NUMBER;
BEGIN
	-- 12개월 + 상여 600% + 퇴직금 100% ==> 연봉
	SELECT round(sal/19, -3) INTO vsal FROM emp3 WHERE id = vid;
	RETURN vsal;
END;

SELECT fn_getsal2(19960101), fn_getsal2(19970101),fn_getsal2(19970201)  FROM dual;

SELECT NAME , SAL , fn_getsal2(ID) FROM emp3;

CREATE OR REPLACE  FUNCTION 
	fn_getsal3(vid IN NUMBER, rate IN NUMBER ) RETURN NUMBER -- 사번과 보너스 비율을 넘김
IS 
	vsal NUMBER;
BEGIN
	-- 12개월 + 상여 rate + 퇴직금 100% ==> 연봉
	SELECT round(sal/(13 + rate/100), -3) INTO vsal FROM emp3 WHERE id = vid;
	RETURN vsal;
END;

SELECT NAME , SAL , fn_getsal3(id, 100), fn_getsal3(id, 200), fn_getsal3(id, 300), fn_getsal3(id, 400) FROM emp3;

-- 문제 : 사번(19970101 숫자)를 받아 '1997년 01월 01일' 형태로 리턴하는 함수를 만드시오

SELECT 
	TO_CHAR(19970101),
	TO_DATE(TO_CHAR(19970101),'YYYYMMDD'),  
	TO_CHAR(TO_DATE(TO_CHAR(19970101),'YYYYMMDD'), 'YYYY"년 "MM"월 "DD"일"')  
FROM 
	dual;

CREATE OR REPLACE  FUNCTION 
	fn_getdate(vid IN NUMBER) RETURN VARCHAR2
IS 
	result_date VARCHAR2(50);
BEGIN
	SELECT 
		TO_CHAR(TO_DATE(TO_CHAR(id),'YYYYMMDD'), 'YYYY"년 "MM"월 "DD"일("DY")"')  
	INTO 
		result_date 
	FROM 
		emp3 
	WHERE 
		id = vid;
	RETURN result_date;
END;

SELECT fn_getdate(19970101) FROM dual;

SELECT fn_getdate(id) "입사일",NAME "이름", SAL "연봉" FROM emp3;


----------------------------------------------------------
-- 사번 : 0001
-- 이름 : 한사람
-- 월급 : 34567890원
-- 위와 같은 모양으로 조회를 하고 싶다. 어떻게 해야 할까?
----------------------------------------------------------
CREATE OR REPLACE PROCEDURE show_emp(vid IN NUMBER)
IS 
	rid   emp3.ID%TYPE; -- 변수의 타입을 테이블의 열 타입과 일치하게 만든다. 
	rname emp3.NAME%TYPE;
	rsal  emp3.SAL%TYPE;
BEGIN
	SELECT 
		id, name, sal
	INTO 
		rid, rname, rsal
	FROM 
		emp3 
	WHERE 
		id = vid;
	DBMS_OUTPUT.PUT_LINE('사번 : ' || rid);
	DBMS_OUTPUT.PUT_LINE('이름 : ' || rname);
	DBMS_OUTPUT.PUT_LINE('연봉 : ' || rsal || '원');
	DBMS_OUTPUT.PUT_LINE('=========================');
END; 

CALL show_emp(19960101); 
CALL show_emp(19970101); 
CALL show_emp(19970201); 

CREATE OR REPLACE PROCEDURE show_emp2(vid IN emp3.ID%TYPE)
IS 
	rrow   emp3%ROWTYPE; -- 변수의 타입을 테이블의 레코드 타입과 일치하게 만든다. 
BEGIN
	SELECT 
		id, name, sal
	INTO 
		rrow.id, rrow.name, rrow.sal
	FROM 
		emp3 
	WHERE 
		id = vid;
	DBMS_OUTPUT.PUT_LINE('사번 : ' || rrow.id);
	DBMS_OUTPUT.PUT_LINE('이름 : ' || rrow.name);
	DBMS_OUTPUT.PUT_LINE('연봉 : ' || rrow.sal || '원');
	DBMS_OUTPUT.PUT_LINE('=========================');
END; 

CALL show_emp2(19960101); 
CALL show_emp2(19970101); 
CALL show_emp2(19970201); 


-- PL/SQL 테이블 : 우리가 아는 테이블이 아니라 자바의 배열과 같은것을 PL/SQL에서는 테이블이라 한다.

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






