-- temp, tdept를 이용하여 상위부서가 'CA0001'인 부서에 소속된 직원을 아래와 같이 조회 하시오
-- 사번, 성명, 부서코드, 부서명, 상위부서코드, 상위부서명, 상위 부서장 코드, 상위부서장명
SELECT * FROM temp; 
SELECT * FROM tdept; 
-- 사번, 성명, 부서코드, 부서명, 상위부서코드
SELECT 
	e.EMP_ID 사번, e.EMP_NAME 성명, e.DEPT_CODE 부서코드, d.DEPT_NAME 부서이름, d.PARENT_DEPT 상위부서코드 
FROM 
	temp e, tdept d
WHERE 
	e.DEPT_CODE = d.DEPT_CODE 
	AND
	d.PARENT_DEPT = 'CA0001';
	
-- 사번, 성명, 부서코드, 부서명, 상위부서코드, 상위부서명, 상위 부서장 코드
SELECT 
	e.EMP_ID 사번, e.EMP_NAME 성명, e.DEPT_CODE 부서코드, d.DEPT_NAME 부서이름, d.PARENT_DEPT 상위부서코드, 
	td.DEPT_NAME 상위부서명, td.BOSS_ID 상위부서장코드
FROM 
	temp e, tdept d, TDEPT td 
WHERE 
	e.DEPT_CODE = d.DEPT_CODE 
	AND
	d.PARENT_DEPT = 'CA0001'
	AND 
	d.PARENT_DEPT = td.DEPT_CODE;
	
-- 사번, 성명, 부서코드, 부서명, 상위부서코드, 상위부서명, 상위 부서장 코드, 상위부서장명
SELECT 
	e.EMP_ID 사번, e.EMP_NAME 성명, e.DEPT_CODE 부서코드, d.DEPT_NAME 부서이름, d.PARENT_DEPT 상위부서코드, 
	td.DEPT_NAME 상위부서명, td.BOSS_ID 상위부서장코드, te.EMP_NAME "상위부서장명"
FROM 
	temp e, tdept d, TDEPT td, TEMP te 
WHERE 
	e.DEPT_CODE = d.DEPT_CODE 
	AND
	d.PARENT_DEPT = 'CA0001'
	AND 
	d.PARENT_DEPT = td.DEPT_CODE
	AND 
	td.BOSS_ID = te.EMP_ID ;


-- ====================================================================================
-- 서브쿼리(Sub-Query) : 쿼리안에 쿼리가 들어간다.
-- ====================================================================================
-- 1. 단일행 서브쿼리 : 서브쿼리의 결과가 1개인 서브쿼리
-- ------------------------------------------------------------------------------------	
-- 평균연봉보다 연봉이 많은 사원의 목록 조회
-- 1) 평균 연봉을 구한다.
SELECT avg(SALARY) FROM temp;
-- 2) 위에서 구한 평균 연봉을 이용하여 평균연봉보다 연봉이 많은 사원의 목록 조회
SELECT * FROM temp WHERE SALARY >= 43800000;

-- 위의 명령 2개 합치면 사원의 연봉이 변경되어도 계속 사용이 가능하다.
SELECT * FROM temp WHERE SALARY >= (SELECT avg(SALARY) FROM temp); -- 서브쿼리 이용

-- 문제 : 최소 연봉을 받는 지원들을 조회하시오
SELECT min(SALARY) FROM temp;
SELECT * FROM temp WHERE SALARY = 30000000;

SELECT * FROM temp WHERE SALARY = (SELECT min(SALARY) FROM temp); -- 서브쿼리 이용

-- ====================================================================================
-- 2. 복수행 서브쿼리 : 서브쿼리의 결과가 여러 행인 서브쿼리
--                      IN, ANY, ALL, Exists와 같이; 사용된다.
-- ------------------------------------------------------------------------------------	
-- 인천에 근무하는 직원의 사번과 성명을 읽어오자
SELECT * FROM TEMP t;
SELECT * FROM TDEPT t; 
SELECT * FROM TDEPT t WHERE AREA ='인천'; -- 3개행

-- 조인을 이용한 방법
SELECT 
	e.EMP_ID , e.EMP_NAME , d.AREA 
FROM 
	temp e, TDEPT d
WHERE 
	e.DEPT_CODE  = d.DEPT_CODE 
	AND 
	d.AREA  = '인천';

-- 서브 쿼리를 이용하여 조회하면
SELECT DEPT_CODE FROM TDEPT t WHERE AREA ='인천';

SELECT 
	EMP_ID , EMP_NAME 
FROM 
	TEMP
WHERE 
	DEPT_CODE IN (SELECT DEPT_CODE FROM TDEPT t WHERE AREA ='인천');

-- 문제 : 부서별 커미션을 받는 인원수를 세는 쿼리
SELECT * FROM TEMP t; -- 사원
SELECT * FROM TDEPT t; -- 부서
SELECT * FROM tcom; -- 커미션받는 직원

SELECT 
	d.DEPT_NAME , count(*)
FROM 
	TEMP e, TDEPT d
WHERE 
	e.DEPT_CODE  = d.DEPT_CODE 
	AND 
	e.EMP_ID IN (SELECT EMP_ID FROM TCOM)
GROUP BY 
	d.DEPT_NAME ; 


-- ====================================================================================
-- 3. 복수행, 복수열 서브쿼리 : 서브쿼리의 결과가 여러 행에 여러 컬럼인 서브쿼리
--                              복수개의 열을 묶어서 비교할때 주로 사용
-- ------------------------------------------------------------------------------------	
-- 부서테이블에서 부서코드와 보스ID을 읽어 사원테이블에 부서코드와 사번이 일치하는 자료 조회
-- 부서 장들만 조회
SELECT DEPT_CODE , BOSS_ID FROM tdept;

SELECT 
	EMP_ID , EMP_NAME 
FROM 
	TEMP 
WHERE 
	(DEPT_CODE, EMP_ID) IN (SELECT DEPT_CODE , BOSS_ID FROM tdept);

-- 부서별 최고 연봉금액을 읽어서 해당 부서와 최고 연봉금액이 동시에 일치하는 사원의
-- 사번, 성명, 연봉을 읽어와라.  -- 부서별 최고 연봉자 정보	
SELECT DEPT_CODE, max(SALARY) FROM temp GROUP BY DEPT_CODE; -- 부서별 최고 연봉
SELECT 
	EMP_ID , EMP_NAME , SALARY 
FROM 
	TEMP t 
WHERE 
	(DEPT_CODE, SALARY) IN (SELECT DEPT_CODE, max(SALARY) FROM temp GROUP BY DEPT_CODE);


-- ============================================================================================
-- 4. CORRELATED(상관; 상호관계) 서브쿼리 : 내부쿼리가 외부쿼리의 어떤 컬럼을 사용하는 서브쿼리
-- --------------------------------------------------------------------------------------------	
-- 직원 중 자신의 연봉이 자신과 같은 레벨에 해당하는 직원의 평균 연봉보다 많은 경우의 사번과 성명 조회
SELECT 
	EMP_ID , EMP_NAME , SALARY 
FROM 
	TEMP e1
WHERE 
	SALARY > (SELECT avg(SALARY) FROM temp e2 WHERE e1.LEV = e2.LEV);

-- Select결과를 insert하기
-- insert int 테이블명 (컬럼명,...) select 컬럼리스트 from 테이블명
SELECT count(*) FROM tcom;

INSERT INTO tcom (WORK_YEAR, EMP_ID, BONUS_RATE, COMM) SELECT '2022', EMP_ID, 0.1, salary * 0.1  FROM TEMP;
SELECT count(*) FROM tcom;

-- Select 결과를 테이블로 만들기
CREATE TABLE emp AS SELECT EMP_ID , EMP_NAME , BIRTH_DATE FROM temp;
SELECT * FROM emp;

/*
오라클의 ANY, SOME, ALL 연산자는 실무에서 자주 사용은 안하지만, 
사용법이 궁금해서 찾아보면 사용법이 생각보다 어렵고 어떤 상황의 쿼리문에서 사용해야 할지 머릿속에 그려지지 않는다.

SOME은 ANY와 이름만 다를뿐 동일한 기능의 연산자이며 아래의 예제는 ANY로만 작성하였다.

ANY(SOME), ALL은 주로 서브쿼리와 함께 사용하는 다중 행 연산자이며, ANY는 조건을 만족하는 값이 하나라도 있으면 결과를 리턴하고, ALL은 모든 값이 조건을 만족해야 결과를 리턴한다.
 

● ANY 조건 예시 (만족하는 값 하나만 있으면 됨)

조건	결과	설명
 1000 > ANY (500, 1000, 2000)	TRUE	 ANY 값에 1000 보다 작은 500이 있으므로 TRUE
 1000 = ANY (500, 1000, 2000)	TRUE	 ANY 값에 같은 값 1000이 있으므로 TRUE
 2000 < ANY (500, 1000, 2000)	FALSE	 ANY 값에 2000 보다 큰 값이 없으므로 FALSE
 

 = ANY 	 	하나라도 만족하는 값이 있으면 결과를 리턴 (IN과 동일)
 > ANY 	 	값들 중 최소값 보다 크면 결과를 리턴
 >= ANY 	값들 중 최소값 보다 크거나 같으면 결과를 리턴
 < ANY 	 	값들 중 최대값 보다 작으면 결과를 리턴
 <= ANY 	값들 중 최대값 보다 작거나 같으면 결과를 리턴
 <> ANY 	모든 값들 중 다른 값만 리턴 (값이 하나일 때만 가능, 사용X)
 

● ALL 조건 예시 (모든 값을 만족해야 함)
조건	결과	설명
 1000 > ALL (500, 1000, 2000)	FALSE	 1000이 ALL의 모든 값 보다 커야하므로 FALSE
 1000 = ALL (500, 1000, 2000)	FALSE	 1000이 ALL의 모든 값과 동일해야 하므로 FALSE
 3000 > ALL (500, 1000, 2000)	TRUE	 3000은 ALL의 모든 값 보다 크므로 TRUE
 

 > ALL 	 값들 중 최대값 보다 크면 결과를 리턴
 >= ALL  값들 중 최대값 보다 크거나 같으면 결과를 리턴
 < ALL 	 값들 중 최소값 보다 작으면 결과를 리턴
 <= ALL  값들 중 최소값 보다 작거나 같으면 결과를 리턴
 = ALL 	 모든 값들과 같아야 결과를 리턴 (값이 하나일 때만 가능, 사용X)
 <> ALL  모든 값들과 다르면 결과를 리턴
 */

-- 임시테이블 작성
WITH emp AS (
  SELECT 7839 empno, 'KING'   ename, 'PRESIDENT' job, NULL mgr, '1981-11-17' hiredate, 5000 sal, 10 deptno FROM DUAL UNION ALL
  SELECT 7566 empno, 'JONES'  ename, 'MANAGER'   job, 7839 mgr, '1981-04-02' hiredate, 2000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7788 empno, 'SCOTT'  ename, 'ANALYST'   job, 7566 mgr, '1987-04-19' hiredate, 3000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7844 empno, 'TURNER' ename, 'SALESMAN'  job, 7698 mgr, '1981-09-08' hiredate, 1500 sal, 30 deptno FROM DUAL UNION ALL
  SELECT 7876 empno, 'ADAMS'  ename, 'CLERK'     job, 7788 mgr, '1987-05-23' hiredate, 1000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7369 empno, 'SMITH'  ename, 'CLERK'     job, 7902 mgr, '1980-12-17' hiredate, 800  sal, 30 deptno FROM DUAL 
)

SELECT *
  FROM emp
 WHERE sal = ANY (1000, 2000, 3000);


WITH emp AS (
  SELECT 7839 empno, 'KING'   ename, 'PRESIDENT' job, NULL mgr, '1981-11-17' hiredate, 5000 sal, 10 deptno FROM DUAL UNION ALL
  SELECT 7566 empno, 'JONES'  ename, 'MANAGER'   job, 7839 mgr, '1981-04-02' hiredate, 2000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7788 empno, 'SCOTT'  ename, 'ANALYST'   job, 7566 mgr, '1987-04-19' hiredate, 3000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7844 empno, 'TURNER' ename, 'SALESMAN'  job, 7698 mgr, '1981-09-08' hiredate, 1500 sal, 30 deptno FROM DUAL UNION ALL
  SELECT 7876 empno, 'ADAMS'  ename, 'CLERK'     job, 7788 mgr, '1987-05-23' hiredate, 1000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7369 empno, 'SMITH'  ename, 'CLERK'     job, 7902 mgr, '1980-12-17' hiredate, 800  sal, 30 deptno FROM DUAL 
)

SELECT *
  FROM emp
 WHERE sal > ANY (1000, 2000, 3000);


WITH emp AS (
  SELECT 7839 empno, 'KING'   ename, 'PRESIDENT' job, NULL mgr, '1981-11-17' hiredate, 5000 sal, 10 deptno FROM DUAL UNION ALL
  SELECT 7566 empno, 'JONES'  ename, 'MANAGER'   job, 7839 mgr, '1981-04-02' hiredate, 2000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7788 empno, 'SCOTT'  ename, 'ANALYST'   job, 7566 mgr, '1987-04-19' hiredate, 3000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7844 empno, 'TURNER' ename, 'SALESMAN'  job, 7698 mgr, '1981-09-08' hiredate, 1500 sal, 30 deptno FROM DUAL UNION ALL
  SELECT 7876 empno, 'ADAMS'  ename, 'CLERK'     job, 7788 mgr, '1987-05-23' hiredate, 1000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7369 empno, 'SMITH'  ename, 'CLERK'     job, 7902 mgr, '1980-12-17' hiredate, 800  sal, 30 deptno FROM DUAL 
)

SELECT *
  FROM emp
 WHERE sal >= ANY (1000, 2000, 3000);


WITH emp AS (
  SELECT 7839 empno, 'KING'   ename, 'PRESIDENT' job, NULL mgr, '1981-11-17' hiredate, 5000 sal, 10 deptno FROM DUAL UNION ALL
  SELECT 7566 empno, 'JONES'  ename, 'MANAGER'   job, 7839 mgr, '1981-04-02' hiredate, 2000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7788 empno, 'SCOTT'  ename, 'ANALYST'   job, 7566 mgr, '1987-04-19' hiredate, 3000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7844 empno, 'TURNER' ename, 'SALESMAN'  job, 7698 mgr, '1981-09-08' hiredate, 1500 sal, 30 deptno FROM DUAL UNION ALL
  SELECT 7876 empno, 'ADAMS'  ename, 'CLERK'     job, 7788 mgr, '1987-05-23' hiredate, 1000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7369 empno, 'SMITH'  ename, 'CLERK'     job, 7902 mgr, '1980-12-17' hiredate, 800  sal, 30 deptno FROM DUAL 
)

SELECT *
  FROM emp
 WHERE sal < ANY (1000, 2000, 3000);


WITH emp AS (
  SELECT 7839 empno, 'KING'   ename, 'PRESIDENT' job, NULL mgr, '1981-11-17' hiredate, 5000 sal, 10 deptno FROM DUAL UNION ALL
  SELECT 7566 empno, 'JONES'  ename, 'MANAGER'   job, 7839 mgr, '1981-04-02' hiredate, 2000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7788 empno, 'SCOTT'  ename, 'ANALYST'   job, 7566 mgr, '1987-04-19' hiredate, 3000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7844 empno, 'TURNER' ename, 'SALESMAN'  job, 7698 mgr, '1981-09-08' hiredate, 1500 sal, 30 deptno FROM DUAL UNION ALL
  SELECT 7876 empno, 'ADAMS'  ename, 'CLERK'     job, 7788 mgr, '1987-05-23' hiredate, 1000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7369 empno, 'SMITH'  ename, 'CLERK'     job, 7902 mgr, '1980-12-17' hiredate, 800  sal, 30 deptno FROM DUAL 
)

SELECT *
  FROM emp
 WHERE sal <= ANY (1000, 2000, 3000);


WITH emp AS (
  SELECT 7839 empno, 'KING'   ename, 'PRESIDENT' job, NULL mgr, '1981-11-17' hiredate, 5000 sal, 10 deptno FROM DUAL UNION ALL
  SELECT 7566 empno, 'JONES'  ename, 'MANAGER'   job, 7839 mgr, '1981-04-02' hiredate, 2000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7788 empno, 'SCOTT'  ename, 'ANALYST'   job, 7566 mgr, '1987-04-19' hiredate, 3000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7844 empno, 'TURNER' ename, 'SALESMAN'  job, 7698 mgr, '1981-09-08' hiredate, 1500 sal, 30 deptno FROM DUAL UNION ALL
  SELECT 7876 empno, 'ADAMS'  ename, 'CLERK'     job, 7788 mgr, '1987-05-23' hiredate, 1000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7369 empno, 'SMITH'  ename, 'CLERK'     job, 7902 mgr, '1980-12-17' hiredate, 800  sal, 30 deptno FROM DUAL 
)

SELECT *
  FROM emp
 WHERE sal <> ANY (1000, 2000, 3000);

WITH emp AS (
  SELECT 7839 empno, 'KING'   ename, 'PRESIDENT' job, NULL mgr, '1981-11-17' hiredate, 5000 sal, 10 deptno FROM DUAL UNION ALL
  SELECT 7566 empno, 'JONES'  ename, 'MANAGER'   job, 7839 mgr, '1981-04-02' hiredate, 2000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7788 empno, 'SCOTT'  ename, 'ANALYST'   job, 7566 mgr, '1987-04-19' hiredate, 3000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7844 empno, 'TURNER' ename, 'SALESMAN'  job, 7698 mgr, '1981-09-08' hiredate, 1500 sal, 30 deptno FROM DUAL UNION ALL
  SELECT 7876 empno, 'ADAMS'  ename, 'CLERK'     job, 7788 mgr, '1987-05-23' hiredate, 1000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7369 empno, 'SMITH'  ename, 'CLERK'     job, 7902 mgr, '1980-12-17' hiredate, 800  sal, 30 deptno FROM DUAL 
)

SELECT *
  FROM emp
 WHERE sal > SOME (SELECT sal
                    FROM emp
                   WHERE deptno = 20);

--------------------------------------
-- ALL 연산자 예제 쿼리
--------------------------------------

WITH emp AS (
  SELECT 7839 empno, 'KING'   ename, 'PRESIDENT' job, NULL mgr, '1981-11-17' hiredate, 5000 sal, 10 deptno FROM DUAL UNION ALL
  SELECT 7566 empno, 'JONES'  ename, 'MANAGER'   job, 7839 mgr, '1981-04-02' hiredate, 2000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7788 empno, 'SCOTT'  ename, 'ANALYST'   job, 7566 mgr, '1987-04-19' hiredate, 3000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7844 empno, 'TURNER' ename, 'SALESMAN'  job, 7698 mgr, '1981-09-08' hiredate, 1500 sal, 30 deptno FROM DUAL UNION ALL
  SELECT 7876 empno, 'ADAMS'  ename, 'CLERK'     job, 7788 mgr, '1987-05-23' hiredate, 1000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7369 empno, 'SMITH'  ename, 'CLERK'     job, 7902 mgr, '1980-12-17' hiredate, 800  sal, 30 deptno FROM DUAL 
)

SELECT *
  FROM emp
 WHERE sal > ALL (1000, 2000, 3000)
;

WITH emp AS (
  SELECT 7839 empno, 'KING'   ename, 'PRESIDENT' job, NULL mgr, '1981-11-17' hiredate, 5000 sal, 10 deptno FROM DUAL UNION ALL
  SELECT 7566 empno, 'JONES'  ename, 'MANAGER'   job, 7839 mgr, '1981-04-02' hiredate, 2000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7788 empno, 'SCOTT'  ename, 'ANALYST'   job, 7566 mgr, '1987-04-19' hiredate, 3000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7844 empno, 'TURNER' ename, 'SALESMAN'  job, 7698 mgr, '1981-09-08' hiredate, 1500 sal, 30 deptno FROM DUAL UNION ALL
  SELECT 7876 empno, 'ADAMS'  ename, 'CLERK'     job, 7788 mgr, '1987-05-23' hiredate, 1000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7369 empno, 'SMITH'  ename, 'CLERK'     job, 7902 mgr, '1980-12-17' hiredate, 800  sal, 30 deptno FROM DUAL 
)

SELECT *
  FROM emp
 WHERE sal >= ALL (1000, 2000, 3000)
;

WITH emp AS (
  SELECT 7839 empno, 'KING'   ename, 'PRESIDENT' job, NULL mgr, '1981-11-17' hiredate, 5000 sal, 10 deptno FROM DUAL UNION ALL
  SELECT 7566 empno, 'JONES'  ename, 'MANAGER'   job, 7839 mgr, '1981-04-02' hiredate, 2000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7788 empno, 'SCOTT'  ename, 'ANALYST'   job, 7566 mgr, '1987-04-19' hiredate, 3000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7844 empno, 'TURNER' ename, 'SALESMAN'  job, 7698 mgr, '1981-09-08' hiredate, 1500 sal, 30 deptno FROM DUAL UNION ALL
  SELECT 7876 empno, 'ADAMS'  ename, 'CLERK'     job, 7788 mgr, '1987-05-23' hiredate, 1000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7369 empno, 'SMITH'  ename, 'CLERK'     job, 7902 mgr, '1980-12-17' hiredate, 800  sal, 30 deptno FROM DUAL 
)

SELECT *
  FROM emp
 WHERE sal < ALL (1000, 2000, 3000)
;

WITH emp AS (
  SELECT 7839 empno, 'KING'   ename, 'PRESIDENT' job, NULL mgr, '1981-11-17' hiredate, 5000 sal, 10 deptno FROM DUAL UNION ALL
  SELECT 7566 empno, 'JONES'  ename, 'MANAGER'   job, 7839 mgr, '1981-04-02' hiredate, 2000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7788 empno, 'SCOTT'  ename, 'ANALYST'   job, 7566 mgr, '1987-04-19' hiredate, 3000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7844 empno, 'TURNER' ename, 'SALESMAN'  job, 7698 mgr, '1981-09-08' hiredate, 1500 sal, 30 deptno FROM DUAL UNION ALL
  SELECT 7876 empno, 'ADAMS'  ename, 'CLERK'     job, 7788 mgr, '1987-05-23' hiredate, 1000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7369 empno, 'SMITH'  ename, 'CLERK'     job, 7902 mgr, '1980-12-17' hiredate, 800  sal, 30 deptno FROM DUAL 
)

SELECT *
  FROM emp
 WHERE sal <= ALL (1000, 2000, 3000)
;

WITH emp AS (
  SELECT 7839 empno, 'KING'   ename, 'PRESIDENT' job, NULL mgr, '1981-11-17' hiredate, 5000 sal, 10 deptno FROM DUAL UNION ALL
  SELECT 7566 empno, 'JONES'  ename, 'MANAGER'   job, 7839 mgr, '1981-04-02' hiredate, 2000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7788 empno, 'SCOTT'  ename, 'ANALYST'   job, 7566 mgr, '1987-04-19' hiredate, 3000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7844 empno, 'TURNER' ename, 'SALESMAN'  job, 7698 mgr, '1981-09-08' hiredate, 1500 sal, 30 deptno FROM DUAL UNION ALL
  SELECT 7876 empno, 'ADAMS'  ename, 'CLERK'     job, 7788 mgr, '1987-05-23' hiredate, 1000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7369 empno, 'SMITH'  ename, 'CLERK'     job, 7902 mgr, '1980-12-17' hiredate, 800  sal, 30 deptno FROM DUAL 
)

SELECT *
  FROM emp
 WHERE sal > ALL (1000, 2000, 3000)
;

WITH emp AS (
  SELECT 7839 empno, 'KING'   ename, 'PRESIDENT' job, NULL mgr, '1981-11-17' hiredate, 5000 sal, 10 deptno FROM DUAL UNION ALL
  SELECT 7566 empno, 'JONES'  ename, 'MANAGER'   job, 7839 mgr, '1981-04-02' hiredate, 2000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7788 empno, 'SCOTT'  ename, 'ANALYST'   job, 7566 mgr, '1987-04-19' hiredate, 3000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7844 empno, 'TURNER' ename, 'SALESMAN'  job, 7698 mgr, '1981-09-08' hiredate, 1500 sal, 30 deptno FROM DUAL UNION ALL
  SELECT 7876 empno, 'ADAMS'  ename, 'CLERK'     job, 7788 mgr, '1987-05-23' hiredate, 1000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7369 empno, 'SMITH'  ename, 'CLERK'     job, 7902 mgr, '1980-12-17' hiredate, 800  sal, 30 deptno FROM DUAL 
)

SELECT *
  FROM emp
 WHERE sal <> ALL (1000, 2000, 3000)
;

WITH emp AS (
  SELECT 7839 empno, 'KING'   ename, 'PRESIDENT' job, NULL mgr, '1981-11-17' hiredate, 5000 sal, 10 deptno FROM DUAL UNION ALL
  SELECT 7566 empno, 'JONES'  ename, 'MANAGER'   job, 7839 mgr, '1981-04-02' hiredate, 2000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7788 empno, 'SCOTT'  ename, 'ANALYST'   job, 7566 mgr, '1987-04-19' hiredate, 3000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7844 empno, 'TURNER' ename, 'SALESMAN'  job, 7698 mgr, '1981-09-08' hiredate, 1500 sal, 30 deptno FROM DUAL UNION ALL
  SELECT 7876 empno, 'ADAMS'  ename, 'CLERK'     job, 7788 mgr, '1987-05-23' hiredate, 1000 sal, 20 deptno FROM DUAL UNION ALL
  SELECT 7369 empno, 'SMITH'  ename, 'CLERK'     job, 7902 mgr, '1980-12-17' hiredate, 800  sal, 30 deptno FROM DUAL 
)

SELECT *
  FROM emp
 WHERE sal > ALL (SELECT sal
                    FROM emp
                   WHERE deptno = 20)
;

-- EXISTS : 서브 쿼리가 적어도 하나의 행을 돌려주면 TRUE가 된다.
-- NOT EXISTS : 서브 쿼리가 적어도 하나의 행을 돌려주지 않으면 TRUE가 된다.

SELECT 
	DEPT_NAME  as "부서명", DEPT_CODE  as "부서코드"
FROM 
	tdept
WHERE EXISTS(SELECT * FROM temp WHERE tdept.DEPT_CODE = temp.DEPT_CODE);
                   
                  
SELECT 
	DEPT_NAME  as "부서명", DEPT_CODE  as "부서코드"
FROM 
	tdept
WHERE NOT EXISTS(SELECT * FROM temp WHERE tdept.DEPT_CODE = temp.DEPT_CODE);

-- 직급이 과장인 직원의 연봉을 읽고 이중 어떤 값 하나보다 큰 연봉을 가지는 직원의 사번, 성명, 연봉을 읽어라
SELECT SALARY FROM temp WHERE LEV ='과장';
SELECT min(SALARY) FROM temp WHERE LEV ='과장';

SELECT EMP_ID , EMP_NAME, SALARY FROM TEMP WHERE SALARY > (SELECT min(SALARY) FROM temp WHERE LEV ='과장');

-- 에러 : 서브쿼리의 결과가 복수행이다.
SELECT EMP_ID , EMP_NAME, SALARY FROM TEMP WHERE SALARY > (SELECT SALARY FROM temp WHERE LEV ='과장');

-- 이때 ANY나 ALL을 사용한다.
SELECT EMP_ID , EMP_NAME, SALARY FROM TEMP WHERE SALARY > ANY (SELECT SALARY FROM temp WHERE LEV ='과장');

-- 어떤 과장보다도 연봉이 많은 지원을 조회

SELECT EMP_ID , EMP_NAME, SALARY FROM TEMP WHERE SALARY > (SELECT max(SALARY) FROM temp WHERE LEV ='과장');
SELECT EMP_ID , EMP_NAME, SALARY FROM TEMP WHERE SALARY > ALL (SELECT SALARY FROM temp WHERE LEV ='과장');
                   
                  
-- ==========================================================================================================
-- ROWNUM, ROWID : 모든 테이블에 숨겨진 필드
-- ==========================================================================================================  
SELECT ROWNUM, ROWID, t.* FROM TEMP t; 
SELECT ROWNUM, ROWID, t.* FROM TDEPT t; 

SELECT rownum, t.* FROM TEMP t; 
SELECT rownum, t.* FROM TEMP t WHERE EMP_TYPE = '인턴'; -- WHERE절이 적용된 후 번호가 붙여진다.

SELECT rownum, t.* FROM TEMP t WHERE EMP_TYPE = '인턴' ORDER BY EMP_NAME ; -- WHERE절이 적용된 후 번호가 붙고 정렬
SELECT rownum, t.* FROM TEMP t ORDER BY EMP_NAME; 

-- 1페이지 분량의 행을 가져오는 쿼리
SELECT * FROM temp;
-- 상위 5개만 가져와보자!!!
SELECT rownum, t.* FROM temp t;

SELECT rownum, t.* FROM temp t WHERE rownum<=5; -- 이것은 된다.

-- 6번째 이후를 가져와라
SELECT rownum, t.* FROM temp t WHERE rownum>=6; -- 이것은 아무 것도 나오지 않는다.

SELECT rownum, t.* FROM temp t;

-- 6번째 이후를 가져와라 : 먼저 번호를 붙이고 번호가 붙은 데이터 중에서 다시 가벼와야 한다.
SELECT 
	Q.*
from
	(SELECT rownum rnum, t.* FROM temp t) Q
WHERE 
	rnum>=6;

-- 6 ~ 10 가져와라

SELECT 
	Q.*
from
	(SELECT rownum rnum, t.* FROM temp t) Q
WHERE 
	rnum>=6 AND rnum <=10;
	

SELECT 
	Q.*
from
	(SELECT rownum rnum, t.* FROM temp t ORDER BY t.EMP_ID desc) Q
WHERE 
	rnum>=6 AND rnum <=10;

SELECT rownum rnum, t.* FROM temp t ORDER BY t.EMP_ID DESC;



SELECT * FROM TEMP ORDER BY EMP_ID DESC;

SELECT 
	rownum rnum, T.* 
FROM  
	(SELECT * FROM TEMP ORDER BY EMP_ID DESC) T 
WHERE 
	rownum <= 10; -- 뒷부분 날리기

	
-- 1페이지 분량의 글을 읽어오는 쿼리
SELECT 
	Q.*
FROM
	(SELECT 
		rownum rnum, T.* 
	FROM  
		(SELECT * FROM TEMP ORDER BY EMP_ID DESC) T -- 전체 : 목록이 원하는 순서대로 가져와야 한다.
	WHERE 
		rownum <= 10) Q -- 뒷부분 날리기 : 그 다음에 번호를 붙여서 뒷부분을 날려 버린다.
WHERE 
	rnum >=6; -- 앞부분 날리기 : 이미 붙여진 번호를 이용해서 앞부분을 지운다.
	
-- 번호를 1~ 100까지 발생
SELECT LEVEL FROM dual CONNECT BY LEVEL <=100;	

-- 235개의 데이터 들어간 테이블 생성
CREATE TABLE board AS 	SELECT LEVEL idx, '제목 '||LEVEL title FROM dual CONNECT BY LEVEL <=235;
	
SELECT * FROM board;	
	
-- 235번부터 226번 까지가 1페이지이다.
-- 225번부터 216번 까지가 2페이지이다.

SELECT 
	Q.*
from
	(SELECT rownum rnum, t.* FROM board t ORDER BY idx desc) Q
WHERE 
	rnum>=1 AND rnum <=10;


SELECT 
	Q.*
FROM
	(SELECT 
		rownum rnum, T.* 
	FROM  
		(SELECT * FROM board ORDER BY idx DESC) T -- 전체 : 목록이 원하는 순서대로 가져와야 한다.
	WHERE 
		rownum <= 20) Q -- 뒷부분 날리기 : 그 다음에 번호를 붙여서 뒷부분을 날려 버린다.
WHERE 
	rnum >=11; 



