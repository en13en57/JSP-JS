-- 1.사원 테이블에서 사원번호가 7369, 7698 번인 사원번호와 이름을출력하세요?
SELECT 
	ENAME , EMPNO 
FROM 
	EMP  
WHERE 
	EMPNO in(7369,7698);

-- 2.사원 테이블에서 사원번호가 7369, 7698 번인 아닌 사원번호와 이름을 출력하세요?
SELECT 
	ENAME , EMPNO 
FROM 
	EMP  
WHERE 
	EMPNO NOT IN(7369,7698);
	
-- 3. 사원 테이블에서 급여(SAL)가 3000에서 5000사이인 사원 정보를 다 출력하세요?
SELECT 
	*
FROM 
	EMP 
WHERE 
	SAL BETWEEN 3000 AND 5000;
	
-- 4. 사원 테이블에서 고용일자(HIREDATE)가 1981년 12월 1일 이후 고용된 사원 정보를 다 출력하세요?
SELECT 
	*
FROM 
	EMP 
WHERE 
	HIREDATE > '1981-12-01';

-- 5. 사원 테이블에서 직업(JOB)이 SALESMAN 중에서 사원번호의 최대값을 출력하세요?
SELECT 
	MAX(EMPNO)
FROM 
	EMP 
WHERE 
	JOB = 'SALESMAN';


