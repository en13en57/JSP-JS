-- =============================================================================
-- 문자열 함수
-- =============================================================================
-- REPLACE : 문자열 바꾸기
--           REPLACE(컬럼 또는 문자열, 찾는 문자열, 바꿀 문자열)
-- =============================================================================
SELECT 
	REPLACE('ABC좋은나라DEF웃긴나라1234어이없음', '나라','국가')
FROM 
	dual;

-- 위의 문제에서 한글만 출력할 수 있을까?
SELECT 
	REPLACE(REPLACE(REPLACE('ABC좋은나라DEF웃긴나라1234어이없음', 'ABC',''),'DEF',''),'1234','') 한글만
FROM 
	dual;

-- 위의 문제에서 한글만을 빼고 출력할 수 있을까?
SELECT 
	REPLACE(REPLACE(REPLACE(REPLACE('ABC좋은나라DEF웃긴나라1234어이없음', '나라',''),'웃긴',''),'좋은',''),'어이없음','') 영숫자만
FROM 
	dual;



/*
https://neocan.tistory.com/348 참조
 * 
오라클은 10g 부터 REGEXP로 시작하는 함수를 지원 합니다. (Regular Expression 이라는 정규식의 의미 입니다.)
이 함수를 통해 데이터의 패턴을 보다 다양하게 찾고, 변경할 수 있게 되었습니다.

정규식 함수는 다음과 같습니다.

함수					설명
REGEXP_LIKE				Like 연산과 유사하여 정규식 패턴을 검색
REGEXP_REPLACE			정규식 패턴을 검색하여 대체 문자열로 변경
REGEXP_INSTR			정규식 패턴을 검색하여 위치 반환
REGEXP_SUBSTR			정규식 패턴을 검색하여 부분 문자 추출
REGEXP_COUNT(v11g)		정규식 패턴을 검색하여 발견된 횟수를 반환
*/

SELECT 
	REGEXP_REPLACE('ABC좋은나라DEF웃긴나라1234어이없음', '[0-9A-Za-z]','') 한글만,
	REGEXP_REPLACE('ABC좋은나라DEF웃긴나라1234어이없음', '[^0-9A-Za-z]','') 영숫자만
FROM 
	dual;
	

-- =============================================================================
-- CHR : ASCII코드값에 대한 문자를 알려준다.
--       CHR(컬럼 또는 코드값)
-- =============================================================================
SELECT 
	CHR(65), CHR(97), CHR(48)
FROM 
	dual;

-- =============================================================================
-- ASCII : 문자에 대한 ASCII코드값를 알려준다.
--       ASCII(컬럼 또는 문자값)
-- =============================================================================
SELECT 
	ASCII('A'), ASCII('a'),ASCII('0'), ASCII('가') , CHR(ASCII('가'))
FROM 
	dual;

/*
 한
 사
 람
 처럼 출력하시오
 */
SELECT 
	'한', '사', '람', '한'||chr(13)||'사'||chr(13)||'람'
FROM 
	dual;

-- 사번 : 19930301
-- 이름 : 정도령
-- 처럼 출력하시오

SELECT 
	'사번 : ' || EMP_ID || chr(13) || '이름 : ' || EMP_NAME 
FROM 
	TEMP t ;



-- =============================================================================
-- 숫자 함수
-- =============================================================================
-- ROUND 함수 : 반올림 함수
--              ROUND(숫자 또는 컬럼, 자릿수)
--              자릿수값이 음수이면 양의 자릿수에서 반올림한다.
-- =============================================================================
SELECT 
	round(567.8976),
	round(567.8976,1),
	round(567.8976,2),
	round(567.8976,-1),
	round(567.8976,-2)
FROM 
	dual;

-- 문제 : 부서별 연봉 평균을 출력하시오. 100000자리에서 반올림하시오
SELECT 
	LEV , avg(SALARY), round(avg(SALARY), -6)
FROM 
	TEMP t 
GROUP BY 
	LEV 
	;

-- 문제 2]  버림과 올림을 구현해 보아라.
SELECT 
	round(567.8976) 반올림,
	round(567.8976-0.5) 버림,
	round(567.0976+0.5) 올림,
	round(567.8976-0.3) "8이상올림7이하버림",
	round(567.7976-0.3) "8이상올림7이하버림"
FROM 
	dual;


-- =============================================================================
-- TRUNC 함수 : 버림 함수
--              TRUNC(숫자 또는 컬럼, 자릿수)
--              자릿수값이 음수이면 양의 자릿수에서 버림한다.
-- =============================================================================
SELECT 
	TRUNC(567.8976),
	TRUNC(567.8976,1),
	TRUNC(567.8976,2),
	TRUNC(567.8976,-1),
	TRUNC(567.8976,-2)
FROM 
	dual;

-- =============================================================================
-- SIGN 함수 : 부호를 알려준다.
--             SIGN(숫자 또는 컬럼,)
--             양수 1, 음수 -1, 0은 0, 빈값은 NULL, 숫자가아닌값 1
-- =============================================================================
SELECT 
	SIGN(123),SIGN(-45),SIGN(0),SIGN(NULL),SIGN(''), SIGN('123') 
FROM 
	dual;

-- =============================================================================
-- CEIL 함수 : 넘는 최소 정수
--             CEIL(숫자 또는 컬럼)
-- =============================================================================
SELECT 
	CEIL(123.5),CEIL(-123.5),CEIL(123.4),CEIL(-123.4) 
FROM 
	dual;

-- =============================================================================
-- FLOOR 함수 : 넘지않는 최대 정수
--             FLOOR(숫자 또는 컬럼)
-- =============================================================================
SELECT 
	FLOOR(123.5),FLOOR(-123.5),FLOOR(123.4),FLOOR(-123.4) 
FROM 
	dual;

-- =============================================================================
-- MOD 함수 : 나머지 구해준다
--            MOD(숫자 또는 컬럼, 나누는 수)
-- =============================================================================
SELECT
	MOD(11,3), MOD(5, 7), MOD(3, 3)
FROM 
	dual;
	

SELECT * FROM TEMP;


-- 아래의 명령을 실행하기 전에 상단 중간에 T(메뉴)의 커밋모드를 수동으로 변경하고 연습을 수행해야 한다.

-- select 명령을 이용한 테이블 생성
-- create table 테이블명 as select명령
CREATE TABLE imsi AS SELECT EMP_ID , EMP_NAME , SALARY FROM TEMP;

SELECT * FROM imsi; -- 내용보기

DELETE FROM imsi; -- 모두 삭제

SELECT * FROM imsi; -- 내용보기

ROLLBACK; -- 명령 취소

SELECT * FROM imsi; -- 내용이 보인다.

DELETE FROM imsi; -- 삭제

COMMIT; -- DB에 완전적용

ROLLBACK; -- 취소할 놈이 없다.

SELECT * FROM imsi;  -- 내용이 모두 지워졌다.

--- MOD 함수의 활용
--- 오라클에는 rownum이란 숨겨진 필드가 존재한다. 나타나는 순서를 알려준다.
--- 오라클에는 rowid란 숨겨진 필드가 존재한다. 검색을 보다 빠르게 하기 위한 숨겨진 필드 
SELECT rownum, rowid , t.* FROM TEMP t;
SELECT rownum, rowid , t.* FROM TEMP t ORDER BY EMP_NAME desc;

CREATE TABLE mod_test AS SELECT rownum NO FROM temp; -- no필드에 숫자가 1~10까지 들어간 테이블이 생성
SELECT * FROM mod_test;

-- 2의 1승에서부터 2의 10승까지를 출력하시오
SELECT POWER(2, NO) "2의 누승" FROM mod_test; 

-- 위의 내용을 1줄에 3개씩 출력하려고 한다. --- 나중에 DECOODE함수를 배우고 해결해보자~~~~
SELECT NO, MOD(NO-1, 3) + 1 OUT FROM mod_test;



-- =============================================================================
-- 날짜 함수
-- =============================================================================
-- 1. 날짜와 날짜를 더하면 어떻게 될까요? ---> 에러입니다.
SELECT EMP_NAME , BIRTH_DATE  + SYSDATE FROM TEMP t WHERE EMP_NAME = '홍길동';

-- 2. 날짜에 정수를 더하거나 빼면 어떻게 될까요? ---> + -를 하면 일이 가감산 됩니다.
SELECT sysdate+1 내일, sysdate 오늘, sysdate-1 어제 FROM dual;
SELECT sysdate+1.5 내일, sysdate 오늘, sysdate-1.5 어제 FROM dual;

-- 정수부분은 일수이고 소수부분은 시간이다.

-- 문제 : 1시간전, 1시간후를 보여라
SELECT sysdate+1/24 , sysdate , sysdate-1/24 FROM dual;

-- 문제 : 30분전, 30분후를 보여라
SELECT sysdate+1/24/60*30 , sysdate , sysdate-1/24/60*30 FROM dual;

-- 문제 : 오늘부터 10일간의 날짜를 가져오시오
SELECT SYSDATE + (NO-1) FROM mod_test;

-- TO_CHAR(데이터, 형식) : 지정 형식으로 문자열을 만든다.
SELECT 
	SYSDATE, 
	TO_CHAR(SYSDATE, 'YYYY-MM-DD'), 
	TO_CHAR(SYSDATE, 'YY-MM-DD'), 
	TO_CHAR(SYSDATE, 'HH:MI:SS'), 
	TO_CHAR(SYSDATE, 'HH24:MI:SS') 
FROM 
	dual;

-- 문제 : 30분전, 30분후를 보여라
SELECT 
	TO_CHAR(sysdate+1/24/60*30, 'HH:MI:SS') "30분후",
	TO_CHAR(sysdate, 'HH:MI:SS') "지금", 
	TO_CHAR(sysdate-1/24/60*30, 'HH:MI:SS') "30분전" 
FROM 
	dual;

SELECT * FROM TEMP t ;

-- 문제 : 직원의 살아온 일수를 구하여 내림차순으로 정렬하여 조회하시오
SELECT 
	EMP_NAME , 
	round(SYSDATE-BIRTH_DATE) "살아온일수",
	round((SYSDATE-BIRTH_DATE)/365) "나이",
	round((SYSDATE-BIRTH_DATE)/365.2422) "나이"
FROM 
	TEMP
ORDER BY 
	BIRTH_DATE DESC;

-- =================================================================
-- ADD_MONTHS : 개월을 더해준다.
-- =================================================================
SELECT 
	SYSDATE, ADD_MONTHS(SYSDATE, 1), ADD_MONTHS(SYSDATE, 2), ADD_MONTHS(SYSDATE, -1), ADD_MONTHS(SYSDATE, -12) 
FROM 
	dual;

-- =================================================================
-- MONTHS_BETWEEN : 간격이 몇개월인지 알려준다.
-- =================================================================
SELECT 
	MONTHS_BETWEEN(SYSDATE, BIRTH_DATE), 
	round(MONTHS_BETWEEN(SYSDATE, BIRTH_DATE)) 살아온개월수, 
	round((MONTHS_BETWEEN(SYSDATE, BIRTH_DATE))/12) 나이,
	round((SYSDATE-BIRTH_DATE)/365.2422) "나이"
FROM 
	TEMP t ;

-- =================================================================
-- LAST_DAY : 마지막 날짜 알려준다.
-- =================================================================
SELECT 
	BIRTH_DATE ,
	LAST_DAY(BIRTH_DATE),
	TO_CHAR(LAST_DAY(BIRTH_DATE),'YYYY-MM-DD') "생월의 마지막날짜",
	TO_CHAR(LAST_DAY(BIRTH_DATE)+1,'YYYY-MM-DD') "다음달 1일의 날짜",
	TO_CHAR(BIRTH_DATE,'DD') 일문자,
	TO_NUMBER(TO_CHAR(BIRTH_DATE,'DD'),'99') 일숫자,
	TO_NUMBER(TO_CHAR(BIRTH_DATE,'DD'),'99')+1 "일수자-1",
	TO_CHAR(BIRTH_DATE-(TO_NUMBER(TO_CHAR(BIRTH_DATE,'DD'),'99'))+1,'YYYY-MM-DD') "생월 1일의 날짜"
FROM 
	TEMP t ;


-- =================================================================
-- 그룹함수
-- =================================================================
SELECT  * FROM  temp;
SELECT  count(*), count(HOBBY) FROM  temp; -- 10, 4(NULL 제외)

SELECT  sum(SALARY)/count(*), sum(SALARY)/count(HOBBY), avg(SALARY) FROM  temp;

-- 취미가 있는 사원의 평균연봉과 취미가 없는 사원의 평균 연봉을 구하고 싶다.
SELECT sum(SALARY)/count(*), avg(SALARY) FROM  temp WHERE HOBBY IS NOT NULL;
SELECT sum(SALARY)/count(*), avg(SALARY) FROM  temp WHERE HOBBY IS NULL;

-- 직급의 종류를 보고싶다
SELECT LEV FROM temp;
SELECT DISTINCT LEV FROM temp;

-- 직급이 몇개나 존재할까?
SELECT count(LEV) FROM temp;
SELECT count(DISTINCT LEV) FROM temp;

-- ======================================================================================
-- 문제] 이번달 1일부터 말일까지의 날짜 얻어오기

-- 오라클 증가하는 숫자 만들기
SELECT LEVEL FROM dual CONNECT BY LEVEL <=15; 

SELECT 
	TO_CHAR(SYSDATE-(TO_NUMBER(TO_CHAR(SYSDATE,'DD'),'99'))+1,'YYYY-MM-DD') "1일",
	LAST_DAY(SYSDATE) "말일1",
	TO_CHAR(LAST_DAY(SYSDATE),'DD') "말일2"
FROM 
	dual;

SELECT 
	TO_CHAR(SYSDATE-(TO_NUMBER(TO_CHAR(SYSDATE,'DD'),'99'))+LEVEL,'YYYY-MM-DD') "일자"
FROM 
	dual CONNECT BY LEVEL <= TO_NUMBER(TO_CHAR(LAST_DAY(SYSDATE),'DD'),'99');
-- ======================================================================================






