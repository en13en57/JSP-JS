-- 1. 연봉이 12000 이상되는 직원들의 LAST_NAME 및 연봉을 조회한다.
SELECT 
	LAST_NAME ,SALARY 
FROM 
	EMPLOYEES e 
WHERE 
	SALARY >=12000;
	
-- 2. 사원번호가 176 인 사람의 LAST_NAME 과 부서 번호를 조회한다.
SELECT 
	LAST_NAME , DEPARTMENT_ID 
FROM 
	EMPLOYEES e 
WHERE 
	EMPLOYEE_ID = 176;

-- 3. 연봉이 5000 에서 12000의 범위 이외인 사람들의 LAST_NAME 및 연봉을 조회힌다.
SELECT 
	LAST_NAME ,SALARY 
FROM 
	EMPLOYEES e 
WHERE 
	SALARY BETWEEN 5000 AND 12000;

-- 4. 2002/02/20 일부터 2003/05/01 사이에 고용된 사원들의 LAST_NAME 사번, 고용일자를 조회한다.
--    고용일자 순으로 정렬한다.
SELECT 
	LAST_NAME ,EMPLOYEE_ID ,HIRE_DATE 
FROM 
	EMPLOYEES e 
WHERE 
	HIRE_DATE BETWEEN '2002/02/20' AND '2003/05/01'
ORDER BY 
	HIRE_DATE ;
	
-- 5. 20 번 및 50 번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 부서 번호를 알파벳순으로 조회한다.
SELECT 
	LAST_NAME , DEPARTMENT_ID 
FROM 
	EMPLOYEES e 
WHERE 
	DEPARTMENT_ID IN (20,50)
ORDER BY 
	LAST_NAME ;
	
-- 6. 20 번 및 50 번 부서에 근무하며, 연봉이 5000 ~ 12,000 사이인 사원들의 LAST_NAME 및 연봉을 조회한다.
SELECT 
	LAST_NAME ,SALARY 
FROM 
	EMPLOYEES e 
WHERE 
	DEPARTMENT_ID IN (20,50)
AND SALARY BETWEEN 5000 AND 12000;

-- 7. 2002년도에 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회한다.
SELECT LAST_NAME , HIRE_DATE FROM	EMPLOYEES e WHERE HIRE_DATE LIKE '2002%'; -- 안나옴 왜? 문자로 비교하면 년도가 2자리로 바뀜

SELECT LAST_NAME , HIRE_DATE FROM	EMPLOYEES e WHERE HIRE_DATE LIKE '02%';

SELECT LAST_NAME , HIRE_DATE FROM	EMPLOYEES e WHERE EXTRACT(YEAR FROM HIRE_DATE) = 2002;

SELECT LAST_NAME , HIRE_DATE FROM	EMPLOYEES e WHERE HIRE_DATE >= '02/01/01' AND HIRE_DATE <= '02/12/31' ;


SELECT LAST_NAME , HIRE_DATE||' ' FROM	EMPLOYEES e; -- 날짜를 문자로 연산하면 yy/mm/dd형태로 나온다.

-- 7-1. 이번달에 입사원 사원의 LAST_NAME 및 고용일을 조회한다.
SELECT LAST_NAME , HIRE_DATE FROM	EMPLOYEES e WHERE EXTRACT(MONTH FROM HIRE_DATE) = EXTRACT(MONTH FROM SYSDATE);

SELECT 
	LAST_NAME , HIRE_DATE, SUBSTR(SYSDATE, 3, 4) 
FROM	
	EMPLOYEES 
WHERE 
	HIRE_DATE LIKE '%'||SUBSTR(SYSDATE, 3, 4)||'%';

-- 아래와 같이하면 01일이나 2001년에 입사한 사원도 나온다.
SELECT 
	LAST_NAME , HIRE_DATE, SUBSTR(SYSDATE, 4, 2) 
FROM	
	EMPLOYEES 
WHERE 
	HIRE_DATE LIKE '%'||SUBSTR(SYSDATE, 4, 2)||'%';
-- 8-1. 매니저가 없는 사람들의 LAST_NAME 및 JOB_ID 를 조회한다.
SELECT 
	LAST_NAME , JOB_ID 
FROM 
	EMPLOYEES e 
WHERE 
	MANAGER_ID IS NULL;
	
-- 8-2. 매니저가 있는 사람들의 LAST_NAME 및 JOB_ID 를 조회한다.
SELECT 
	LAST_NAME , JOB_ID 
FROM 
	EMPLOYEES e 
WHERE 
	MANAGER_ID IS NOT NULL;
	
-- 9. 커미션을 버는 모든 사원들의 LAST_ANME, 연봉 및 커미션을 조회한다.
--    연봉 역순, 커미션 역순차로 정렬한다.
SELECT
	LAST_NAME , SALARY ,COMMISSION_PCT 
FROM 
	EMPLOYEES e 
WHERE 
	COMMISSION_PCT IS NOT NULL
ORDER BY 2 desc, 3 DESC;

-- 10. LAST_NAME 의 네번째 글자가 a 인 사원들의 LAST_NAME 을 조회한다.
SELECT 
	LAST_NAME 
FROM 	
	EMPLOYEES e 
WHERE 
	LAST_NAME LIKE '___a%';
	
-- 11. LAST_NAME 에 a 및(OR) e 글자가 있는 사원들의 LAST_NAME 을 조회한다.
SELECT 
	LAST_NAME a
FROM 
	EMPLOYEES e 
where
	LAST_NAME LIKE '%a%'
OR	LAST_NAME LIKE '%e%';
	
-- 12. 연봉이 2,500, 3,500, 7000 이 아니며 직업이 SA_REP 이나 ST_CLERK 인 사람들을 조회한다.
SELECT 
	LAST_NAME 
FROM 
	EMPLOYEES e 
WHERE 
	SALARY NOT IN (2500, 3500, 7000)
AND JOB_ID IN ('SA_REP' , 'STCLERK');

-- 13-1.  직업이 AD_PRESS 인 사람은 A 등급을, ST_MAN 인 사람은 B 등급을, IT_PROG 인 사람은 C 등급을,
--          SA_REP 인 사람은 D 등급을, ST_CLERK 인 사람은 E 등급을 기타는 0 을 부여하여 조회한다.
/*
 CASE 필드명 또는 식
 	WHEN THEN
 END
 */
SELECT EMPLOYEE_ID
		, LAST_NAME
		, DECODE(JOB_ID
			, 'AD_PRESS', 'A'
			, 'ST_MAN', 'B'
			, 'IT_PROG', 'C'
			, 'SA_REP', 'D'
			, 'ST_CLERK', 'E'
			, '0') JOB_GRADE		
FROM 
	EMPLOYEES e;

SELECT EMPLOYEE_ID
		, LAST_NAME
		, DECODE(JOB_ID, 'AD_PRESS', 'A', 'ST_MAN', 'B', 'IT_PROG', 'C', 'SA_REP', 'D', 'ST_CLERK', 'E', '0') JOB_GRADE		
FROM 
	EMPLOYEES e;

SELECT 
	EMPLOYEE_ID ,FIRST_NAME || ' ' || LAST_NAME ,
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
		ELSE '0'
	END 등급
FROM 
	EMPLOYEES ;

-- 14. 모든 사원들의 LAST_NAME, 부서 이름 및 부서 번호을 조회한다.
SELECT 
	e.LAST_NAME , e.DEPARTMENT_ID ,d.DEPARTMENT_NAME , EMPLOYEE_ID 
FROM 
	EMPLOYEES e , DEPARTMENTS d 
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID ;
 	
-- 15. 부서번호 30 내의 모든 직업들을 유일한 포맷으로 조회한다. 90 부서 또한 포함한다.
SELECT 
	DISTINCT e.JOB_ID,
	e.DEPARTMENT_ID
FROM 
	EMPLOYEES e 
WHERE 
	DEPARTMENT_ID IN (30,90);

-- 16-1. 커미션을 버는 모든 사람들의 LAST_NAME, 부서 명, 지역 ID 및 도시 명을 조회한다.
SELECT 
	e.LAST_NAME , d.DEPARTMENT_NAME , d.LOCATION_ID, l.CITY 
FROM 
	EMPLOYEES e , DEPARTMENTS d ,LOCATIONS l 
WHERE 
	e.DEPARTMENT_ID =d.DEPARTMENT_ID 
AND d.LOCATION_ID =l.LOCATION_ID 
AND COMMISSION_PCT IS NOT NULL;

-- 16-2. 시애틀에 사는 사람 중 커미션을 버는 모든 사람들의 LAST_NAME, 부서 명, 지역 ID 및 도시 명을 조회한다.
-- 좋지 못한 방법이다.
SELECT 
	e.LAST_NAME , d.DEPARTMENT_NAME , l.LOCATION_ID ,l.CITY 
FROM 
	EMPLOYEES e, DEPARTMENTS d , LOCATIONS l 
WHERE 
	e.DEPARTMENT_ID =d.DEPARTMENT_ID 
AND d.LOCATION_ID =l.LOCATION_ID 
AND e.COMMISSION_PCT IS NOT NULL
AND l.CITY = 'Seattle';

-- 16-3. 시애틀에 사는 사람 중 커미션을 버는 모든 사람들의 LAST_NAME, 부서 명, 지역 ID 및 도시 명을 조회한다.
-- 좋은 방법 - PK로 검색
SELECT 
	e.LAST_NAME , d.DEPARTMENT_NAME , l.LOCATION_ID , l.CITY 
FROM 
	EMPLOYEES e , DEPARTMENTS d , LOCATIONS l 
WHERE 
	e.DEPARTMENT_ID = d.DEPARTMENT_ID 
AND d.LOCATION_ID = l.LOCATION_ID 
AND l.LOCATION_ID = (
						SELECT  LOCATION_ID 
						FROM 	LOCATIONS 
						WHERE 	CITY ='Seattle'
					);

-- 17. LAST_NAME 이 DAVIES 인 사람보다 후에 고용된 사원들의 LAST_NAME 및 HIRE_DATE 을 조회한다.
SELECT HIRE_DATE FROM EMPLOYEES e WHERE LAST_NAME ='Davies'; 
				
SELECT 
	LAST_NAME , HIRE_DATE 
FROM 
	EMPLOYEES e 
WHERE 
	HIRE_DATE >= (SELECT HIRE_DATE FROM EMPLOYEES e WHERE LAST_NAME ='Davies') -- 서브쿼리
ORDER BY HIRE_DATE ;

-- 18. 자신의 매니저보다 먼저 고용된 사원들의 LAST_NAME 및 고용일을 조회한다. -- 셀프조인
SELECT 
	emp.LAST_NAME , emp.HIRE_DATE 
FROM 
	EMPLOYEES emp , EMPLOYEES mgr
WHERE 
	emp.MANAGER_ID = mgr.EMPLOYEE_ID 
AND emp.HIRE_DATE  < mgr.HIRE_DATE 
ORDER BY emp.LAST_NAME ;

-- 19. 회사 전체의 최대 연봉, 최소 연봉, 연봉 총 합 및 평균 연봉을 자연수로 포맷하여 조회한다.
SELECT 
	ROUND(MAX(SALARY)), ROUND(MIN(SALARY)), ROUND(SUM(SALARY)), ROUND(AVG(SALARY)) 
FROM 
	EMPLOYEES e ;

-- 20. 각 JOB_ID 별, 최대 연봉, 최소 연봉, 연봉 총 합 및 평균 연봉을 자연수로 포맷하여 조회한다.
SELECT 
	JOB_ID ,ROUND(MAX(SALARY)), ROUND(MIN(SALARY)), ROUND(SUM(SALARY)), ROUND(AVG(SALARY)) 
FROM 
	EMPLOYEES e 
GROUP BY
	JOB_ID ;

-- 문제 : hr계정에서 사번, 이름, 매니저이름을 조회하시오(매니저가 없는 사원도 출력하시오)

SELECT * FROM EMPLOYEES e ;

SELECT 
	e.EMPLOYEE_ID 사번, e.LAST_NAME 직원이름, m.LAST_NAME 매니저이름
FROM 
	EMPLOYEES e , EMPLOYEES m
WHERE 
	e.MANAGER_ID = m.EMPLOYEE_ID(+);

SELECT * FROM EMPLOYEES e ;

	
--1. 직책(Job Title)이 Sales Manager인 사원들의 입사년도와 입사년도(hire_date)별 평균 급여를 출력하시오. 
--   출력 시 년도를 기준으로 오름차순 정렬하시오. 
SELECT 
	e.HIRE_DATE , AVG(e.SALARY), j.JOB_TITLE 
FROM 
	hr.EMPLOYEES e, hr.JOBS j 
HAVING e.JOB_ID = j.JOB_ID AND j.JOB_TITLE = 'Sales Manager'
GROUP BY HIRE_DATE
ORDER BY HIRE_DATE ;
	