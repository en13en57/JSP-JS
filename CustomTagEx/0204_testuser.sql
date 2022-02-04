-- testuser에서 합니다.
SELECT * FROM tab; -- 테이블/뷰의 목록을 본다.

-- temp테이블의 자료를 이용하여 조회 결과를 3개행씩 묶어 하나의 번호를 부여하는 SQL 작성
SELECT * FROM temp;

SELECT rownum, e.EMP_ID , e.EMP_NAME FROM temp e;
SELECT rownum, CEIL(rownum/3) "부여된 번호",  e.EMP_ID , e.EMP_NAME FROM temp e;

-- ========================================================================================
-- DECODE 함수 : if ~ else 를 대신해 주는 함수
-- ========================================================================================
DROP TABLE LECTURE;
CREATE TABLE LECTURE (LEC_ID VARCHAR2(05),LEC_TIME NUMBER,LEC_POINT NUMBER);
INSERT INTO LECTURE VALUES('L0001',3,3);
INSERT INTO LECTURE VALUES('L0002',3,2);
INSERT INTO LECTURE VALUES('L0003',2,3);
INSERT INTO LECTURE VALUES('L0004',2,2);
INSERT INTO LECTURE VALUES('L0005',3,1);
COMMIT;

SELECT * FROM lecture;
-- DECODE(a,b,참) : a와 b가 같으면 참의 값을 가진다.
-- 시간이 3이면 특수과목이라고 조회하시오
SELECT 
	l.LEC_ID , l.LEC_TIME , l.LEC_POINT , DECODE(l.LEC_TIME, 3, '특수과목') 
FROM 
	LECTURE l;
-- DECODE(a,b,참,거짓) : a와 b가 같으면 참의 값을, 다르면 거짓값을 가진다.
-- 시간이 3이면 특수과목으로, 그외의 시간은 일반과목으로 조회하시오
SELECT 
	l.LEC_ID , l.LEC_TIME , l.LEC_POINT , DECODE(l.LEC_TIME, 3, '특수과목', '일반과목') 
FROM 
	LECTURE l;
-- DECODE(a,b,참1, c, 참2, d, 참3 ....., 참n) : a가 b와 같으면 참1, c와 같으면 참2, d와 같으면 참3
--                                              ... 모두 일치하지 않으면 참n을 가진다.
-- 시간이 1이면 "교양" 2이면 "일반" 3이면 "특수"로 조회하시오
SELECT 
	l.LEC_ID , l.LEC_TIME , l.LEC_POINT , DECODE(l.LEC_TIME,1,'교양',2,'일반',3,'특수','???') 
FROM 
	LECTURE l ;
	
-- 주당 강의시간과 학점이 일치하는 과목의 수를 구하는 SQL문을 만드시오
SELECT 
	l.LEC_ID , l.LEC_TIME , l.LEC_POINT , DECODE(l.LEC_TIME,l.LEC_POINT ,1) 
FROM 
	LECTURE l ;

SELECT 
	l.LEC_ID , l.LEC_TIME , l.LEC_POINT , DECODE(l.LEC_TIME,l.LEC_POINT ,1,0) 
FROM 
	LECTURE l ;
	
-- 과목의 수를 구하는 SQL문을 만드시오
SELECT COUNT(DECODE(l.LEC_TIME,l.LEC_POINT ,1)) 과목수 FROM LECTURE l ; -- ==> 2
SELECT sum(DECODE(l.LEC_TIME,l.LEC_POINT ,1)) 과목수 FROM LECTURE l ; -- ==> 2

SELECT COUNT(DECODE(l.LEC_TIME,l.LEC_POINT ,1,0)) 과목수 FROM LECTURE l ; -- count함수는 null은 세지 않는다. ==> 5
SELECT sum(DECODE(l.LEC_TIME,l.LEC_POINT ,1,0)) 과목수 FROM LECTURE l ; -- 값을 더한다 ==> 2

-- 주당 강의시간과 학점이 일치하면 일반이라고 표시하여 정렬시키고싶다.
SELECT 
	l.LEC_ID , DECODE(l.LEC_TIME,l.LEC_POINT ,'일반')
FROM 
	LECTURE l ORDER BY DECODE(l.LEC_TIME,l.LEC_POINT ,'일반');
	
SELECT 
	l.LEC_ID , DECODE(l.LEC_TIME,l.LEC_POINT ,'일반')
FROM 
	LECTURE l ORDER BY 2; -- 정렬시 필드 번호를 조회하는 순서 번호 사용가능하다.
	
-- 월 01, 화 11, 수 21, 목 31, 금 41, 토 51, 일 61
-- 해당일자에 위의 번호를 붙여 4자리의 암호를 출력하는 쿼리를 완성해라,
SELECT 
	SYSDATE "오늘" ,
	TO_CHAR(SYSDATE, 'DD')일, 
	TO_CHAR(SYSDATE, 'DAY')요일1,
	TO_CHAR(SYSDATE, 'DY')요일2,
	TO_CHAR(SYSDATE, 'D')요일3,
	TO_CHAR(SYSDATE+1, 'D')요일4,
	TO_CHAR(SYSDATE+2, 'D')요일5
FROM 
	dual;	

SELECT 
	EMP_ID , EMP_NAME , BIRTH_DATE , TO_CHAR(BIRTH_DATE,'DAY') || '에 태어남' 
FROM 
	TEMP t;
-- 월 01, 화 11, 수 21, 목 31, 금 41, 토 51, 일 61
SELECT 
	EMP_ID , EMP_NAME , BIRTH_DATE , 
	TO_CHAR(BIRTH_DATE,'DD'),
	TO_CHAR(BIRTH_DATE,'DAY'),
	TO_CHAR(BIRTH_DATE,'DD') || DECODE(TO_CHAR(BIRTH_DATE,'D'),1,'61',2,'01',3,'11',4,'21',5,'31',6,'41',7,'51') 암호
FROM 
	TEMP t;

-- ========================================================================== DECODE함수는 같다만 된다.
-- 만약 부등호가 사용될 때 DECODE를 사용할 수 있을까?

-- Ex) 시간이 크면 '실험', 학점이 크면 '기타', 같으면 '일반' 이라고 조회하고싶다	
-- SIGN함수 : SIGN(값 또는 필드면 또는 식) : 괄호안의 결과가 양수이면 1을 음수이면 -1을, 그외에는 0을
SELECT 
	l.*, sign(l.LEC_TIME-l.LEC_POINT) 부호,
	DECODE(sign(l.LEC_TIME-l.LEC_POINT),1,'실험',-1,'기타',0, '일반') 
FROM
	LECTURE l ;

-- LEAST : 작은 값을 알려준다.
-- GREATEST : 큰값을 알려준다.
SELECT 
	l.LEC_POINT , l.LEC_TIME , LEAST(l.LEC_POINT,l.LEC_TIME), GREATEST(l.LEC_POINT,l.LEC_TIME) 
FROM 
	LECTURE l ;

SELECT 
	l.* , LEAST(l.LEC_POINT,l.LEC_TIME), DECODE(LEAST(l.LEC_POINT,l.LEC_TIME),l.LEC_TIME ,'기타','일반') 
FROM 
	LECTURE l ;

SELECT 
	l.* , LEAST(l.LEC_POINT,l.LEC_TIME), DECODE(GREATEST(l.LEC_POINT,l.LEC_TIME),l.LEC_POINT ,'기타','일반') 
FROM 
	LECTURE l ;

-- time과 point가 같으면서 time이 3인 과목은 옆에 주요과목이라고 표시해라
-- DECODE함수로 and 연산하기!
SELECT 
	l.* , DECODE(l.LEC_TIME, l.LEC_POINT, DECODE(l.LEC_TIME,3,'주요',''),'') -- 중첩해서 사용 가능 
FROM 
	LECTURE l ;	

-- temp테이블의 자료를 이용하여 1줄에 사번, 이름을 3개씩 조회하고싶다.
SELECT e.EMP_ID 사번, e.EMP_NAME 이름 FROM TEMP e;
SELECT rownum, CEIL(rownum/3), e.EMP_ID 사번, e.EMP_NAME 이름 FROM TEMP e;
SELECT CEIL(rownum/3), e.EMP_ID 사번, e.EMP_NAME 이름 FROM TEMP e; -- 여기서 조회된 번호를 1줄에 출력하면 된다.
SELECT 
	CEIL(rownum/3) 번호,
	mod(rownum, 3) 나머지,
	DECODE(MOD(rownum,3),1, EMP_ID, '') 사번, 
	DECODE(MOD(rownum,3),1, EMP_NAME , '') 이름,
	DECODE(MOD(rownum,3),2, EMP_ID, '') 사번, 
	DECODE(MOD(rownum,3),2, EMP_NAME , '') 이름,
	DECODE(MOD(rownum,3),0, EMP_ID, '') 사번, 
	DECODE(MOD(rownum,3),0, EMP_NAME , '') 이름
FROM
	TEMP e;

SELECT 
	CEIL(rownum/3) 번호,
	MAX(DECODE(MOD(rownum,3),1, EMP_ID, '')) 사번, 
	MAX(DECODE(MOD(rownum,3),1, EMP_NAME , '')) 이름,
	MAX(DECODE(MOD(rownum,3),2, EMP_ID, '')) 사번, 
	MAX(DECODE(MOD(rownum,3),2, EMP_NAME , '')) 이름,
	MAX(DECODE(MOD(rownum,3),0, EMP_ID, '')) 사번, 
	MAX(DECODE(MOD(rownum,3),0, EMP_NAME , '')) 이름
FROM
	TEMP e
GROUP BY
	CEIL(rownum/3)
ORDER BY 1;

-- 위의 처리과정을 참조하여 1줄에 사번, 이름, 연봉을 2개씩 조회하는 SQL을 완성하시오
SELECT 
	CEIL(rownum/2) 번호,
	MAX(DECODE(MOD(rownum,2),1, EMP_ID, '')) 사번, 
	MAX(DECODE(MOD(rownum,2),1, EMP_NAME , '')) 이름,
	MAX(DECODE(MOD(rownum,2),1, e.SALARY , '')) 연봉,
	MAX(DECODE(MOD(rownum,2),0, EMP_ID, '')) 사번, 
	MAX(DECODE(MOD(rownum,2),0, EMP_NAME , '')) 이름,
	MAX(DECODE(MOD(rownum,2),0, e.SALARY , '')) 연봉
FROM
	TEMP e
GROUP BY
	CEIL(rownum/2)
ORDER BY 1;

-- ================================================================================
-- NOT IN의 함정
-- ================================================================================
SELECT COUNT(*) FROM temp; -- 20개
SELECT COUNT(*) FROM temp WHERE HOBBY IN('등산','낚시'); -- 4개
SELECT COUNT(*) FROM temp WHERE HOBBY NOT IN('등산','낚시'); -- 10개

-- 6개는 어디로 갔을까? -----> null이 제외 되었다.
-- null처리까지 해줘야 한다.
SELECT COUNT(*) FROM temp WHERE HOBBY NOT IN('등산','낚시') OR HOBBY IS NULL; -- 16개
SELECT COUNT(*) FROM temp WHERE HOBBY NOT IN('등산','낚시',NULL); -- 0개 : 이렇게 하면 틀린다.

-- VIEW : select 결과의 모양 저장해주는 가상의 테이블
-- create or replace view 뷰이름 as select 명령
-- 권한이 없으면 sys로 로그인 하여 권한을 부여해야 한다.
-- 뷰 권한설정 : 반드시 sys 계정에서 해야한다.
-- GRANT create view TO testuser;

CREATE OR REPLACE VIEW my_emp AS SELECT e.emp_id ID, e.EMP_NAME NAME, e.SALARY SAL FROM TEMP e;
SELECT * FROM tab; -- 테이블/뷰 확인
SELECT e.emp_id ID, e.EMP_NAME NAME, e.SALARY SAL FROM TEMP e;
SELECT * FROM my_emp;

SELECT * FROM user_objects; -- 현재 사용자가 관리 가능한 모든 객체를 보여준다.
SELECT uo.OBJECT_NAME,uo.OBJECT_TYPE FROM user_objects uo WHERE uo.OBJECT_TYPE IN('TABLE','VIEW'); -- SELECT * FROM tab;와 일치
-- 위의 결과를 보니 tab는 테이블이 아니라 뷰다.
CREATE OR REPLACE VIEW my_tab AS SELECT uo.OBJECT_NAME,uo.OBJECT_TYPE FROM user_objects uo WHERE uo.OBJECT_TYPE IN('TABLE','VIEW');

SELECT * FROM my_tab;

CREATE OR REPLACE VIEW tables AS SELECT uo.OBJECT_NAME,uo.OBJECT_TYPE FROM user_objects uo WHERE uo.OBJECT_TYPE IN('TABLE','VIEW');

SELECT * FROM tables;
-- view에 조건 지정이 가능할까요? ==> 사용은 일반 테이블과 같은 방법으로 가능하다.
SELECT * FROM tables WHERE OBJECT_type='TABLE';
SELECT * FROM tables WHERE OBJECT_type='VIEW' ORDER BY OBJECT_name;

-- 그런데 view만 보는 명령은 없을까?
SELECT * FROM USER_VIEWS ;
SELECT view_name, Text FROM user_views;


-- 문제] 자신이 속한 직급의 평균 연봉보다 더 받는 직원의 목록을 보고싶다.
-- 1) 직급별 평균 연봉
SELECT lev, avg(SALARY) FROM TEMP GROUP BY LEV;
SELECT lev, avg(SALARY) AS "avg_sal" FROM TEMP GROUP BY LEV;
-- 2) 위의 직급별 평균 연봉을 뷰로 만들어 보자
CREATE OR REPLACE VIEW avg_sal_view AS SELECT lev, avg(salary) AS avg_sal FROM temp GROUP BY lev;
SELECT * FROM avg_sal_view;
-- 3) 뷰를 이용하여 조인하면 문제를 해결할 수 있다.
SELECT 
	e.EMP_ID ,e.EMP_NAME ,e.SALARY , A.avg_sal, e.LEV 
FROM 
	TEMP e, avg_sal_view A
WHERE 
	e.LEV = A.LEV AND e.SALARY > A.avg_sal;

-- 그런데 위의 뷰를 단 1번만 사용한다면 굳이  뷰를  만들 필요가 있을까? 이럴때는 INLINE VIEW를 사용하면 된다.
-- from절에 사용되는 select 명령을 서브쿼리 인라인 뷰라고 한다.
SELECT 
	e.EMP_ID ,e.EMP_NAME ,e.SALARY , A.avg_sal, e.LEV 
FROM 
	TEMP e, (SELECT lev, avg(salary) AS avg_sal FROM temp GROUP BY lev) A
WHERE 
	e.LEV = A.LEV AND e.SALARY > A.avg_sal;

-- 인라인 뷰를 이용하여 rownum이 5~10인 행만 가져올 수 있을까?
SELECT * FROM temp;
SELECT rownum rnum, e.* FROM TEMP e;
SELECT rownum rnum, e.* FROM TEMP e WHERE rownum BETWEEN 5 AND 10; -- 어 나오지 않네 우짜지?

-- 인라인 뷰를 이용하면 될까??
-- 1) 일단 번호 붙여서 전체 가져오기
SELECT * FROM (SELECT rownum rnum, e.* FROM TEMP e) Q;
-- 번호를 제한해서 가져오기 -- 되는것 같다.
SELECT * FROM (SELECT rownum rnum, e.* FROM TEMP e) Q WHERE rnum BETWEEN 5 AND 10;
-- 원본에 정렬을 하니 내가 원하는 데이터가 아니다.
SELECT * FROM (SELECT rownum rnum, e.* FROM TEMP e ORDER BY e.EMP_NAME desc) Q WHERE rnum BETWEEN 5 AND 10;
-- 정렬에 상관없이 항상 동일한 값을 얻으려면 어떻게 해야 할까?
SELECT rownum rnum, Q.* FROM (SELECT * FROM TEMP e ORDER BY e.EMP_NAME desc) Q WHERE rownum<=10;

SELECT
	R.* 
FROM 
	(SELECT rownum rnum, Q.* FROM (SELECT * FROM TEMP e ORDER BY e.EMP_NAME desc) Q WHERE rownum<=10) R
WHERE 
	rnum>=5;
--========================================================================================================
-- CONNECT BY 를 이용한 계층 쿼리
--========================================================================================================
-- 1번부터 10번까지 번호를 생성하려면 지금까지는 이런 방법을 사용했었다.
SELECT rownum AS "NO" FROM temp WHERE rownum<=15; -- 15번 까지 나온다
SELECT rownum AS "NO" FROM temp WHERE rownum<=35; -- 레코드 갯수를 넘는 번호는 못만든다. -- 20개이다.

SELECT rownum AS "NO" FROM temp, temp WHERE rownum<=35; -- 조건 없이 조인하면 n*n개이다. 총 20*20=400까지 가능


-- CONNECT BY를 이용한 일련번호 생성하기
SELECT LEVEL FROM dual CONNECT BY LEVEL <=10; -- 1 ~ 10 까지 번호 생성

SELECT LEVEL AS NO FROM dual CONNECT BY LEVEL <=100; -- 1 ~ 100 까지 번호 생성

-- 2022년 1월 부터 2022년 12월 까지 출력하고 싶다.
SELECT '2022년' || LPAD(LEVEL,2,0) || '월' AS NO FROM dual CONNECT BY LEVEL <=12;

-- 특정 날짜 구간 조회하기
-- 2022년 2월 1일부터 2월 20일까지 출력하라
-- 날짜 - 날짜 = 사이의 일수
-- 날짜 + 정수 = 정수일 후 날짜
-- 시작일 TO_DATE('20220201','YYYY-MM-DD')
-- 종료일 TO_DATE('20220221','YYYY-MM-DD')
SELECT TO_DATE('20220201','YYYY-MM-DD') + (LEVEL-1) AS "날짜" FROM dual CONNECT BY LEVEL <= (TO_DATE('20220221','YYYY-MM-DD')-TO_DATE('20220201','YYYY-MM-DD'));

-- 오늘부터 1달간의 날짜를 조회 하시오
SELECT
	SYSDATE + (LEVEL-1) AS "날짜",
	TO_CHAR(SYSDATE + (LEVEL-1), 'YYYY-MM-DD') "날짜2",
	TO_CHAR(SYSDATE + (LEVEL-1), 'YYYY"년"MM"월"DD"일"(DAY)') "날짜3"
FROM 
	dual 
CONNECT BY
	LEVEL <= ADD_MONTHS(SYSDATE,1)-SYSDATE;
	
-- 1일부터 오늘까지의 날짜만 조회
-- 1) 이번달의 1일
SELECT 
	(TO_DATE(TO_CHAR(SYSDATE,'YYYYMM"01"'),'YYYYMMDD')) "1일의 날짜" FROM dual;

-- 2) 이번달의 마지막일
SELECT LAST_DAY(SYSDATE) "마지막 날짜" FROM dual;
-- 3) 이번달 날짜 구하기
SELECT (TO_DATE(TO_CHAR(SYSDATE,'YYYYMM"01"'),'YYYYMMDD'))+(LEVEL-1) "날짜" FROM dual 
CONNECT BY 
	LEVEL <= (LAST_DAY(SYSDATE) - TO_DATE(TO_CHAR(SYSDATE,'YYYYMM"01"'),'YYYYMMDD')+1);
-- 4) 1일부터 오늘까지의 날짜만 조회
SELECT 
	(TO_DATE(TO_CHAR(SYSDATE,'YYYYMM"01"'),'YYYYMMDD')) + (LEVEL-1) AS "날짜",
	TO_CHAR((TO_DATE(TO_CHAR(SYSDATE,'YYYYMM"01"'),'YYYYMMDD')) + (LEVEL-1), 'YYYY-MM-DD') "날짜2",
	TO_CHAR((TO_DATE(TO_CHAR(SYSDATE,'YYYYMM"01"'),'YYYYMMDD')) + (LEVEL-1), 'YYYY"년" MM"월" DD"일"(DAY)') "날짜3"
FROM 
	dual
CONNECT BY
	LEVEL <=  SYSDATE - (TO_DATE(TO_CHAR(SYSDATE,'YYYYMM"01"'),'YYYYMMDD'));

-- 5) 오늘부터 이번달 마지막 날짜 까지 조회하기
SELECT 
	SYSDATE + (LEVEL-1) AS "날짜",
	TO_CHAR(SYSDATE + (LEVEL-1), 'YYYY-MM-DD') "날짜2",
	TO_CHAR(SYSDATE + (LEVEL-1), 'YYYY"년" MM"월" DD"일"(DAY)') "날짜3"
FROM 
	dual
CONNECT BY
	LEVEL <=  LAST_DAY(SYSDATE) - SYSDATE + 1;

	
-- 6) 이번 달을 테이블에 만들어 저장하시오
-- 	  SELECT 로 테이블 생성하기 : create table 테이블명 as select 명령;
DROP TABLE board202202;
CREATE TABLE board202202 AS
	SELECT TO_DATE(TO_CHAR(sysdate, 'YYYYMM"01"'),'YYYYMMDD') + (LEVEL-1) AS "day", 'Y' AS YN FROM dual
	CONNECT BY
		LEVEL <= (LAST_DAY(SYSDATE) - TO_DATE(TO_CHAR(SYSDATE,'YYYYMM"01"'),'YYYYMMDD')+1);
	
SELECT * FROM board202202;