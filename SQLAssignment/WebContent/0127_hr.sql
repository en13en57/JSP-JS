-- HR 계정 SQL 50문제
--===================
-- 11. LAST_NAME 에 a 및(OR) e 글자가 있는 사원들의 LAST_NAME 을 조회한다.
SELECT
	LAST_NAME 
FROM 
	EMPLOYEES e 
WHERE 
	LAST_NAME LIKE '%a%' OR LAST_NAME LIKE '%e%' ;

-- 12. 연봉이 2,500, 3,500, 7000 이 아니며 직업이 SA_REP 이나 ST_CLERK 인 사람들을 조회한다.
SELECT
	* 
FROM 
	EMPLOYEES e 
WHERE 
	SALARY  NOT IN (2500,3500,700) AND (JOB_ID IN ('SA_REP','ST_CLERK')) ;


---- 13-1.  직업이 AD_PRESS 인 사람은 A 등급을, ST_MAN 인 사람은 B 등급을, IT_PROG 인 사람은 C 등급을,
--          SA_REP 인 사람은 D 등급을, ST_CLERK 인 사람은 E 등급을 기타는 0 을 부여하여 조회한다.
/*
 CASE 필드명 또는 식
 	WHEN 값1 THEN
 		값1이 일치할때 실행할 명령
 	WHEN 값2 THEN
 		값2이 일치할때 실행할 명령
 	WHEN 값3 THEN
 		값3이 일치할때 실행할 명령
 		.
 		.
 		.
 	ELSE
 		일치하는 값이 없을때 실행할 명령
 END
 */
SELECT 
	EMPLOYEE_ID 사번, FIRST_NAME || ' ' || LAST_NAME 이름,
	CASE JOB_ID 
		WHEN 'AD_PRESS' THEN
			'A'
		WHEN 'ST_MAN' THEN
			'B'
		WHEN 'IT_PROG' THEN
			'C'
		WHEN 'SA_REP' THEN
			'D'
		WHEN 'ST_CLERK' THEN
			'E'
		ELSE 
			'0'
	END 등급
FROM 
	EMPLOYEES;

/*
DECODE 함수
DECODE(필드명 또는 식, 값1, 값1이 일치하면 실행할 명령,값2,값1이 일치하면 실행할 명령.... , 모두일치하지 않으면 실행할 명령)
 */
SELECT 
	DECODE(1, 1,'하나'),
	DECODE(1, 2,'하나','몰라'),
	DECODE(3, 1,'하나', 2,'둘','몰라')
FROM 
	dual;
	
---- 13-2.  직업이 AD_PRESS 인 사람은 A 등급을, ST_MAN 인 사람은 B 등급을, IT_PROG 인 사람은 C 등급을,
--          SA_REP 인 사람은 D 등급을, ST_CLERK 인 사람은 E 등급을 기타는 0 을 부여하여 조회한다.

SELECT 
	EMPLOYEE_ID 사번, FIRST_NAME || ' ' || LAST_NAME 이름,
	DECODE(JOB_ID, 'AD_PRESS','A','ST_MAN','B','IT_PROG','C','SA_REP','D','ST_CLERK','E','0') 등급
FROM 
	EMPLOYEES;

-- 14. 모든 사원들의 LAST_NAME, 부서 이름 및 부서 번호을 조회한다.
SELECT 
	LAST_NAME , d.DEPARTMENT_NAME , e.DEPARTMENT_ID 
FROM 
	EMPLOYEES e , DEPARTMENTS d 
WHERE 
	e.DEPARTMENT_ID  = d.DEPARTMENT_ID; 

-- 15. 부서번호 30 내의 모든 직업들을 유일한 포맷으로 조회한다. 90 부서 또한 포함한다.
SELECT 
	DISTINCT JOB_ID , DEPARTMENT_ID 
FROM 
	EMPLOYEES e 
WHERE 
	DEPARTMENT_ID IN (30, 90);
	
-- 16-1. 커미션을 버는 모든 사람들의 LAST_NAME, 부서명, 지역 ID 및 도시명을 조회한다.
SELECT 
	LAST_NAME , d.DEPARTMENT_NAME , d.LOCATION_ID,  l.CITY 
FROM 
	EMPLOYEES e ,
	DEPARTMENTS d ,
	LOCATIONS l 
WHERE 
	e.DEPARTMENT_ID = d.DEPARTMENT_ID AND d.LOCATION_ID = l.LOCATION_ID AND COMMISSION_PCT IS NOT NULL;

-- 16-2. 시애틀에 사는 사람 중 커미션을 버는 모든 사람들의 LAST_NAME, 부서 명, 지역 ID 및 도시 명을 조회한다.
SELECT 
	LAST_NAME , d.DEPARTMENT_NAME , d.LOCATION_ID,  l.CITY 
FROM 
	EMPLOYEES e ,
	DEPARTMENTS d ,
	LOCATIONS l 
WHERE 
	e.DEPARTMENT_ID = d.DEPARTMENT_ID AND d.LOCATION_ID = l.LOCATION_ID AND COMMISSION_PCT IS NOT NULL AND UPPER(l.CITY) ='SEATTLE';

SELECT * FROM LOCATIONS l ;

-- 17. LAST_NAME 이 DAVIES 인 사람보다 후에 고용된 사원들의 LAST_NAME 및 HIRE_DATE 을 조회한다.
SELECT HIRE_DATE FROM EMPLOYEES e WHERE UPPER(LAST_NAME) = 'DAVIES';

SELECT 
	LAST_NAME , HIRE_DATE 
FROM 
	EMPLOYEES e 
WHERE 
	HIRE_DATE >= (SELECT HIRE_DATE FROM EMPLOYEES e WHERE UPPER(LAST_NAME) = 'DAVIES');


-- 18. 자신의 매니저보다 먼저 고용된 사원들의 LAST_NAME 및 고용일을 조회한다. -- Self Join
SELECT 
	e1.EMPLOYEE_ID, e1.LAST_NAME , e1.HIRE_DATE 
FROM 
	EMPLOYEES e1, EMPLOYEES e2
WHERE 
	e1.MANAGER_ID = e2.EMPLOYEE_ID AND e1.HIRE_DATE < e2.HIRE_DATE; 


-- 19. 회사 전체의 최대 연봉, 최소 연봉, 연봉 총 합 및 평균 연봉을 자연수로 포맷하여 조회한다.
SELECT 
	ROUND(MAX(SALARY)), ROUND(MIN(SALARY)), ROUND(SUM(SALARY)), ROUND(AVG(SALARY))
FROM 
	EMPLOYEES e ;
	
-- 20. 각 JOB_ID 별, 최대 연봉, 최소 연봉, 연봉 총 합 및 평균 연봉을 자연수로 포맷하여 조회한다.
SELECT 
	JOB_ID , ROUND(MAX(SALARY)), ROUND(MIN(SALARY)), ROUND(SUM(SALARY)), ROUND(AVG(SALARY))
FROM 
	EMPLOYEES e 
GROUP BY 
	JOB_ID ;
	

-- 문제 : HR계정에서 사번, 이름, 메니저이름을 조회하시오
SELECT 
	emp.EMPLOYEE_ID , emp.LAST_NAME , mgr.LAST_NAME 
FROM 
	EMPLOYEES emp, EMPLOYEES mgr
WHERE 
	emp.MANAGER_ID = mgr.EMPLOYEE_ID; 

-- 문제 : HR계정에서 사번, 이름, 메니저이름을 조회하시오(매니저가 없는 사원도 출력하시오)
SELECT 
	emp.EMPLOYEE_ID , emp.LAST_NAME , NVL(mgr.LAST_NAME ,'나는 사장')
FROM 
	EMPLOYEES emp, EMPLOYEES mgr
WHERE 
	emp.MANAGER_ID = mgr.EMPLOYEE_ID(+); 


