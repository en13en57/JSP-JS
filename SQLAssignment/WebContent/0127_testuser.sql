INSERT INTO TEMP VALUES (20000101,'이태백',TO_DATE('19800125','YYYYMMDD'),'AA0001','인턴','Y','123-4567','등산', 30000000,'수습');
INSERT INTO TEMP VALUES (20000102,'김설악',TO_DATE('19800322','YYYYMMDD'),'AB0001','인턴','Y','234-5678','낚시', 30000000,'수습');
INSERT INTO TEMP VALUES (20000203,'최오대',TO_DATE('19800415','YYYYMMDD'),'AC0001','인턴','Y','345-6789','바둑', 30000000,'수습');
INSERT INTO TEMP VALUES (20000334,'박지리',TO_DATE('19800525','YYYYMMDD'),'BA0001','인턴','Y','456-7890','노래', 30000000,'수습');
INSERT INTO TEMP VALUES (20000305,'정북악',TO_DATE('19800615','YYYYMMDD'),'BB0001','인턴','Y','567-8901','독서', 30000000,'수습');
INSERT INTO TEMP VALUES (20006106,'유도봉',TO_DATE('19800705','YYYYMMDD'),'BC0001','인턴','Y','678-9012','술',   30000000,'수습');
INSERT INTO TEMP VALUES (20000407,'윤주왕',TO_DATE('19800815','YYYYMMDD'),'CA0001','인턴','Y','789-0123','오락', 30000000,'수습');
INSERT INTO TEMP VALUES (20000308,'강월악',TO_DATE('19800925','YYYYMMDD'),'CB0001','인턴','Y','890-1234','골프', 30000000,'수습');
INSERT INTO TEMP VALUES (20000119,'장금강',TO_DATE('19801105','YYYYMMDD'),'CC0001','인턴','Y','901-2345','술',   30000000,'수습');
INSERT INTO TEMP VALUES (20000210,'나한라',TO_DATE('19801215','YYYYMMDD'),'CD0001','인턴','Y','012-3456','독서', 30000000,'수습');
COMMIT;

SELECT * FROM TEMP t ;

CREATE TABLE TCOM (
        WORK_YEAR    VARCHAR2(04) NOT NULL,
        EMP_ID       NUMBER       NOT NULL,
        BONUS_RATE   NUMBER,
        COMM         NUMBER,
        CONSTRAINT COM_PK PRIMARY KEY (WORK_YEAR, EMP_ID)
);

-- SELECT 명령을 이용한 데이터 삽입

INSERT INTO 
	TCOM 
SELECT  '2001'  ,EMP_ID, 1,SALARY*0.01 FROM   TEMP WHERE  DEPT_CODE LIKE 'C%';

CREATE TABLE EMP_LEVEL (
	LEV             VARCHAR2(10) PRIMARY KEY,
   	FROM_SAL  		NUMBER,
  	TO_SAL         	NUMBER,
  	FROM_AGE  		NUMBER,
  	TO_AGE        	NUMBER
 );
INSERT INTO EMP_LEVEL VALUES ('사원',30000000,40000000,20,25);
INSERT INTO EMP_LEVEL VALUES ('대리',35000000,60000000,23,27);
INSERT INTO EMP_LEVEL VALUES ('과장',37000000,75000000,25,29);
INSERT INTO EMP_LEVEL VALUES ('차장',40000000,80000000,27,31);
INSERT INTO EMP_LEVEL VALUES ('부장',60000000,100000000,29,32);
COMMIT;

SELECT * FROM tab;

SELECT * FROM tcom;
SELECT * FROM EMP_LEVEL;

-- UNION과 UNION ALL : 합집합 구하기
SELECT EMP_ID FROM TEMP;	-- 20개
SELECT EMP_ID FROM TCOM;	-- 8개

SELECT EMP_ID FROM TEMP
UNION
SELECT EMP_ID FROM TCOM;   -- 20개(중복 제거) -- 정렬

SELECT EMP_ID FROM TEMP
UNION ALL
SELECT EMP_ID FROM TCOM;   -- 28개(중복 포함) -- 비정렬

-- 잘못 사용하는 예
SELECT EMP_ID, EMP_NAME FROM TEMP;
SELECT EMP_ID, BONUS_RATE FROM TCOM;

SELECT EMP_ID, EMP_NAME FROM TEMP
UNION
SELECT EMP_ID, BONUS_RATE FROM TCOM; -- 에러 왜? 앞의 결과는 숫자, 문자 인데 뒤의 결과는 숫자, 숫자 이므로 않됨

SELECT EMP_ID FROM TEMP
UNION
SELECT EMP_ID, BONUS_RATE FROM TCOM; -- 에러 왜? 앞의 결과는 1개 인데 뒤의 결과는 2개 이므로 않됨

-- UNION의 사용 예
-- TEMP 와 TCOM을 이용하여 사번, 연봉, 커미션을 보여주는 SQL을 만들어 보자.
-- 이때 연봉과 커미션이 모두 존재하는 사번은 두줄로 나와야 한다.
SELECT EMP_ID 사번, SALARY 연봉 FROM TEMP;
SELECT EMP_ID 사번, COMM 커미션 FROM TCOM;

SELECT EMP_ID 사번, SALARY 연봉 FROM TEMP
UNION
SELECT EMP_ID 사번, COMM 커미션 FROM TCOM; -- 잘못된 결과가 나왔다. 왜? 연봉자리에 커미션이 나온다.

SELECT EMP_ID 사번, SALARY 연봉, 0 커미션 FROM TEMP
UNION
SELECT EMP_ID 사번, 0 연봉, COMM 커미션 FROM TCOM;

-- UNION ALL 사용
-- TEMP 와 TCOM을 이용하여 사번, 연봉, 커미션을 보여주는 SQL을 만들어 보자.
-- 이때 연봉과 커미션이 모두 존재하는 사번은 두줄로 나와야 한다.
SELECT EMP_ID 사번, SALARY 연봉, 0 커미션 FROM TEMP
UNION ALL
SELECT EMP_ID 사번, 0 연봉, COMM 커미션 FROM TCOM;

-- INTERSECT : 교집합
SELECT EMP_ID FROM TEMP
INTERSECT
SELECT EMP_ID FROM TCOM; -- 8개 : 커미션을 받는 직원의 사번(교집합)

-- MINUS : 차집합
SELECT EMP_ID FROM TEMP
MINUS
SELECT EMP_ID FROM TCOM; -- 12개 : 커미션을 받지 않는 직원의 사번(교집합)

	(SELECT EMP_ID FROM TEMP
	INTERSECT
	SELECT EMP_ID FROM TCOM)
UNION 
	(SELECT EMP_ID FROM TEMP
	MINUS
	SELECT EMP_ID FROM TCOM);
	

-- ============================================================================================
-- JOIN : 2개 이상의 테이블을 연결하여 데이터를 조회하는 방법
-- ============================================================================================
-- 1. CARTESIAN JOIN : 조건 없이 조인하는 방법 : n * m 개의 결과가 나온다.
-- ============================================================================================

SELECT
	count(*)
FROM 
	TEMP E , TCOM C; -- 160 : tcom(8개) * temp(20개) = 160개

-- 사용예
-- temp 자료중에 과장을 읽어오는데 실제 DB내용이 2번 중복되게 조회하시오
SELECT  EMP_ID , EMP_NAME, LEV, SALARY FROM TEMP WHERE LEV = '과장';	
SELECT NO FROM MOD_TEST WHERE NO<=2;

SELECT 
	EMP_ID , EMP_NAME, LEV, SALARY
FROM 
	TEMP E , MOD_TEST M
WHERE 
	E.LEV = '과장' AND M."NO" <= 2
ORDER BY 
	2;


-- ============================================================================================
-- 2. EQUI JOIN : 조건 일치하는 값만 조인하는 방법
-- ============================================================================================
-- 사번, 이름, 부서번호, 부서이름을 조회 하시오!!!
SELECT EMP_ID, EMP_NAME, DEPT_CODE FROM TEMP t ;
SELECT DEPT_CODE, DEPT_NAME FROM TDEPT t;

SELECT 
	EMP_ID, EMP_NAME, E.DEPT_CODE, DEPT_NAME
FROM 
	TEMP E, TDEPT D; 

SELECT 
	EMP_ID, EMP_NAME, E.DEPT_CODE, DEPT_NAME
FROM 
	TEMP E, TDEPT D
WHERE 
	E.DEPT_CODE  = D.DEPT_CODE ; 

SELECT 
	EMP_ID, EMP_NAME, TEMP.DEPT_CODE, DEPT_NAME
FROM 
	TEMP, TDEPT
WHERE 
	TEMP.DEPT_CODE  = TDEPT.DEPT_CODE ; 

-- TCOM 의 WORK_YEAR가 2001인 자료를 TEMP의 사번과 연결해서 COMM을 받는 직원의 이름, 연봉+커미션을 조회하시오
SELECT 
	E.EMP_NAME "이름", E.SALARY + C.COMM "실수령액"
FROM 
	TEMP E, TCOM C
WHERE 
	E.EMP_ID  = C.EMP_ID AND C.WORK_YEAR = '2001'


-- ============================================================================================
-- 3. NON EQUI JOIN : 조건에 부등호가 사용되어 조인하는 방법
-- ============================================================================================
-- TEMP와 EMP_LEVEL을 연결하여 과장 직급을 가질만한 나이의 사원 목록을 출력하시오
SELECT * FROM TEMP;
SELECT * FROM EMP_LEVEL;
	
SELECT 
	EMP_ID , EMP_NAME , BIRTH_DATE ,
	round((SYSDATE-BIRTH_DATE)/365) 나이
FROM 
	TEMP t;	

UPDATE TEMP SET BIRTH_DATE  = ADD_MONTHS(BIRTH_DATE, 20*12); // 생년월을 20년 후로 모두 변경 

COMMIT;

SELECT 
	EMP_ID , EMP_NAME , BIRTH_DATE ,
	round((SYSDATE-BIRTH_DATE)/365) 나이
FROM 
	TEMP t;	

SELECT 
	L.LEV, E.EMP_ID, E.EMP_NAME, E.BIRTH_DATE, E.LEV
FROM
	TEMP E, EMP_LEVEL L
WHERE 
	BIRTH_DATE  BETWEEN ADD_MONTHS(SYSDATE, -1 * TO_AGE*12) AND  ADD_MONTHS(SYSDATE, -1 * FROM_AGE*12)
	AND L.LEV  = '과장';
	

-- TEMP와 EMP_LEVEL을 연결하여 과장 직급의 연봉을 받는 사원 목록을 출력하시오
SELECT 
	L.LEV,'('||L.FROM_SAL ||' ~ '|| L.TO_SAL || ')', E.EMP_ID, E.EMP_NAME, E.LEV, E.SALARY 
FROM
	TEMP E, EMP_LEVEL L
WHERE 
	E.SALARY  BETWEEN L.FROM_SAL AND  L.TO_SAL 
	AND L.LEV  = '과장';
	
-- ============================================================================================
-- 3. OUTER JOIN : 일치하는 행이 없더라도 나오게 조인하는 방법
-- ============================================================================================
/*
 1) LEFT OUTER JOIN : 조인문의 왼쪽에 있는 테이블의 모든 결과를 가져 온 후 오른쪽 테이블의 데이터를 매칭하고, 
                      매칭되는 데이터가 없는 경우 NULL로 표시한다.
   ex) SELECT 검색할 컬럼
       FROM 테이블명 LEFT OUTER JOIN 테이블명2
       ON 테이블.컬럼명 = 테이블2.컬럼명;

       <ORACLE>
       SELECT 검색할 컬럼
       FROM 테이블명, 테이블명2
       WHERE 테이블.컬럼명 = 테이블2.컬럼명(+);
       
  2) RIGHT OUTER JOIN : 조인문의 오른쪽에 있는 테이블의 모든 결과를 가져온 후 왼쪽의 테이블의 데이터를 매칭하고, 
                        매칭되는 데이터가 없는 경우 NULL을 표시한다.
   ex) SELECT 검색할 컬럼
       FROM 테이블명 RIGHT OUTER JOIN 테이블명2
       ON 테이블명 = 테이블명2;

       <ORACLE>
       SELECT 검색할 컬럼
       FROM 테이블명, 테이블명2
       WHERE 테이블.컬럼명(+) = 테이블2.컬럼명;
       
 3) FULL OUTER JOIN : LEFT OUTER JOIN 과 RIGHT OUTER JOIN을 합친 것으로, 양쪽 모두 조건이 일치하지 않는 것까지 
                      모두 결합해 출력한다
    ex) SELECT 검색할 컬럼
        FROM 테이블명 FULL OUTER JOIN 테이블명2
        ON 테이블.컬럼명 = 테이블2.컬럼명; (ORACLE의 경우)
         
※ MySQL에서는 FULL OUTER JOIN이 없으므로,
   LEFT OUTER JOIN 과 RIGHT OUTER JOIN을 UNION 하는 식으로 하여 FULL OUTER JOIN을 만들어 준다.        
*/

-- 일반 조인
SELECT 
	E.EMP_ID, C.EMP_ID 
FROM 
	TEMP E, TCOM C
WHERE 
	E.EMP_ID  = C.EMP_ID AND C.WORK_YEAR = '2001';

SELECT 
	E.EMP_ID, C.EMP_ID , E.SALARY, C.COMM 
FROM 
	TEMP E, TCOM C
WHERE 
	E.EMP_ID  = C.EMP_ID;

-- OUTER JOIN 1
SELECT 
	E.EMP_ID, C.EMP_ID 
FROM 
	TEMP E, TCOM C
WHERE 
	E.EMP_ID  = C.EMP_ID(+) 
	AND 
	C.WORK_YEAR(+) = '2001';

SELECT 
	E.EMP_ID, E.SALARY , C.COMM , NVL(C.COMM, 0)
FROM 
	TEMP E, TCOM C
WHERE 
	E.EMP_ID  = C.EMP_ID(+) 
	AND 
	C.WORK_YEAR(+) = '2001';


-- OUTER JOIN 2
SELECT 
	E.EMP_ID, C.EMP_ID 
FROM 
	TEMP E  LEFT OUTER JOIN TCOM C
ON 
	E.EMP_ID  = C.EMP_ID 
	AND 
	C.WORK_YEAR = '2001';

SELECT 
	E.EMP_ID, E.SALARY, NVL(C.COMM, 0) 
FROM 
	TEMP E  LEFT OUTER JOIN TCOM C
ON 
	E.EMP_ID  = C.EMP_ID 
	AND 
	C.WORK_YEAR = '2001';

-- 사용 예
-- 각 사번의 성명, 연봉, 연봉하한, 연봉상한 금액을 보고자 한다.
-- TEMP, EMP_LEVEL을 이용하여 조회하시오
-- 이때 수습 사원은 연봉 상한과 하한이 없더라도 나와야 한다.
SELECT 
	E.EMP_ID 사번, E.EMP_NAME 이름, L.FROM_SAL 연봉하한, L.TO_SAL 연봉상한
FROM 
	TEMP E, EMP_LEVEL L
WHERE 
	E.LEV  = L.LEV ;


SELECT 
	E.EMP_ID 사번, E.EMP_NAME 이름, NVL(L.FROM_SAL||'',' ') 연봉하한, NVL(L.TO_SAL||'', ' ') 연봉상한
FROM 
	TEMP E, EMP_LEVEL L
WHERE 
	E.LEV  = L.LEV(+) ;


SELECT 
	E.EMP_ID 사번, E.EMP_NAME 이름, NVL(L.FROM_SAL||'',' ') 연봉하한, NVL(L.TO_SAL||'', ' ') 연봉상한
FROM 
	TEMP E LEFT OUTER JOIN EMP_LEVEL L
ON 
	E.LEV  = L.LEV ;

-- ============================================================================================
-- 4. SELF JOIN : 동일한 테이블을 여러번 사용하여 조인하는 방법(반드시 별칭 사용해야 한다.)
-- ============================================================================================
-- 사용예
-- TDEPT테이블을 이용하여 부서코드, 부서명, 상위부서코드, 상위부서명을 조회하시오
SELECT * FROM TDEPT;
SELECT DEPT_CODE, DEPT_NAME  FROM TDEPT WHERE DEPT_CODE LIKE '_A%';
SELECT DEPT_CODE, DEPT_NAME  FROM TDEPT WHERE DEPT_CODE LIKE 'A%';
SELECT DEPT_CODE, DEPT_NAME  FROM TDEPT WHERE DEPT_CODE LIKE 'B%';
SELECT DEPT_CODE, DEPT_NAME  FROM TDEPT WHERE DEPT_CODE LIKE 'C%';

SELECT 
	t1.DEPT_CODE 부서코드,
	t1.DEPT_NAME 부서명,
	t2.DEPT_CODE 상위부서코드,
	t2.DEPT_NAME 상위부서명	
FROM 
	TDEPT t1, TDEPT t2
WHERE 
	t2.DEPT_CODE  = t1.PARENT_DEPT
ORDER BY 
	t1.DEPT_CODE; 

-- 문제 : HR계정에서 사번, 이름, 메니저이름을 조회하시오


-- 종합문제 : 사번, 이름, 생일, 나보다 생일이 빠른 사람수를 읽어와 나보다 생일이 빠른 사람수 순서로 조회하시오
--            NON-EUQI JOIN, SELF JOIN, OUTER JOIN을 한 문장으로 구성하시오!!!!
 
SELECT 
	A.EMP_ID 사번,
	A.EMP_NAME 이름,
	A.BIRTH_DATE 생일,
	COUNT(B.BIRTH_DATE) 연장자수
FROM 
	TEMP A, TEMP B
WHERE 
	A.BIRTH_DATE < B.BIRTH_DATE(+) 
GROUP BY 
	A.EMP_ID , A.EMP_NAME , A.BIRTH_DATE 
ORDER BY 
	4;

SELECT TO_DATE('1999-01-01','YYYY-MM-DD') , TO_DATE('2000-01-01','YYYY-MM-DD') FROM dual;
SELECT BIRTH_DATE FROM TEMP WHERE BIRTH_DATE < TO_DATE('2000-01-01','YYYY-MM-DD');
SELECT BIRTH_DATE FROM TEMP WHERE BIRTH_DATE > TO_DATE('2000-01-01','YYYY-MM-DD');
