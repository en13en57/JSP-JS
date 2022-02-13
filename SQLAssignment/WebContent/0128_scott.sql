-- 3 일차 SQL 과제 

SELECT * FROM EMP;

-- 1. 사원 테이블에서 각 사원에 급여(SAL) 등급을 아래 예제처럼 출력하세요?
--    (급여순위점수(SALGRADE) 테이블 조인)
--    ex) 정렬은 등급(GRADE) 오름차순
--    사번  이름 연봉 등급
SELECT * FROM tab;
SELECT * FROM salgrade;
 
SELECT 
	e.EMPNO , e.ENAME , s.GRADE 
FROM 
	emp e, SALGRADE s 
WHERE 
	e.SAL >= s.LOSAL AND e.SAL <= s.HISAL 
ORDER BY 
	3;

-- 2. 사원 테이블에서 평균 급여(SAL) 보다 높은 사원 정보를 아래 예제처럼 출력하세요? 
--    ex) 정렬은 급여(SAL) 내림차순
SELECT 
	EMPNO , ENAME , JOB , SAL 
FROM 
	EMP e 
WHERE 
	SAL > (SELECT avg(sal) FROM emp) -- Sub Query
ORDER BY
	sal DESC;
	
-- 3. 사원 테이블에서 부서별 평균 급여(SAL) 보다 높은 사원 정보를 아래 예제처럼 출력하세요?
--    ex) 정렬은 급여(SAL) 내림차순
--    부서이름 사번 이름 직업 연봉
SELECT * FROM emp;
SELECT * FROM DEPT;

SELECT DEPTNO , avg(SAL) FROM emp GROUP BY DEPTNO; -- 부서별 평균 연봉

SELECT 
	d.DNAME, e.EMPNO , e.ENAME , e.JOB , e.SAL , s.sal_avg
FROM 
	EMP e , DEPT d , (SELECT DEPTNO dn, avg(SAL) sal_avg FROM emp GROUP BY DEPTNO) s
WHERE 
	e.DEPTNO = d.DEPTNO
	AND 
	e.DEPTNO = s.dn
	AND 
	e.SAL > s.sal_avg
ORDER BY 
	SAL desc; 


-- 4. 사원 테이블에서 각 사원에 급여(SAL) 순위 점수 별로 인원수를 아래 예제처럼 출력하세요?
--    (급여순위점수(SALGRADE) 테이블 조인)
SELECT 
	s.GRADE , s.LOSAL , s.HISAL , count(e.SAL) CNT
FROM 
	emp e, SALGRADE s 
WHERE 
	e.SAL >= s.LOSAL AND e.SAL <= s.HISAL
GROUP BY 
	s.GRADE, s.LOSAL , s.HISAL
ORDER BY 
	1;

-- 5. 부서명이 'RESEARCH' 이거나 부서위치가 'NEW YORK' 사원 정보를 아래 예제처럼 출력하세요?
--    ex) 정렬은 부서명(DNAME) 오름차순
--    부서명, 위치, 사번, 이름
SELECT * FROM tab;

SELECT 
	d.DNAME, d.LOC , e.EMPNO, e.ENAME 
FROM 
	EMP e , DEPT d
WHERE 
	e.DEPTNO = d.DEPTNO
	AND 
	(d.DNAME = 'RESEARCH' OR d.LOC = 'NEW YORK')
ORDER BY 
	1;

