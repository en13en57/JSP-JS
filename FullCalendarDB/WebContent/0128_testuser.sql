-- temp, tdept를 이용하여 상위 부서가 'CA0001인 부서의'
-- 사번, 성명, 부서코드, 부서명, 상위부서코드, 상위부서명, 상위 부서장 코드, 상위부서장명
SELECT * FROM temp;
SELECT * FROM TDEPT ;

-- 사번, 성명, 부서코드, 부서명, 상위부서코드
SELECT 
	e.EMP_ID 사번, e.EMP_NAME 성명, e.DEPT_CODE 부서코드, d.DEPT_NAME 부서이름, d.PARENT_DEPT 상위부서코드 
FROM 
	TEMP e, TDEPT d
WHERE 
	e.DEPT_CODE = d.DEPT_CODE
AND d.PARENT_DEPT = 'CA0001';

-- 사번, 성명, 부서코드, 부서명, 상위부서코드, 상위부서명, 상위 부서장 코드
SELECT 
	e.EMP_ID 사번, e.EMP_NAME 성명, e.DEPT_CODE 부서코드, d.DEPT_NAME 부서이름, d.PARENT_DEPT 상위부서코드,
	td.DEPT_NAME 상위부서명, d.BOSS_ID 상위부서장코드 
FROM 
	TEMP e, TDEPT d, TDEPT td
WHERE 
	e.DEPT_CODE = d.DEPT_CODE
AND d.PARENT_DEPT = 'CA0001'
AND d.PARENT_DEPT  = td.DEPT_CODE ;

-- 사번, 성명, 부서코드, 부서명, 상위부서코드, 상위부서명, 상위 부서장 코드, 상위 부서장명
SELECT 
	e.EMP_ID 사번, e.EMP_NAME 성명, e.DEPT_CODE 부서코드, d.DEPT_NAME 부서이름, d.PARENT_DEPT 상위부서코드,
	td.DEPT_NAME 상위부서명, d.BOSS_ID 상위부서장코드, te.EMP_NAME 상위부서장명
FROM 
	TEMP e, TDEPT d, TDEPT td, TEMP te
WHERE 
	e.DEPT_CODE = d.DEPT_CODE
AND d.PARENT_DEPT = 'CA0001'
AND d.PARENT_DEPT  = td.DEPT_CODE 
AND td.BOSS_ID = te.EMP_ID ;


-- ============================================================================================
-- 서브쿼리(Sub-Query) : 쿼리안에 쿼리가 들어간다.
-- ============================================================================================
-- 1. 단일행 서브쿼리 : 서브쿼리의 결과가 1개인 서브쿼리
-- ============================================================================================
-- 평균연봉보다 연봉이 많은 사원의 목록 조회
-- 1) 평균 연봉을 구한다.
SELECT AVG(salary) FROM temp;
-- 2) 위에서 구한 평균 연봉을 이용하여 평균연봉보다 연봉이 많은 사원의 목록 조회
SELECT * FROM TEMP WHERE SALARY >= 43800000;

-- 위의 명령 2개를 합치면 사원의 연봉이 변경되어도 계속 사용이 가능하다.
SELECT * FROM TEMP WHERE SALARY >= (SELECT AVG(salary) FROM temp); -- 서브쿼리 이용

-- 문제 : 최소 연봉을 받는 직원들을 조회하시오
SELECT MIN(salary) FROM temp;
SELECT * FROM TEMP t WHERE SALARY = 30000000;

SELECT * FROM TEMP t WHERE SALARY =(SELECT MIN(salary) FROM temp); -- 서브쿼리 이용

-- ============================================================================================
-- 2. 복수행 서브쿼리 : 서브쿼리의 결과가 여러행 인 서브쿼리
-- 				  IN, ANY, ALL, EXISTS와 같이 사용된다.
-- ============================================================================================
-- 인천에 근무하는 직원의 사번과 성명을 읽어오자
SELECT * FROM TEMP t;
SELECT * FROM TDEPT d ;
SELECT * FROM TDEPT d WHERE AREA ='인천'; -- 3개행

-- 조인을 이용한 방법
SELECT 
	e.EMP_ID , e.EMP_NAME , d.AREA 
FROM 
	TEMP e , TDEPT d
WHERE 
	e.DEPT_CODE  = d.DEPT_CODE 
AND d.AREA ='인천';

-- 서브쿼리를 이용하여 조회하면
SELECT DEPT_CODE FROM TDEPT d WHERE AREA ='인천';
SELECT 
	EMP_ID , EMP_NAME 
FROM 
	TEMP t 
WHERE
	DEPT_CODE IN (SELECT DEPT_CODE FROM TDEPT d WHERE AREA ='인천');

-- 문제 : 부서별 커미션을 받는 인원수를 세는 쿼리
SELECT * FROM TEMP ; -- 사원
SELECT * FROM TDEPT ; -- 부서
SELECT * FROM TCOM ; -- 커미션 받는 직원

SELECT 
	d.DEPT_NAME , COUNT(*)
FROM 
	TEMP e, TDEPT d
WHERE 
	e.DEPT_CODE =d.DEPT_CODE 
AND e.EMP_ID IN (SELECT EMP_ID FROM TCOM)
GROUP BY 
	d.DEPT_NAME ;

-- ============================================================================================
-- 3. 복수행, 복수열 서브쿼리 : 서브쿼리의 결과가 여러행에 여러 컬럼인 서브쿼리
--						복수개의 열을 묶어서 비교할 때 주로 사용
-- ============================================================================================
-- 부서테이블에서 부서코드와 보스ID를 읽어 사원 테이블에 부서코드와 사번이 일치하는 자료 조회
-- 부서장들만 조회
SELECT DEPT_CODE ,BOSS_ID FROM TDEPT;
SELECT EMP_ID , EMP_NAME FROM TEMP WHERE (DEPT_CODE , EMP_ID) IN (SELECT DEPT_CODE ,BOSS_ID FROM TDEPT);

-- 부서별 최고 연봉금액을 읽어서 해당 부서와 최고 연봉금액이 동시에 일치하는 사원의
-- 사번, 성명, 연봉을 읽어와라
SELECT DEPT_CODE , MAX(SALARY) FROM TEMP GROUP BY DEPT_CODE; -- 부서별 최고 연봉

SELECT 
	EMP_ID , EMP_NAME , SALARY 
FROM 
	TEMP e
WHERE 
	(DEPT_CODE, SALARY) IN (SELECT DEPT_CODE , MAX(SALARY) FROM TEMP GROUP BY DEPT_CODE);

-- ============================================================================================
-- 4. CORRELATED(상관; 상호관계) 서브쿼리 : 내부쿼리가 외부쿼리의 어떤 컬럼을 사용하는 서브쿼리
-- ============================================================================================
-- 직원 중 자신의 연봉이 자신과 같은 레벨에 해당하는 직원의 평균 연봉보다 많은 경우의 사번과 성명을 조회
SELECT 
	EMP_ID , EMP_NAME , SALARY 
FROM 
	TEMP e1
WHERE 
	SALARY > (SELECT AVG(SALARY) FROM TEMP e2 WHERE e1.LEV = e2.LEV);

-- SELECT 결과를 insert하기
-- INSERT into 테이블명(컬럼명) select 컬럼리스트 from 테이블 명
SELECT COUNT(*) FROM tcom;

INSERT INTO TCOM (WORK_YEAR , EMP_ID, BONUS_RATE, COMM) SELECT '2002', EMP_ID , 0.1, SALARY*0.1 FROM TEMP;

SELECT COUNT(*) FROM tcom;

-- select 결과를 테이블로 만들기
CREATE TABLE emp AS SELECT EMP_ID , EMP_NAME , BIRTH_DATE FROM TEMP;
SELECT * FROM emp;

-- 임시 테이블 작성
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
 WHERE sal > ANY (1000, 2000, 3000)
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
 WHERE sal <= ANY (1000, 2000, 3000)
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
 WHERE sal <> ANY (1000, 2000, 3000)
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
 WHERE sal > ANY (SELECT sal
                    FROM emp
                   WHERE deptno = 20)
;

-- EXISTS : 서브 쿼리가 적어도 하나의 행을 돌려주면 TRUE가 된다.
-- NOT EXISTS : 서브 쿼리가 적어도 하나의 행을 돌려주지 않으면 TRUE가 된다.
SELECT 
   DEPT_NAME  as "부서명", DEPT_CODE  as "부서코드"
FROM 
   tdept
WHERE EXISTS( SELECT * FROM temp WHERE tdept.DEPT_CODE = temp.DEPT_CODE);

SELECT 
   DEPT_NAME  as "부서명", DEPT_CODE  as "부서코드"
FROM 
   tdept
WHERE NOT EXISTS( SELECT * FROM temp WHERE tdept.DEPT_CODE = temp.DEPT_CODE);

-- 직급이 과장인 직원의 연봉을 읽고 이중 어떤 값 하나보다 큰 연봉을 가지는 직원의 사번, 성명, 연봉을 읽어와라
SELECT EMP_ID , EMP_NAME ,SALARY FROM TEMP e WHERE LEV = '과장';
SELECT MIN(SALARY) FROM TEMP e WHERE LEV = '과장';

SELECT EMP_ID , EMP_NAME ,SALARY FROM TEMP e WHERE SALARY > (SELECT MIN(SALARY) FROM TEMP e WHERE LEV = '과장');

-- 에러!!!!!!!! 서브 쿼리의 결과가 복수행이다.
SELECT EMP_ID , EMP_NAME ,SALARY FROM TEMP e WHERE SALARY > (SELECT SALARY FROM TEMP e WHERE LEV = '과장');

-- 이때 ANY나 ALL을 사용한다.
SELECT EMP_ID , EMP_NAME ,SALARY FROM TEMP e WHERE SALARY > ANY (SELECT SALARY FROM TEMP e WHERE LEV = '과장');

-- 어떤 과장보다도 연봉이 많은 직원을 조회
SELECT EMP_ID , EMP_NAME ,SALARY FROM TEMP e WHERE SALARY > (SELECT MAX(SALARY) FROM TEMP e WHERE LEV = '과장');
SELECT EMP_ID , EMP_NAME ,SALARY FROM TEMP e WHERE SALARY > ALL (SELECT SALARY FROM TEMP e WHERE LEV = '과장');

-- ============================================================================================
-- ROWNUM, ROWID : 모든 테이블에 숨겨진 필드
-- ============================================================================================
SELECT rownum, rowid, t.* FROM temp t;

SELECT rownum, rowid, t.* FROM tdept t;

SELECT rownum, t.* FROM	TEMP t;
SELECT rownum, t.* FROM	TEMP t WHERE EMP_TYPE = '인턴'; -- where절이 적용 된 후 번호가 붙어진다.

SELECT rownum, t.* FROM	TEMP t WHERE EMP_TYPE = '인턴'ORDER BY EMP_NAME ; -- where절이 적용 된 후 번호가 붙어진다.
SELECT rownum, t.* FROM	TEMP t ORDER BY EMP_NAME ;

-- 1페이지 분량의 행을 가져오는 쿼리
SELECT * FROM temp;

-- 상위 5개만 가져와보자!
SELECT rownum, t.* FROM TEMP t;

SELECT rownum, t.* FROM TEMP t WHERE rownum <=5; -- 나온다

-- 6번째 이후를 가져와봐라
SELECT rownum, t.* FROM TEMP t WHERE rownum >=6; -- 이것은 아무것도 나오지 않는다.

-- 6번째 이후를 가져와라 : 먼저 번호를 붙이고 번호가 붙은 데이터 중에서 다시 가져와야한다.
SELECT 
	Q.*
FROM 
	(SELECT rownum rnum, t.* FROM temp t) Q
WHERE 
	rnum >= 6;
	
-- 6 - 10 가져와라
SELECT 
	Q.*
FROM 
	(SELECT rownum rnum, t.* FROM temp t) Q
WHERE 
	rnum BETWEEN 6 AND 10;
	
SELECT 
	Q.*
FROM 
	(SELECT rownum rnum, t.* FROM temp t ORDER BY t.EMP_ID DESC) Q
WHERE 
	rnum BETWEEN 6 AND 10;
	
SELECT rownum rnum, t.* FROM temp t ORDER BY t.EMP_ID DESC;

SELECT * FROM TEMP ORDER BY EMP_ID DESC;

SELECT 
	rownum rnum, t.* 
FROM 
	(SELECT * FROM TEMP ORDER BY EMP_ID DESC) t
WHERE rownum <= 10; -- 뒷부분 날리기

-- 1페이지 분량의 글을 읽어오는 쿼리

SELECT 
	Q.*
FROM
	(SELECT 
		rownum rnum, T.* 
	FROM 
		(SELECT * FROM TEMP ORDER BY EMP_ID DESC) T --전체 : 목록이 원하는 순서대로 가져와야한다.
	WHERE 
		rownum <= 10) Q -- 뒷부분 날리기 : 그 다음에 번호를 붙여서 뒷부분을 날려버린다.
WHERE
	rnum >= 6; -- 앞부분 날리기 : 이미 붙여진 번호를 이용해서 앞부분을 지운다.

SELECT 
   Q.*
FROM 
   (SELECT 
      rownum rnum, T.* 
   FROM 
      (SELECT * FROM temp ORDER BY emp_id desc)T 
   WHERE 
      rownum <= 10)Q
WHERE 
   rnum >= 6;
   
 -- 번호를 1~100 까지 발생
SELECT LEVEL FROM dual CONNECT BY LEVEL <=100;
-- 235개의 데이터 들어간 테이블 생성
CREATE TABLE board AS SELECT LEVEL idx, '제목' ||LEVEL title FROM dual CONNECT BY LEVEL <=235;
  
SELECT * FROM board;

-- 235번부터 226번 까지가 1페이지이다.
-- 225번부터 216번 까지가 2페이지이다.

SELECT 
	Q.*
FROM 
	(SELECT rownum rnum, t.* FROM board t ORDER BY idx desc) Q
WHERE 
	rnum BETWEEN 1 AND 10;

SELECT 
	Q.*
FROM
	(SELECT 
		rownum rnum, T.* 
	FROM 
		(SELECT * FROM board ORDER BY idx DESC) T --전체 : 목록이 원하는 순서대로 가져와야한다.
	WHERE 
		rownum <= 20) Q -- 뒷부분 날리기 : 그 다음에 번호를 붙여서 뒷부분을 날려버린다.
WHERE
	rnum >= 11; -- 앞부분 날리기 : 이미 붙여진 번호를 이용해서 앞부분을 지운다.


