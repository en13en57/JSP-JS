/*
ROLLUP operator

ROLLUP구문은 GROUP BY 절과 같이 사용 되며, GROUP BY절에 의해서 그룹 지어진 
집합 결과에 대해서 좀 더 상세한 정보를 반환하는 기능을 수행 한다.

SELECT절에 ROLLUP을 사용함으로써 보통의 SELECT된 데이터와 그 데이터의 총계를 구할 수 있다.
*/

SELECT * FROM emp;
SELECT count(*), sum(SAL), avg(sal) FROM emp GROUP BY DEPTNO;

-- 먼저 GROUP BY를 사용해서 직업별로 급여 합계를 구하는 예제이다.
SELECT 
	JOB, SUM(SAL) 
FROM 
	EMP
GROUP BY
	JOB; 
	
-- ROLLUP을 사용해서 직업별로 급여 합계와 총계를 구하는 예제이다.
SELECT 
	NVL(JOB, '총합') 직업, SUM(SAL) 
FROM 
	EMP
GROUP BY
	ROLLUP(JOB); 
	
-- 부서별로 인원수와 급여 합계를 구하는 예제
SELECT 
	d.DNAME 부서명, e.JOB 직업, sum(SAL) 연봉합계, count(e.EMPNO) 인원수
FROM 
	emp e, DEPT d 
WHERE 
	e.DEPTNO = d.DEPTNO 
GROUP BY 
	d.DNAME , e.JOB ;

-- 부서별로 인원과, 급여합계가 한 눈에 보이지 않는다. 
-- 일일이 부서에 해당하는 직업별 급여와 사원수를 일일이 더해야 한다. 
-- 이런 경우 ROLLUP을 사용하여 쉽게 조회 할 수 있다.
SELECT 
	d.DNAME 부서명, e.JOB 직업, sum(SAL) 연봉합계, count(e.EMPNO) 인원수
FROM 
	emp e, DEPT d 
WHERE 
	e.DEPTNO = d.DEPTNO 
GROUP BY 
	ROLLUP (d.DNAME , e.JOB) ;

SELECT 
	NVL(d.DNAME, '총합') 부서명, NVL2(e.JOB,e.JOB ,NVL2(d.DNAME,'소계',' ')) 직업,
	sum(SAL) 연봉합계, count(e.EMPNO) 인원수
FROM 
	emp e, DEPT d 
WHERE 
	e.DEPTNO = d.DEPTNO 
GROUP BY 
	ROLLUP (d.DNAME , e.JOB) ;

-- CUBE Operator
SELECT 
	d.DNAME 부서명, e.JOB 직업, sum(SAL) 연봉합계, count(e.EMPNO) 인원수
FROM 
	emp e, DEPT d 
WHERE 
	e.DEPTNO = d.DEPTNO 
GROUP BY 
	CUBE (d.DNAME , e.JOB) ; -- 부서별, 직업별 모두 구해준다.
	
	
-- CUBE는 Cross-Tab에 대한 Summary를 추출하는데 사용 된다 
-- 즉 ROLLUP에 의해 나타 내어지는 Item Total값과 Column Total값을 나타 낼 수 있다.

/*
Grouping 함수 
: pseudo column (의사컬럼 : 실제로는 존재하지 않으나 특수목적으로 사용)

GROUPING 함수는 ROLLUP, CUBE에 모두 사용할 수 있다.
GROUPING 함수는 해당 Row가 GROUP BY에 의해서 산출된 Row인 경우에는 0을 반환하고, 
ROLLUP이나 CUBE에 의해서 산출된 Row인 경우에는 1을 반환하게 된다.
따라서 해당 Row가 결과집합에 의해 산출된 Data 인지, ROLLUP이나 CUBE에 의해서 산출된 Data 인지를 알 수 있도록 지원하는 함수이다.
 */
	
SELECT 
	b.dname, a.job, SUM(a.sal) sal, COUNT(a.empno) emp_count,
    GROUPING(b.dname) "D", GROUPING(a.job) "S"
FROM 
	emp a, dept b
WHERE 
	a.deptno = b.deptno
GROUP BY 
	CUBE(b.dname, a.job)
ORDER BY 
	b.DNAME;	
	
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

-- 8. EMP 테이블에서 부서 10에서 부서 30의 사원과 같은 업무를 맡고 있는 사원의 이름과 업무를 출력하는 SELECT문을 작성하시오.

-- 9. EMP 테이블에서 FORD와 업무도 월급도 같은 사원의 모든 정보를 출력하는 SELECT문을 작성하시오.

-- 10. EMP 테이블에서 업무가 JONES와 같거나 월급이 FORD이상인 사원의 정보를 이름,업무,부서번호,급여를 출력하는 SELECT문을 작성하시오. 
--     단 업무별, 월급이 많은 순으로 출력하여라.

-- 11. EMP 테이블에서 SCOTT 또는 WARD와 월급이 같은 사원의 정보를 이름,업무,급여를 출력하는 SELECT문을 작성하시오.

-- 12. EMP 테이블에서 CHICAGO에서 근무하는 사원과 같은 업무를 하는 사원의 이름,업무를 출력하는 SELECT문을 작성하시오.

-- 13. EMP 테이블에서 부서별로 월급이 평균 월급보다 높은 사원을 부서번호,이름,급여를 출력하는 SELECT문을 작성하시오.

-- 14. EMP 테이블에서 업무별로 월급이 평균 월급보다 낮은 사원을 부서번호,이름,급여를 출력하는 SELECT문을 작성하시오.

-- 15. EMP 테이블에서 적어도 한명 이상으로부터 보고를 받을 수 있는 사원을 업무,이름,사원번호,부서번호를 출력하는 SELECT문을 작성하시오.

-- 16. EMP 테이블에서 말단 사원의 사원번호,이름,업무,부서번호를 출력하는 SELECT문을 작성하시오.


