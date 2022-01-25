-- group by는 특정 칼럼이나 값을 기준으로 묶어서 사용할 때 사용한다.
-- 그룹함수 sum, max, min, avg, count 등과 같이 사용한다.

SELECT 
	COUNT(salary), MAX(salary), MIN(salary), SUM(salary), avg(salary)
FROM
	temp;

SELECT DISTINCT DEPT_CODE FROM temp;

SELECT 
	DEPT_CODE, COUNT(salary), MAX(salary), MIN(salary), SUM(salary), avg(salary)
FROM
	temp
GROUP BY DEPT_CODE;

-- 직급별 최고 연봉자를 알아보자
SELECT 
	LEV 직급, max(SALARY) 최고연봉
FROM 
	TEMP 
GROUP BY
	LEV ;

SELECT 
	LEV 직급, max(SALARY) 최고연봉
FROM 
	TEMP 
GROUP BY
	LEV 
ORDER BY
	max(SALARY); 

SELECT 
	LEV 직급, max(SALARY) 최고연봉
FROM 
	TEMP 
GROUP BY
	LEV 
ORDER BY
	2; 
	
-- 부서장 중에서 사번이 가장 빠른 사람이 근무하는 부서를 알고자 한다.
SELECT * FROM TDEPT ;

-- 1) 부서 테이블의 BOSS_ID의 최소값을 구한다.
SELECT min(BOSS_ID) FROM TDEPT ; -- 19930301 
-- 2) 1번의 결과 사번의 부서 코드를 읽어낸다.
SELECT DEPT_CODE FROM TEMP WHERE EMP_ID = 19930301; --BA0001 ;
-- 3) 2번의 결과를 가지고 부서 이름을 알아낸다.
SELECT DEPT_NAME FROM TDEPT WHERE DEPT_CODE ='BA0001';

SELECT 
	MIN(BOSS_ID||DEPT_CODE), SUBSTR(MIN(BOSS_ID||DEPT_CODE),9) 
FROM 
	TDEPT t ;

-- 위 명령을 1줄로 줄여서 사용이 가능하다.
SELECT DEPT_NAME FROM TDEPT WHERE DEPT_CODE = (SELECT SUBSTR(MIN(BOSS_ID||DEPT_CODE),9) FROM TDEPT);

-- AREA별 최소 BOSS_ID를 골라내고 이 결과를 BOSS_ID별로 정렬하자
SELECT * FROM temp;
	
SELECT AREA ,MIN(BOSS_ID) FROM TDEPT GROUP BY AREA ORDER by	2;
	
-- GROUP BY 절에 조건을 지정할 경우에는 HAVING 을 사용한다.
-- 직급별 연봉 평균을 구한 상태에서 평균 연봉이 5천만원이 이상인 경우의 직급과 평균 연봉을 조회하라.
SELECT LEV , AVG(SALARY) FROM TEMP GROUP BY LEV HAVING AVG(SALARY) >= 50000000;

-- TEMP자료를 이용하여 직급별로 사번이 제일 늦은 사람을 구하고 그 결과 내에서 사번이 1997로 시작되는 결과만 보이시오
SELECT LEV , MAX(EMP_ID) FROM TEMP GROUP BY LEV HAVING MAX(EMP_ID) LIKE '1997%'; 
SELECT LEV , MAX(EMP_ID) FROM TEMP GROUP BY LEV HAVING SUBSTR(MAX(EMP_ID),0,4) = 1997; 

-- 2장 함수
-- 2-1. 문자열 처리 함수
-- INSTR(문자열, 찾는 문자열) : 문자의 위치를 찾아준다.
SELECT INSTR('ABC좋은나라DEF웃긴나라1234어이없음','D'), INSTR('ABC좋은나라DEF웃긴나라1234어이없음','나') FROM dual; -- 8 6
SELECT INSTR2('ABC좋은나라DEF웃긴나라1234어이없음','D'), INSTR2('ABC좋은나라DEF웃긴나라1234어이없음','나') FROM dual; -- 8 6
SELECT INSTR4('ABC좋은나라DEF웃긴나라1234어이없음','D'), INSTR4('ABC좋은나라DEF웃긴나라1234어이없음','나') FROM dual; -- 8 6
SELECT INSTRB('ABC좋은나라DEF웃긴나라1234어이없음','D'), INSTRB('ABC좋은나라DEF웃긴나라1234어이없음','나') FROM dual; -- 16 10 -- Byte로 세기
SELECT INSTRC('ABC좋은나라DEF웃긴나라1234어이없음','D'), INSTRC('ABC좋은나라DEF웃긴나라1234어이없음','나') FROM dual; -- 8 6 -- 한글도 1글자

SELECT INSTR('ABC좋은나라DEF웃긴나라1234어이없음','웃긴') FROM dual; -- 11
SELECT INSTRB('ABC좋은나라DEF웃긴나라1234어이없음','웃긴') FROM dual; -- 19

-- 문자열 중에 '웃긴'이 나타날때 까지 사이에 한글이 몇글자 있을까요?
SELECT (INSTRB('ABC좋은나라DEF웃긴나라1234어이없음','웃긴')-INSTR('ABC좋은나라DEF웃긴나라1234어이없음','웃긴'))/2 || '글자' FROM dual; -- 4글자
SELECT (INSTRB('ABC좋은나라DEF웃긴나라1234어이없음','어이')-INSTR('ABC좋은나라DEF웃긴나라1234어이없음','어이'))/2 || '글자' FROM dual; -- 8글자

-- SUBSTR(컬럼 또는 문자열, 숫자1, 숫자2)
SELECT
	SUBSTR('ABC좋은나라DEF웃긴나라1234어이없음',0,2), -- AB
	SUBSTR('ABC좋은나라DEF웃긴나라1234어이없음',1,4), -- ABC좋
	SUBSTR('ABC좋은나라DEF웃긴나라1234어이없음',4,2), -- 좋은
	SUBSTR('ABC좋은나라DEF웃긴나라1234어이없음',8,4)  -- DEF웃
FROM dual;

SELECT
	SUBSTRB('ABC좋은나라DEF웃긴나라1234어이없음',0,2), -- AB    
	SUBSTRB('ABC좋은나라DEF웃긴나라1234어이없음',1,4), -- ABC
	SUBSTRB('ABC좋은나라DEF웃긴나라1234어이없음',4,12), -- 좋은나라 한글크기 3Byte
	SUBSTRB('ABC좋은나라DEF웃긴나라1234어이없음',19,12),  -- 웃긴나라
	SUBSTRB('ABC좋은나라DEF웃긴나라1234어이없음',35,6)  -- 어이
FROM dual;

SELECT 
	SUBSTR('ABC좋은나라DEF웃긴나라1234어이없음',19,2), -- 어이 부르기
	SUBSTRB('ABC좋은나라DEF웃긴나라1234어이없음',35,6), -- 어이
	SUBSTR('ABC좋은나라DEF웃긴나라1234어이없음',-4,2), -- 어이 시작위치를 음수로 쓰면 뒤에서부터 몇번째
	SUBSTRB('ABC좋은나라DEF웃긴나라1234어이없음',-12,6) -- 어이
FROM dual;

-- LENGTH(컴럼 또는 문자열) 함수 : 문자열의 길이를 구한다.
SELECT 
	LENGTH('ABC좋은나라DEF웃긴나라1234어이없음'), -- 22
	LENGTHB('ABC좋은나라DEF웃긴나라1234어이없음') -- 46
FROM dual;

-- 한글이 몇글자인지를 출력하는 쿼리를 만드시오
SELECT 
	(LENGTHB('ABC좋은나라DEF웃긴나라1234어이없음')-LENGTH('ABC좋은나라DEF웃긴나라1234어이없음'))/2 || '글자' -- "한글" 12글자
FROM dual;

-- TEMP테이블에 이름에 영문자가 포함된 이름만 출력하시오
SELECT 
	EMP_NAME,
	(LENGTHB(EMP_NAME)- LENGTH (EMP_NAME))/2 "한글글자수",
	LENGTH (EMP_NAME) - (LENGTHB(EMP_NAME)- LENGTH(EMP_NAME))/2 "영숫자개수"
FROM 
	TEMP ;

SELECT
	EMP_NAME 
FROM 
	TEMP t 
WHERE 
	LENGTH(EMP_NAME) - (LENGTHB(EMP_NAME)-LENGTH(EMP_NAME))/2 !=0;

-- LPAD, RPAD : 왼쪽, 오른쪽에 남는 자릿수를 특정 문자로 채운다.
-- LPAD(컬럼 또는 문자열, 길이, 채울문자)
-- RPAD(컬럼 또는 문자열, 길이, 채울문자)

-- 부서테이블에서 부서이름을 가져오는데 10자리를 기준으로 앞에 *로 채우고싶다.
SELECT 
	DEPT_NAME , LPAD(DEPT_NAME, 10+(LENGTHB(DEPT_NAME)- LENGTH (DEPT_NAME))/2, '*'), RPAD(DEPT_NAME, 10, '*') 
FROM 
	TDEPT t 

	SELECT 
	DEPT_NAME , LPAD(DEPT_NAME, 10, '*'), RPAD(DEPT_NAME, 10, '*') 
FROM 
	TDEPT t 

-- 부서테이블에서 부서이름을 가져오는데 10자리를 기준으로 앞에 왼쪽을 기준으로 순서대로 번호를 붙여서 가져오시오
SELECT
	DEPT_NAME , LPAD(DEPT_NAME, 10, '123456789') -- 여기는 한글을 2칸으로 인식 
FROM 
	TDEPT ;

--- 아래와 같이 부서이름을 조회하시오!!!!
--- 경영지원90  --> 9
--- 재무567890  --> 5
--- h/w지원890  --> 8
--- 영업167890  --> 6
SELECT 
   DEPT_NAME, 
   RPAD(DEPT_NAME, 10, '*'),
   RPAD(DEPT_NAME, 10, SUBSTR('1234567890', (LENGTHB(DEPT_NAME)-LENGTH(DEPT_NAME))/2 * 2  + 1)), -- 한글만 들어가면 가능
   RPAD(DEPT_NAME, 10, SUBSTR('1234567890', ((LENGTHB(DEPT_NAME)-LENGTH(DEPT_NAME))/2*2)+(LENGTH(DEPT_NAME)-(LENGTHB(DEPT_NAME)-LENGTH(DEPT_NAME))/2)+1)), -- 한글만 들어가면 가능
   (LENGTHB(DEPT_NAME)-LENGTH(DEPT_NAME))/2 "한글글자수",
   LENGTH(DEPT_NAME) - (LENGTHB(DEPT_NAME)-LENGTH(DEPT_NAME))/2 "영숫자개수",
   (LENGTHB(DEPT_NAME)-LENGTH(DEPT_NAME))/2 * 2  + 1 "시작위치1",
   ((LENGTHB(DEPT_NAME)-LENGTH(DEPT_NAME))/2*2)+(LENGTH(DEPT_NAME)-(LENGTHB(DEPT_NAME)-LENGTH(DEPT_NAME))/2)+1 "시작위치2"
FROM 
   TDEPT;

SELECT 
   DEPT_NAME, 
   RPAD(DEPT_NAME, 10, SUBSTR('1234567890', ((LENGTHB(DEPT_NAME)-LENGTH(DEPT_NAME))/2*2)+(LENGTH(DEPT_NAME)-(LENGTHB(DEPT_NAME)-LENGTH(DEPT_NAME))/2)+1)) "부서" -- 한글만 들어가면 가능
FROM 
   TDEPT;

-- SUBSTR('1234567890', ((LENGTHB(DEPT_NAME)-LENGTH(DEPT_NAME))/2*2)+(LENGTH(DEPT_NAME)-(LENGTHB(DEPT_NAME)-LENGTH(DEPT_NAME))/2)+1)
--                      한글글자수 * 2 + 영숫자글자수 + 1
