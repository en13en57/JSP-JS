-- group by 는 특정 컬럼이나 값을 기준으로 묶어서 사용할 때 사용한다.
-- 그룹함수 sum, max, min, avg, count 등과 같이 사용한다.

SELECT 
	count(SALARY), max(SALARY), min(SALARY), sum(SALARY), avg(SALARY)
FROM
	temp;

SELECT  DISTINCT DEPT_CODE FROM temp;

SELECT 
	DEPT_CODE, count(SALARY), max(SALARY), min(SALARY), sum(SALARY), avg(SALARY)
FROM
	temp
GROUP BY 
	DEPT_CODE;

-- 직급별 최고 연봉자를 알아보자!!!
SELECT 
	lev 직급,  MAX(SALARY) 최고연봉
FROM 
	TEMP
GROUP BY
	LEV ;

SELECT 
	lev 직급,  MAX(SALARY) 최고연봉
FROM 
	TEMP
GROUP BY
	LEV 
ORDER BY 
	MAX(SALARY);

SELECT 
	lev 직급,  MAX(SALARY) 최고연봉
FROM 
	TEMP
GROUP BY
	LEV 
ORDER BY 
	2;

-- GROUP BY절을 모르면 아래와 같이 해야 한다........
SELECT 	DISTINCT lev FROM TEMP t ;
SELECT 	MAX(SALARY) FROM 	TEMP WHERE 	LEV='사원';
SELECT 	MAX(SALARY) FROM 	TEMP WHERE 	LEV='대리';
SELECT 	MAX(SALARY) FROM 	TEMP WHERE 	LEV='과장';
SELECT 	MAX(SALARY) FROM 	TEMP WHERE 	LEV='차장';
SELECT 	MAX(SALARY) FROM 	TEMP WHERE 	LEV='부장';

-- 부서장 중에서 사번이 가장 빠른 사람이 근무하는 부서를 알고자 한다.
SELECT 
	*
FROM 
	TDEPT;

-- 1) 부서 테이블의 BOSS_ID의 최소값을 구한다.
SELECT MIN(BOSS_ID) FROM TDEPT; -- 19930301
-- 2) 1번의 결과 사번의 부서 코드를 읽어낸다.
SELECT DEPT_CODE FROM temp WHERE EMP_ID = 19930301; -- BA0001
-- 3) 2번의 결과를 가지고 부서 이름을 알아낸다.
SELECT DEPT_NAME FROM TDEPT WHERE DEPT_CODE = 'BA0001';


SELECT 
	MIN(BOSS_ID||DEPT_CODE), SUBSTR(MIN(BOSS_ID||DEPT_CODE), 9) 
FROM 
	TDEPT;

-- 위의 명령을 1줄로 줄여서 사용이 가능하다. -- SUB Query이용
SELECT DEPT_NAME FROM TDEPT WHERE DEPT_CODE = (SELECT SUBSTR(MIN(BOSS_ID||DEPT_CODE), 9) FROM TDEPT);

-- AREA별 최소 BOSS_ID를 골라내고 이 결과를 BOSS_ID별로 정렬하자!!!
SELECT 
	AREA, MIN(BOSS_ID) 
FROM 
	TDEPT
GROUP BY
	AREA 
ORDER BY 
 	2;
 
 -- GROUP BY절에 조건을 지정할 경우에는 HAVING을 사용한다.
 -- 직급별 연봉 평균을 구한 상태에서 평균 연봉이 5천만원 이상인 경우의 직급과 평균 연봉을 조회하라
 
SELECT LEV , AVG(SALARY) FROM TEMP GROUP BY LEV;
SELECT LEV , AVG(SALARY) FROM TEMP GROUP BY LEV WHERE AVG(SALARY)>=50000000;  -- error
SELECT LEV , AVG(SALARY) FROM TEMP WHERE AVG(SALARY)>=50000000 GROUP BY LEV;  -- error
 
SELECT LEV , AVG(SALARY) FROM TEMP GROUP BY LEV HAVING AVG(SALARY)>=50000000; -- 정답 
SELECT LEV , AVG(SALARY) FROM TEMP GROUP BY LEV HAVING AVG(SALARY)>=50000000 ORDER BY 2; -- 정답 
 
-- TEMP자료를 이용하여 직급별로 사번이 제일 늦은 사람을 구하고 그 결과 내에서 사번이 1997로 시작되는 결과만 보이시오

SELECT LEV , MAX(EMP_ID) FROM TEMP GROUP BY LEV;
SELECT LEV , MAX(EMP_ID) FROM TEMP GROUP BY LEV HAVING MAX(EMP_ID) LIKE '1997%';
SELECT LEV , MAX(EMP_ID) FROM TEMP GROUP BY LEV HAVING SUBSTR(MAX(EMP_ID), 0, 4) = '1997';

-- ====================================================================================================================
-- 2장 함수
-- ====================================================================================================================
-- 2-1. 문자열 처리 함수
-- INSTR(문자열, 찾는 문자열) : 문자의 위치를 찾아준다.
SELECT INSTR('ABC좋은나라DEF웃긴나라1234어이없음', 'D') , INSTR('ABC좋은나라DEF웃긴나라1234어이없음', '나') FROM dual; -- 8 6 -- 한글도 1글자
SELECT INSTR2('ABC좋은나라DEF웃긴나라1234어이없음', 'D') , INSTR2('ABC좋은나라DEF웃긴나라1234어이없음', '나') FROM dual; -- 8 6
SELECT INSTR4('ABC좋은나라DEF웃긴나라1234어이없음', 'D') , INSTR4('ABC좋은나라DEF웃긴나라1234어이없음', '나') FROM dual; -- 8 6
SELECT INSTRB('ABC좋은나라DEF웃긴나라1234어이없음', 'D') , INSTRB('ABC좋은나라DEF웃긴나라1234어이없음', '나') FROM dual; -- 16 10 -- Byte로 세기. 한글은 3Byte
SELECT INSTRC('ABC좋은나라DEF웃긴나라1234어이없음', 'D') , INSTRC('ABC좋은나라DEF웃긴나라1234어이없음', '나') FROM dual; -- 8 6 -- 한글도 1글자

SELECT INSTR('ABC좋은나라DEF웃긴나라1234어이없음', '웃긴') FROM dual; -- 11
SELECT INSTRB('ABC좋은나라DEF웃긴나라1234어이없음', '웃긴') FROM dual; -- 19

-- 문자열 중에 '웃긴'이 나타날때까지 사이에 한글이 몇글자 있을까요?
SELECT 
	(INSTRB('ABC좋은나라DEF웃긴나라1234어이없음', '웃긴')-INSTR('ABC좋은나라DEF웃긴나라1234어이없음', '웃긴'))/2 || '글자' "한글개수" 
FROM 
	dual;

SELECT 
	(INSTRB('ABC좋은나라DEF웃긴나라1234어이없음', '어이')-INSTR('ABC좋은나라DEF웃긴나라1234어이없음', '어이'))/2 || '글자' "한글개수" 
FROM 
	dual;

-- SUBSTR(컬럼 또는 문자열, 시작위치, 잘라낼 갯수) : 
SELECT 
	SUBSTR('ABC좋은나라DEF웃긴나라1234어이없음', 0,2), -- AB  : 0부터 시작해도 1부터 센다.
	SUBSTR('ABC좋은나라DEF웃긴나라1234어이없음', 1,4), -- ABC좋
	SUBSTR('ABC좋은나라DEF웃긴나라1234어이없음', 4,2), -- 좋은
	SUBSTR('ABC좋은나라DEF웃긴나라1234어이없음', 8,4)  -- DEF웃
FROM 
	dual;

SELECT 
	SUBSTRB('ABC좋은나라DEF웃긴나라1234어이없음', 0,2), -- AB  : 0부터 시작해도 1부터 센다.
	SUBSTRB('ABC좋은나라DEF웃긴나라1234어이없음', 1,4), -- ABC
	SUBSTRB('ABC좋은나라DEF웃긴나라1234어이없음', 4,12), -- 좋은나라 : 한글의 크기는 3Byte
	SUBSTRB('ABC좋은나라DEF웃긴나라1234어이없음', 19,12)  -- 웃긴나라
FROM 
	dual;

-- "어이"만을 출력하는데 SUBSTR과  SUBSTRB 두개로 가져오시오
SELECT 
	SUBSTR('ABC좋은나라DEF웃긴나라1234어이없음', 19,2),
	SUBSTRB('ABC좋은나라DEF웃긴나라1234어이없음',35,6),
	SUBSTRB('ABC좋은나라DEF웃긴나라1234어이없음',-12,6),
	SUBSTR('ABC좋은나라DEF웃긴나라1234어이없음', -4,2) -- 시작 위치를 음수로 쓰면 뒤에서 부터 몇번째
FROM 
	dual;

-- LENGTH(컬럼 또는 문자열) 함수 : 문자열의 길이를 구한다.

SELECT 
	LENGTH('ABC좋은나라DEF웃긴나라1234어이없음'),
	LENGTHB('ABC좋은나라DEF웃긴나라1234어이없음')
FROM 
	dual; -- 22 46

-- 한글이 몇글자인지를 출력하는 쿼리를 만드시오
SELECT 
	(LENGTHB('ABC좋은나라DEF웃긴나라1234어이없음')-LENGTH('ABC좋은나라DEF웃긴나라1234어이없음'))/2 || '글자' "한글개수",
	(LENGTHB('ABC좋은나라DEF웃긴나라1234')-LENGTH('ABC좋은나라DEF웃긴나라1234'))/2 || '글자' "한글개수",
	(LENGTHB('ABC좋은나라234')-LENGTH('ABC좋은나라234'))/2 || '글자' "한글개수"
FROM 
	dual;	

-- temp테이블에 이름에 영문자가 포함된 이름만 출력하시오
SELECT EMP_NAME FROM temp;
SELECT 
	EMP_NAME, 
	(LENGTHB(EMP_NAME)-LENGTH(EMP_NAME))/2 "한글글자수",
	LENGTH(EMP_NAME) - (LENGTHB(EMP_NAME)-LENGTH(EMP_NAME))/2 "영숫자개수"
FROM 
	temp;

SELECT 
	EMP_NAME
FROM 
	temp
WHERE 
	LENGTH(EMP_NAME) - (LENGTHB(EMP_NAME)-LENGTH(EMP_NAME))/2 != 0 ;

-- LPAD, RPAD : 왼쪽, 오른쪽에 남는 자릿수를 특정 문자로 채운다.
-- LPAD(컬럼 또는 문자열, 길이, 채울문자)
-- RPAD(컬럼 또는 문자열, 길이, 채울문자)

-- 부서테이블에서 부서이름을 가져오는데 10자리를 기준으로 앞에 *로 채우고 싶다.
SELECT 
	DEPT_NAME , LPAD(DEPT_NAME, 10, '*'), RPAD(DEPT_NAME, 10, '*') 
FROM 
	TDEPT;

-- 부서테이블에서 부서이름을 가져오는데 10자리를 기준으로 앞에 왼쪽을 기준으로 순서대로 번호를 붙여서 가져오시오
SELECT 
	DEPT_NAME , LPAD(DEPT_NAME, 10, '123456789') -- 여기서는 한글을 2칸으로 인식
FROM 
	TDEPT;

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



SELECT 
	'ABC좋은나라DEF웃긴나라1234어이없음' ,
	REGEXP_REPLACE('ABC좋은나라DEF웃긴나라1234어이없음','[A-Z0-9]','')
FROM 
	dual;


SELECT 
	'ABC좋은나라DEF웃긴나라1234어이없음' ,
	REGEXP_REPLACE('ABC좋은나라DEF웃긴나라1234어이없음','[A-Z0-9]',''),
	REGEXP_REPLACE('ABC좋은나라DEF웃긴나라1234어이없음','[^A-Z0-9]','')
FROM 
	dual;





