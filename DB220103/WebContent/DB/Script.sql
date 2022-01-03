select 
	he.EMPLOYEE_ID , he.FIRST_NAME, he.SALARY 
from
	hr_employees he ;

-- 1. 연봉이 12000 이상되는 직원들의 LAST_NAME 및 연봉을 조회한다.
select 
	LAST_NAME , SALARY 
from 
	hr_employees 
where 
	SALARY >=12000;

-- 2. 사원번호가 176 인 사람의 LAST_NAME 과 부서 번호를 조회한다.
select 
	LAST_NAME , DEPARTMENT_ID 
from 
	hr_employees 
where 
	EMPLOYEE_ID  = 176;