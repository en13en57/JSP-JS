-- 1. 사원 테이블에서 각 사원에 부서명을 아래 예제처럼 출력하세요?(사원, 부서 테이블 조인 시 매니저가 없는 사원은 출력 안함)ex) 정렬은 부서명(DNAME), 사원명(ENAME) 오름차순 
SELECT 
	d.DNAME , e.EMPNO , e.ENAME 
FROM 
	EMP e, DEPT d 
WHERE 
	e.DEPTNO = d.DEPTNO AND e.MGR  IS NOT NULL ORDER BY d.DNAME , e.ENAME  ;
	
SELECT 
	d.DNAME , e.EMPNO , e.ENAME 
FROM 
	EMP e, DEPT d 
WHERE 
	e.DEPTNO = d.DEPTNO AND e.MGR IS NOT NULL ORDER BY 1 , 3  ;

-- 2. 사원 테이블에서 각 사원에 부서명을 아래 예제처럼 출력하세요? (사원, 부서 테이블 조인 시 매니저가 없는 사원도 출력) ex) 정렬은 부서명(DNAME), 사원명(ENAME) 오름차순
SELECT 
	d.DNAME 부서명, e.EMPNO 사번, e.ENAME 사원
FROM 
	EMP e ,DEPT d 
WHERE 
	e.DEPTNO = d.DEPTNO
OR e.MGR IS NULL ORDER BY d.DNAME ,e.ENAME;

-- 3.부서 위치가 'DALLAS', 'CHICAGO' 곳에 근무하는 사원 정보 아래 예제처럼 출력하세요? ex) 정렬은 부서위치(LOC) 내림차순, 사원명(ENAME) 오름차순
SELECT 
	d.LOC , e.EMPNO , e.ENAME 
FROM 
	EMP e, DEPT d 
WHERE 
	e.DEPTNO = d.DEPTNO 
and	d.LOC IN ('DALLAS', 'CHICAGO') ORDER BY d.LOC desc, e.ENAME ;

-- 4. 부서별 최고 급여(SAL) 금액을 아래 예제처럼 출력하세요? ex) 매니저 없는 사원은 제외
SELECT 
	DEPTNO , MAX(sal)
FROM 
	EMP  
WHERE mgr IS NOT NULL 
GROUP BY DEPTNO
ORDER BY DEPTNO ;
 
-------------------------------------------------------------------------------------------
-- 5. 부서별 최고 급여(SAL) 금액을 받는 사원 정보를 아래 예제처럼 출력하세요? ex) 매니저 없는 사원은 제외
SELECT  
	DISTINCT DEPTNO , MAX(SAL) SAL, EMPNO , ENAME , JOB
FROM 
	EMP 
WHERE MGR IS NOT NULL
GROUP BY DEPTNO, EMPNO , ENAME , JOB 
ORDER BY DEPTNO;

SELECT  
	DEPTNO , SAL, EMPNO , ENAME , JOB
FROM 
	EMP 
WHERE (DEPTNO, SAL) IN (SELECT DEPTNO , max(SAL) SAL FROM	EMP WHERE MGR IS NOT NULL GROUP BY 	DEPTNO)
ORDER BY DEPTNO;

	

