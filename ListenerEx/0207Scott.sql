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

SELECT 
	d.DNAME 부서명, e.JOB 직업, sum(SAL) 연봉합계, count(e.EMPNO) 인원수
FROM 
	EMP e , DEPT d
WHERE 
	e.DEPTNO = d.DEPTNO 
GROUP BY 
	d.DEPTNO , e.JOB;
  
  -- 부서별로 인원수와 급여 합계를 구하는 예제
-- 일일이 부서에 해당하는 직업별 급여와 사원수를 일일이 더해야한다.
-- 이런경우 ROLLUP을 사용하여 쉽게 조회할 수 있다.
SELECT 
	d.DNAME 부서명, e.JOB 직업, sum(SAL) 연봉합계, count(e.EMPNO) 인원수
FROM 
	EMP e , DEPT d
WHERE 
	e.DEPTNO = d.DEPTNO 
GROUP BY 
	ROLLUP(d.DNAME , e.JOB);
	
SELECT 
	NVL(d.DNAME,'총합') 부서명, NVL2(e.JOB,e.JOB ,NVL2(d.DNAME,'소계',' ')) 직업, sum(SAL) 연봉합계, count(e.EMPNO) 인원수
FROM 
	EMP e , DEPT d
WHERE 
	e.DEPTNO = d.DEPTNO 
GROUP BY 
	ROLLUP (d.DNAME , e.JOB);

-- CUBE OPERATION
SELECT 
	d.DNAME 부서명, e.JOB 직업, sum(SAL) 연봉합계, count(e.EMPNO) 인원수
FROM 
	EMP e , DEPT d
WHERE 
	e.DEPTNO = d.DEPTNO 
GROUP BY 
	CUBE (d.DNAME , e.JOB); -- 부서별 직업별 모두 구해준다.

-- CUBE는 Cross-Tab에 대한 Summary를 추출하는데 사용된다.
-- 즉 ROLLUP에 의해 나타 내어지는 Item Total값과 Column Total값을 나타 낼 수 있다.
	
-- ROLLUP이나 CUBE에 의해서 산출된 Row인 경우에는 1을 반환하게 된다.
-- 따라서 해당 Row가 결과집합에 의해 산출된 Data인지
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
