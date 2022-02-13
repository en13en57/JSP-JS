--=============================================================================================
-- 숙제
--=============================================================================================
-- 1. EMP 테이블에서 Blake와 같은 부서에 있는 모든 사원의 이름과 입사일자를 출력하는 SELECT문을 작성하시오.
SELECT * FROM emp;
SELECT DEPTNO FROM emp WHERE ENAME = UPPER('Blake');
SELECT ENAME , HIREDATE , DEPTNO FROM emp WHERE DEPTNO = (SELECT DEPTNO FROM emp WHERE ENAME = UPPER('Blake'))

-- 2. EMP 테이블에서 평균 급여 이상을 받는 모든 종업원에 대해서 종업원 번호와 이름을 출력하는 SELECT문을 작성하시오. 
--    단 급여가 많은 순으로 출력하여라.
SELECT AVG(SAL) FROM EMP;
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL >= (SELECT AVG(SAL) FROM EMP);

-- 3. EMP 테이블에서 이름에 “T”가 있는 사원이 근무하는 부서에서 근무하는 모든 종업원에 대해 사원 번호,이름,급여를 출력하는 SELECT문을 작성하시오.
--    단 사원번호 순으로 출력하여라.
SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%T%';
SELECT EMPNO , ENAME , SAL FROM EMP WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%T%') ORDER BY EMPNO;

-- 4. EMP 테이블에서 부서 위치가 Dallas인 모든 종업원에 대해 이름,업무,급여를 출력하는 SELECT문을 작성하시오.
SELECT * FROM  DEPT;
SELECT * FROM  EMP;

SELECT e.ENAME , e.JOB , e.SAL , d.LOC FROM EMP e , DEPT d WHERE e.DEPTNO = d.DEPTNO AND d.LOC = UPPER('Dallas');

-- 5. EMP 테이블에서 King에게 보고하는 모든 사원의 이름과 급여를 출력하는 SELECT문을 작성하시오.
SELECT EMPNO FROM emp WHERE ENAME = UPPER('king'); -- 7839
SELECT ENAME, MGR , SAL FROM emp WHERE MGR  = (SELECT EMPNO FROM emp WHERE ENAME = UPPER('king'));

-- 6. EMP 테이블에서 SALES부서 사원의 이름,업무를 출력하는 SELECT문을 작성하시오.
SELECT e.ENAME , e.JOB,  d.DNAME , e.DEPTNO FROM EMP e , DEPT d WHERE e.DEPTNO = d.DEPTNO AND d.DNAME  = 'SALES';
SELECT e.ENAME , e.JOB FROM EMP e , DEPT d WHERE e.DEPTNO = d.DEPTNO AND d.DNAME  = 'SALES';

-- 7. EMP 테이블에서 월급이 부서 30의 최저 월급보다 높은 사원을 출력하는 SELECT문을 작성하시오.
SELECT MIN(SAL) FROM emp WHERE DEPTNO = 30;

SELECT * FROM EMP WHERE SAL >= (SELECT MIN(SAL) FROM emp WHERE DEPTNO = 30);

-- 8. EMP 테이블에서 부서 10에서 부서 30의 사원과 같은 업무를 맡고 있는 사원의 이름과 업무를 출력하는 SELECT문을 작성하시오.
SELECT DISTINCT JOB FROM emp WHERE DEPTNO = 30;
SELECT ENAME, JOB FROM emp WHERE DEPTNO = 10 AND JOB IN (SELECT DISTINCT JOB FROM emp WHERE DEPTNO = 30);

-- 9. EMP 테이블에서 FORD와 업무도 월급도 같은 사원의 모든 정보를 출력하는 SELECT문을 작성하시오.
SELECT * FROM emp WHERE JOB = (SELECT JOB FROM emp WHERE ENAME = 'FORD') 
                        AND SAL = (SELECT SAL FROM emp WHERE ENAME = 'FORD');

SELECT * FROM emp WHERE ENAME = 'FORD';

-- 10. EMP 테이블에서 업무가 JONES와 같거나 월급이 FORD이상인 사원의 정보를 이름,업무,부서번호,급여를 출력하는 SELECT문을 작성하시오. 
--     단 업무별, 월급이 많은 순으로 출력하여라.
SELECT ENAME , JOB, DEPTNO, SAL FROM emp WHERE JOB = (SELECT JOB FROM emp WHERE ENAME = 'JONES') 
                        OR SAL >= (SELECT SAL FROM emp WHERE ENAME = 'FORD');
-- 11. EMP 테이블에서 SCOTT 또는 WARD와 월급이 같은 사원의 정보를 이름,업무,급여를 출력하는 SELECT문을 작성하시오.
SELECT ENAME , JOB, SAL FROM emp WHERE SAL = (SELECT SAL FROM emp WHERE ENAME = 'SCOTT') 
                        OR SAL = (SELECT SAL FROM emp WHERE ENAME = 'WARD');
-- 12. EMP 테이블에서 CHICAGO에서 근무하는 사원과 같은 업무를 하는 사원의 이름,업무를 출력하는 SELECT문을 작성하시오.
SELECT DEPTNO FROM DEPT d WHERE LOC = 'CHICAGO';
SELECT 
	e.ENAME , e.JOB 
FROM 
	EMP e
WHERE 
	JOB IN (SELECT JOB FROM EMP e2 WHERE DEPTNO  = (SELECT DEPTNO FROM DEPT d WHERE LOC = 'CHICAGO'));
	
-- 13. EMP 테이블에서 부서별로 월급이 평균 월급보다 높은 사원을 부서번호,이름,급여를 출력하는 SELECT문을 작성하시오.
SELECT DEPTNO , ENAME, SAL FROM emp;
SELECT DEPTNO, AVG(SAL) FROM EMP  GROUP BY DEPTNO;

SELECT 
	A.DEPTNO , A.ENAME , A.SAL 
FROM 
	EMP A, (SELECT DEPTNO, AVG(SAL) SAL_AVG FROM EMP  GROUP BY DEPTNO) B
WHERE 
	A.DEPTNO = B.DEPTNO(+) AND SAL > SAL_AVG;

-- 14. EMP 테이블에서 업무별로 월급이 평균 월급보다 낮은 사원을 부서번호,이름,급여를 출력하는 SELECT문을 작성하시오.
SELECT JOB , AVG(SAL) SAL_AVG FROM EMP  GROUP BY JOB;

SELECT 
	A.DEPTNO , A.ENAME , A.SAL 
FROM 
	EMP A, (SELECT JOB , AVG(SAL) SAL_AVG FROM EMP  GROUP BY JOB) B
WHERE 
	A.JOB = B.JOB(+) AND SAL < SAL_AVG;

-- 15. EMP 테이블에서 적어도 한명 이상으로부터 보고를 받을 수 있는 사원을 업무,이름,사원번호,부서번호를 출력하는 SELECT문을 작성하시오.
SELECT DISTINCT MGR FROM EMP e WHERE MGR IS NOT NULL; -- 메니저들 사번 
-- 서브쿼리 사용
SELECT 
	JOB , ENAME ,EMPNO , DEPTNO 
FROM 
	EMP e 
WHERE 
	EMPNO IN (SELECT DISTINCT MGR FROM EMP e WHERE MGR IS NOT NULL);
-- JOIN을 이용한 풀이1
SELECT 
	DISTINCT B.JOB , B.ENAME, B.EMPNO , B.DEPTNO 
FROM 
	EMP A, EMP B
WHERE 
	A.MGR(+)  = B.EMPNO AND A.MGR IS NOT NULL; 
-- JOIN을 이용한 풀이2
SELECT 
	DISTINCT B.JOB , B.ENAME, B.EMPNO , B.DEPTNO 
FROM 
	EMP A JOIN EMP B
ON A.MGR  = B.EMPNO AND A.MGR IS NOT NULL;

-- 16. EMP 테이블에서 말단 사원(입사일이 제일 늦은 사원))의 사원번호,이름,업무,부서번호를 출력하는 SELECT문을 작성하시오.
SELECT 
	e.EMPNO , e.ENAME , e.JOB , e.DEPTNO 
FROM 
	EMP e 
WHERE 
	HIREDATE  = (SELECT MAX(HIREDATE) FROM emp);




