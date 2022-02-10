-- 문제: hr 계정에서 사번을 넘기면 사번, 이름, 부서이름, 도시명을 4줄로 출력해주는 프로시져를 만들어봐라
SELECT 
	e.EMPLOYEE_ID 사번, e.FIRST_NAME || ' ' || e.LAST_NAME 이름, d.DEPARTMENT_NAME 부서명, l.CITY 도시명
FROM 
	EMPLOYEES e , DEPARTMENTS d, LOCATIONS l 
WHERE 
	e.DEPARTMENT_ID = d.DEPARTMENT_ID 
AND d.LOCATION_ID = l.LOCATION_ID
AND e.EMPLOYEE_ID = '100';

CREATE OR REPLACE PROCEDURE selectByID(vid EMPLOYEES.EMPLOYEES_ID%TYPE)
IS 
	TYPE emp_record IS RECORD 
	(vid EMPLOYEES.EMPLOYEES_ID%TYPE, vname varchar2(50), vdept DEPARTMENTS.DEPARTMENT_NAME%TYPE, vcity LOCATIONS.CITY%TYPE);
	emp_view emp_record;
BEGIN
	SELECT 
		e.EMPLOYEE_ID , e.FIRST_NAME || ' ' || e.LAST_NAME , d.DEPARTMENT_NAME , l.CITY 
	INTO
		emp_view.vid, emp_view.vname, emp_view.vdept, emp_view.vcity
	FROM 
		EMPLOYEES e , DEPARTMENTS d, LOCATIONS l 
	WHERE 
		e.DEPARTMENT_ID = d.DEPARTMENT_ID 
		AND d.LOCATION_ID = l.LOCATION_ID
		AND e.EMPLOYEE_ID = vid;	
	DBMS_OUTPUT.PUT_LINE('사번 : ' || emp_view.vid);
	DBMS_OUTPUT.PUT_LINE('이름 : ' || emp_view.vname);
    DBMS_OUTPUT.PUT_LINE('부서명 : ' || emp_view.vdept);
    DBMS_OUTPUT.PUT_LINE('도시명 : ' || emp_view.vcity);
END;

CALL selectById(100); 

-- 문제 : hr 계정에서 사번을 넘기면 사번, 이름, 부서이름, 도시명을 4줄로 출력해주는 프로시져를 만들어 실행하시오!!!! 
SELECT 
   e.EMPLOYEE_ID "사번" , e.FIRST_NAME || ' ' || e.LAST_NAME "이름", d.DEPARTMENT_NAME "부서명", l.CITY "도시명"
FROM 
   EMPLOYEES e , DEPARTMENTS d , LOCATIONS l 
WHERE 
   e.DEPARTMENT_ID = d.DEPARTMENT_ID AND d.LOCATION_ID = l.LOCATION_ID  
   AND 
   e.EMPLOYEE_ID =100;
   
CREATE OR REPLACE PROCEDURE selectById(vid EMPLOYEES.EMPLOYEE_ID%TYPE)
IS 
   TYPE emp_record IS RECORD 
   (vid EMPLOYEES.EMPLOYEE_ID%TYPE, vname varchar2(50), vdept  DEPARTMENTS.DEPARTMENT_NAME%TYPE , vcity LOCATIONS.CITY%TYPE);
   emp_view emp_record;
BEGIN 
   SELECT 
      e.EMPLOYEE_ID , e.FIRST_NAME || ' ' || e.LAST_NAME , d.DEPARTMENT_NAME , l.CITY 
   INTO 
      emp_view.vid, emp_view.vname, emp_view.vdept, emp_view.vcity
   FROM 
      EMPLOYEES e , DEPARTMENTS d , LOCATIONS l 
   WHERE 
      e.DEPARTMENT_ID = d.DEPARTMENT_ID AND d.LOCATION_ID = l.LOCATION_ID  
      AND 
      e.EMPLOYEE_ID =vid;
   DBMS_OUTPUT.PUT_LINE('사번 : ' || emp_view.vid);
   DBMS_OUTPUT.PUT_LINE('이름 : ' || emp_view.vname);
   DBMS_OUTPUT.PUT_LINE('부서명 : ' || emp_view.vdept);
   DBMS_OUTPUT.PUT_LINE('도시명 : ' || emp_view.vcity);
END;

-- 문제 : hr계정에서 부서번호를 입력하면 해당 부서의 모든 사원을 조회 하는 프로시져를 작성하시오
-- 		  XX부서의 인원
CREATE OR REPLACE PROCEDURE show_dept(vdept IN departments.DEPARTMENT_ID%TYPE)
IS 
	i BINARY_integer :=0;
	-- row타입의 배열 타입 선언
	TYPE emp_row_type IS TABLE OF employees%rowtype INDEX BY BINARY_integer;
	emp_row emp_row_type;
	dept_name departments.department_name%TYPE;
BEGIN
	SELECT d.DEPARTMENT_NAME INTO dept_name FROM DEPARTMENTS d WHERE d.DEPARTMENT_ID = vdept;
	DBMS_OUTPUT.PUT_LINE('부서명 : ' || dept_name);
	FOR emp IN (SELECT * FROM EMPLOYEES e WHERE e.DEPARTMENT_ID = vdept) LOOP
		i := i + 1;
		emp_row(i).EMPLOYEE_ID := emp.EMPLOYEE_ID;
		emp_row(i).FIRST_NAME := emp.FIRST_NAME;
		emp_row(i).LAST_NAME := emp.LAST_NAME;
		emp_row(i).DEPARTMENT_ID := emp.DEPARTMENT_ID;
		emp_row(i).SALARY := emp.SALARY;
	END LOOP;	
	DBMS_OUTPUT.PUT_LINE('부서인원 : ' || i || '명');
	DBMS_OUTPUT.PUT_LINE('========================================================');
	FOR cnt IN 1..i LOOP
		DBMS_OUTPUT.PUT_LINE('사번 : ' || emp_row(cnt).EMPLOYEE_ID );
		DBMS_OUTPUT.PUT_LINE('이름 : ' || emp_row(cnt).FIRST_NAME || ' ' || emp_row(i).LAST_NAME );
		DBMS_OUTPUT.PUT_LINE('부서 번호 : ' || emp_row(cnt).DEPARTMENT_ID );
		DBMS_OUTPUT.PUT_LINE('연봉 : ' || emp_row(cnt).SALARY || '달러');
		DBMS_OUTPUT.PUT_LINE('--------------------------------------------');
	END LOOP;
	DBMS_OUTPUT.PUT_LINE('========================================================');
END;

CALL SHOW_DEPT(10);
CALL SHOW_DEPT(80);

