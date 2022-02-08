-- ===========================================
-- 6장 : 행과 열의 상호 변환
-- ===========================================

-- 행을 열로 변환하는 방법
-- -----------------------
CREATE TABLE SAM_TAB02(gubun varchar2(5));

SELECT * FROM SAM_TAB02 st;

-- 위의 테이블에 임시 데이터 F107~F125까지를 입력하려면 어떻게 해야 할까?
SELECT LEVEL LEV FROM dual CONNECT BY LEVEL<20;
SELECT 'F' || (LEVEL+106) LEV FROM dual CONNECT BY LEVEL<20;

-- insert into 테이블명 select ~ : select결과를 지정 테이블에 insert 시켜준다.
-- select 한 결과를 insert하면 된다.
INSERT INTO SAM_TAB02 SELECT 'F' || (LEVEL+106) LEV FROM dual CONNECT BY LEVEL<20;
COMMIT;
SELECT * FROM SAM_TAB02 st; -- 19개 저장됨

-- 위의 19개 데이터를 1줄에 4개씩 번호를 붙여서 조회하시오!!!!
SELECT count(*) FROM SAM_TAB02;
SELECT rownum rnum, GUBUN FROM SAM_TAB02;

SELECT 
	CEIL(rnum/4) 번호, 
	DECODE(MOD(rnum,4), 1, GUBUN) 열1,
	DECODE(MOD(rnum,4), 2, GUBUN) 열2,
	DECODE(MOD(rnum,4), 3, GUBUN) 열3,
	DECODE(MOD(rnum,4), 0, GUBUN) 열4
FROM 
	(SELECT rownum rnum, GUBUN FROM SAM_TAB02);


SELECT 
	CEIL(rnum/4) 번호, 
	MAX(DECODE(MOD(rnum,4), 1, GUBUN)) 열1,
	MAX(DECODE(MOD(rnum,4), 2, GUBUN)) 열2,
	MAX(DECODE(MOD(rnum,4), 3, GUBUN)) 열3,
	MAX(DECODE(MOD(rnum,4), 0, GUBUN)) 열4
FROM 
	(SELECT rownum rnum, GUBUN FROM SAM_TAB02)
GROUP BY
	CEIL(rnum/4)
ORDER BY 
	1;
	
-- 위의 방법을 사용하여 temp테이블의 사번과 이름을 1줄에 3명씩 출력하시오!!!
SELECT * FROM temp;
SELECT 
	CEIL(rnum/3) 번호, 
	MAX(DECODE(MOD(rnum,3), 1, A.EMP_ID )) 사번,
	MAX(DECODE(MOD(rnum,3), 1, A.EMP_NAME )) 이름,
	MAX(DECODE(MOD(rnum,3), 2, A.EMP_ID)) 사번,
	MAX(DECODE(MOD(rnum,3), 2, A.EMP_NAME )) 이름,
	MAX(DECODE(MOD(rnum,3), 0, A.EMP_ID)) 사번,
	MAX(DECODE(MOD(rnum,3), 0, A.EMP_NAME )) 이름
FROM 
	(SELECT rownum rnum, t.* FROM temp t) A
GROUP BY
	CEIL(rnum/3)
ORDER BY 
	1;
	

-- 열을 행으로 변환하는 방법
-- -------------------------
SELECT * FROM test12;
CREATE TABLE TEST12 (
    COLL   VARCHAR2(30),         
    DEPT   VARCHAR2(30),                  
    FRE    NUMBER,   
    SUP    NUMBER,   
    JUN    NUMBER,   
    SEN    NUMBER,
    CONSTRAINT TEST12_PK PRIMARY KEY (COLL,DEPT));  
INSERT INTO TEST12 VALUES('공과대학','항공우주공학과',120, 140, 140, 120);
INSERT INTO TEST12 VALUES('공과대학','기계공학과',    240, 260, 240, 240);
INSERT INTO TEST12 VALUES('공과대학','조선공학과',    118, 138, 136, 126);
INSERT INTO TEST12 VALUES('공과대학','산업공학과',    123, 141, 140, 120);
INSERT INTO TEST12 VALUES('공과대학','전자공학과',    126, 141, 140, 128);
INSERT INTO TEST12 VALUES('공과대학','재료공학과',    128, 132, 142, 126);
INSERT INTO TEST12 VALUES('공과대학','화학공학과',    122, 141, 141, 122);
INSERT INTO TEST12 VALUES('공과대학','전기공학과',    120, 140, 140, 120);
INSERT INTO TEST12 VALUES('공과대학','컴퓨터공학과',  124, 145, 142, 121);
INSERT INTO TEST12 VALUES('공과대학','섬유공학과',    126, 144, 140, 120);
INSERT INTO TEST12 VALUES('공과대학','자동화공학과',  122, 142, 144, 125);
INSERT INTO TEST12 VALUES('공과대학','고분자공학과',  121, 142, 143, 124);
COMMIT;
SELECT * FROM test12;

-- 4개열을 4개의 행으로 출력해보자

SELECT LEVEL LEV FROM dual CONNECT BY LEVEL<5; -- 4개
SELECT * FROM test12; -- 12개

-- 두개를 조건없이 조인하면 12*4 = 48개가 나온다.
SELECT 
	A.*, B.*
FROM 
	test12 A, (SELECT LEVEL LEV FROM dual CONNECT BY LEVEL<5) B;

SELECT 
	A.COLL, A.DEPT, DECODE(B.LEV, 1,'1학년', 2,'2학년', 3,'3학년', 4,'4학년') 학년
FROM 
	test12 A, (SELECT LEVEL LEV FROM dual CONNECT BY LEVEL<5) B;

SELECT 
	A.COLL, A.DEPT, B.LEV||'학년', DECODE(B.LEV, 1, A.FRE , 2, A.SUP, 3, A.JUN, 4, A.SEN) 학생수
FROM 
	test12 A, (SELECT LEVEL LEV FROM dual CONNECT BY LEVEL<5) B;

SELECT 
	A.COLL, A.DEPT, B.LEV||'학년' 학년, DECODE(B.LEV, 1, A.FRE , 2, A.SUP, 3, A.JUN, 4, A.SEN) 학생수
FROM 
	test12 A, (SELECT LEVEL LEV FROM dual CONNECT BY LEVEL<5) B
ORDER BY 
	2, 3;

-- 위의 문제를 응용하여 1,2 학년 학생수, 3,4학년 학생수를 1줄에 출력하시오!!!

SELECT 
	A.COLL, A.DEPT, DECODE(B.LEV, 1, '1,2학년', 2, '3,4학년') 학년, 
	DECODE(B.LEV, 1, A.FRE, 2, A.JUN) 학생수1,
	DECODE(B.LEV, 1, A.SUP, 2, A.SEN) 학생수2
FROM 
	test12 A, (SELECT LEVEL LEV FROM dual CONNECT BY LEVEL<3) B
ORDER BY 
	2, 3;

-- ================================
-- 7장. 누계구하기
-- ================================
-- 테이블 생성
CREATE TABLE TEST01 (A VARCHAR2(10) PRIMARY KEY, B NUMBER);

-- PL/SQL로 만든 익명함수 
-- 블록을 잡고 실행해야 한다.
DECLARE -- 선언부
  PL_CNT NUMBER; -- 변수 선언
BEGIN -- 실행부
  PL_CNT :=0; -- 변수 초기화
  LOOP -- 무한 루프
	  PL_CNT := PL_CNT + 1; -- 1증가
	  EXIT WHEN PL_CNT > 1000;  -- 1000보다크면 탈출
	  INSERT INTO TEST01 VALUES (LPAD(TO_CHAR(PL_CNT),5,'0'),PL_CNT); -- 데이터 추가 
  END LOOP;
  COMMIT;
END;

SELECT count(*) FROM test01;
SELECT * FROM test01;

-- 나는 아직까지 프로시져를 모른다. 그렇다면 위처럼 sample데이터 1000개를 어떻게 넣지?
CREATE TABLE TEST02 (A VARCHAR2(10) PRIMARY KEY, B NUMBER);
SELECT * FROM test02;
SELECT LEVEL lev FROM dual CONNECT BY LEVEL <=1000;

SELECT LPAD(LEVEL, 5, '0'), LEVEL FROM dual CONNECT BY LEVEL <=1000; -- 넣을 데이터 1000개 구경

INSERT INTO test02 SELECT LPAD(LEVEL, 5, '0'), LEVEL FROM dual CONNECT BY LEVEL <=1000; -- 인서트

SELECT count(*) FROM test02;
SELECT * FROM test02;


-- 부등호 조인을 이용한 누계 구하기
SELECT 
	A.A, A.B, B.B
FROM 
	test01 A, test02 B
WHERE 
	B.A <= A.A AND A.A <= '00010'
ORDER BY 
	1; -- 1을 기준으로 1개 2를 기준으로 2개 ......

SELECT 
	A.A, A.B, SUM(B.B) "누계" -- 그놈의 합계만 구하면 누계가 된다.
FROM 
	test01 A, test02 B
WHERE 
	B.A <= A.A AND A.A <= '00020'
GROUP BY 
	A.A, A.B
ORDER BY 
	1;

-- In LINE VIEW를 이용하 누계구하기
SELECT rownum cnt , B FROM test01 WHERE A<='00010'; -- 10개

SELECT 
	DECODE(jcnt, 1, rcnt, rcnt-1+jcnt), B, jcnt
FROM 
	(SELECT rownum rcnt , B FROM test01 WHERE A<='00010') R1,
	(SELECT rownum jcnt FROM test01 WHERE A<='00010') R2;


SELECT 
	DECODE(jcnt, 1, rcnt, rcnt-1+jcnt), B, jcnt
FROM 
	(SELECT rownum rcnt , B FROM test01 WHERE A<='00010') R1,
	(SELECT rownum jcnt FROM test01 WHERE A<='00010') R2,
	(SELECT count(*) MAX_CNT FROM test01 WHERE A<='00010') R3
WHERE 
	DECODE(jcnt, 1, rcnt, rcnt-1+jcnt)<=MAX_CNT; -- 55개

SELECT 
	R_CNT 번호, SUM(B) 누계
FROM
	(
	SELECT 
		DECODE(jcnt, 1, rcnt, rcnt-1+jcnt) R_CNT, B, jcnt
	FROM 
		(SELECT rownum rcnt , B FROM test01 WHERE A<='00010') R1,
		(SELECT rownum jcnt FROM test01 WHERE A<='00010') R2,
		(SELECT count(*) MAX_CNT FROM test01 WHERE A<='00010') R3
	WHERE 
		DECODE(jcnt, 1, rcnt, rcnt-1+jcnt)<=MAX_CNT	
	)
GROUP BY 
	R_CNT
ORDER BY 
	R_CNT;

-- 오라클 8버전 이후로 분석용함수를 사용가능하다.
-- 분석용 함수를 이용하여 누계를 구하면
SELECT a, b FROM test01;
SELECT a, b, sum(b) OVER (ORDER BY b) FROM test01;


-- 실습 테이블 생성
CREATE TABLE A_TB (
          A_MON VARCHAR2(06) PRIMARY KEY,
          A_OUT  NUMBER );
INSERT INTO A_TB VALUES ('200101',1900000);
INSERT INTO A_TB VALUES ('200102',2000000);
INSERT INTO A_TB VALUES ('200103',1500000);
INSERT INTO A_TB VALUES ('200104',1100000);
INSERT INTO A_TB VALUES ('200105',2100000);
INSERT INTO A_TB VALUES ('200106',1600000);
INSERT INTO A_TB VALUES ('200107',1400000);
INSERT INTO A_TB VALUES ('200108',1700000);
INSERT INTO A_TB VALUES ('200109',1900000);
INSERT INTO A_TB VALUES ('200110',1000000);
INSERT INTO A_TB VALUES ('200111',1700000);
INSERT INTO A_TB VALUES ('200112',1300000);
COMMIT; 

SELECT * FROM A_TB;
SELECT count(*) FROM A_TB;

-- 월별 누계를 구해보자
SELECT A_MON, A_OUT , sum(A_OUT) OVER (ORDER BY A_MON) FROM A_TB;

-- 분기별 누계를 구해와!!!!
SELECT A_MON , to_char(TO_date(A_MON,'YYYYMM'), 'Q') 분기 FROM A_TB at2 ;
SELECT 
	A_MON, A_OUT , 
	sum(A_OUT) OVER (PARTITION BY to_char(TO_date(A_MON,'YYYYMM'), 'Q') 
	                 ORDER BY TO_date(A_MON,'YYYYMM') RANGE INTERVAL '2' MONTH PRECEDING) "분기별누계" 
FROM 
	A_TB;

-- temp 테이블에서 부서별 급여 합계, 누적합계를 조회 하시오
SELECT 
	DEPT_CODE , SALARY ,
	--SUM(SALARY) OVER () "전체합",
	--SUM(SALARY) OVER (PARTITION BY DEPT_CODE) "부서별 급여합계",
	SUM(SALARY) OVER (PARTITION BY DEPT_CODE ORDER BY SALARY) "부서별 누적합계",
	SUM(SALARY) OVER (ORDER BY DEPT_CODE , SALARY DESC) "누적합계"
FROM 
 	TEMP t;

 -- temp 테이블에서 직급별 급여 누적 합계, 전체 누적 합계를 조회 하시오
SELECT 
	LEV , SALARY ,
	SUM(SALARY) OVER (PARTITION BY LEV ORDER BY SALARY) "직급별 누적합계",
	SUM(SALARY) OVER (ORDER BY SALARY, LEV) "누적합계"
FROM 
 	TEMP t;

SELECT 
	LEV , SALARY ,
	SUM(SALARY) OVER (PARTITION BY LEV ORDER BY SALARY) "직급별 누적합계",
	SUM(SALARY) OVER (ORDER BY LEV) "누적합계"
FROM 
 	TEMP t
WHERE 
	LEV='수습';


-- =========================================
-- 8장 바로 이전 레코드 값을 참조하고자 할때
-- =========================================
-- 실습 테이블 작성
DROP TABLE test02;
--                   날짜, 환전금액, 환율  
CREATE TABLE TEST02 (CDATE VARCHAR2(10) PRIMARY KEY,AMT NUMBER,CRATE NUMBER);
INSERT INTO TEST02 VALUES ('20010901',11500,  1350);
INSERT INTO TEST02 VALUES ('20010903',12300,  1330);
INSERT INTO TEST02 VALUES ('20010904',10900,  1390);
INSERT INTO TEST02 VALUES ('20010905',13200,  1310);
INSERT INTO TEST02 VALUES ('20010906',10800,  1350);
INSERT INTO TEST02 VALUES ('20010907',11100,  1360);
INSERT INTO TEST02 VALUES ('20010908',10600,  1340);
INSERT INTO TEST02 VALUES ('20010910',11900,  1300);
INSERT INTO TEST02 VALUES ('20010911',12000,  1290);
COMMIT;
SELECT * FROM test02;

-- 현재일자 금액에 전일 환율을 곱합 환산 금액을 알고 싶다.
SELECT ROWNUM, CDATE, AMT FROM TEST02 WHERE CDATE BETWEEN '20010904' AND '20010910';
SELECT ROWNUM MCNT, CDATE, AMT, CRATE FROM TEST02 WHERE CDATE BETWEEN '20010904' AND '20010910';
SELECT ROWNUM SCNT, CDATE, AMT, CRATE FROM TEST02 WHERE CDATE BETWEEN '20010904' AND '20010910';

SELECT 
	T1.CDATE 일자,T1.AMT 금액, T1.CRATE 환율, T1.AMT*T2.CRATE 환산금액
FROM 
	(SELECT ROWNUM MCNT, CDATE, AMT, CRATE FROM TEST02 WHERE CDATE BETWEEN '20010904' AND '20010910') T1,
	(SELECT ROWNUM SCNT, CDATE, AMT, CRATE FROM TEST02 WHERE CDATE BETWEEN '20010904' AND '20010910') T2
WHERE 
	T2.SCNT = T1.MCNT-1;


-- test02를 이용하여 해당일자보다 작거나 같은날의 환율을 순서대로 6개까지 보여주는 쿼리를 만들어라
SELECT 
	T1.CDATE 일자,T1.AMT 금액, T1.CRATE 환율
FROM 
	(SELECT ROWNUM MCNT, CDATE, AMT, CRATE FROM TEST02 WHERE CDATE BETWEEN '20010904' AND '20010910') T1,
	(SELECT ROWNUM SCNT, CDATE, AMT, CRATE FROM TEST02 WHERE CDATE BETWEEN '20010904' AND '20010910') T2
WHERE 
	T2.SCNT <= T1.MCNT-1;


SELECT 
	T1.CDATE 일자,T1.AMT 금액, T1.CRATE 환율,
	MAX(DECODE(MCNT, SCNT+1, T2.CRATE)) "D-1",
	MAX(DECODE(MCNT, SCNT+2, T2.CRATE)) "D-2",
	MAX(DECODE(MCNT, SCNT+3, T2.CRATE)) "D-3",
	MAX(DECODE(MCNT, SCNT+4, T2.CRATE)) "D-4",
	MAX(DECODE(MCNT, SCNT+5, T2.CRATE)) "D-5"
FROM 
	(SELECT ROWNUM MCNT, CDATE, AMT, CRATE FROM TEST02 WHERE CDATE BETWEEN '20010904' AND '20010910') T1,
	(SELECT ROWNUM SCNT, CDATE, AMT, CRATE FROM TEST02 WHERE CDATE BETWEEN '20010904' AND '20010910') T2
WHERE 
	T2.SCNT <= T1.MCNT-1
GROUP BY 
	T1.CDATE, T1.AMT, T1.CRATE 
ORDER BY 
	T1.CDATE;

-- 함수를 이용하여 해결해 보자
-- LAG가 있다
-- 테이블 자체를 조인하지 않고 한 번에 테이블에서 둘 이상의 행을 쿼리 할 수있는 분석 함수입니다. 
-- 테이블의 이전 행에서 값을 리턴합니다. 
-- 다음 행에서 값을 반환하려면 LEAD 함수를 사용해보십시오 .

-- 현재일자 금액에 전일 환율을 곱합 환산 금액을 알고 싶다.(LAG함수 사용)
SELECT 
	CDATE 일자, AMT 금액, CRATE 환율,LAG(CRATE,1) OVER (ORDER BY CDATE) 환율2,
	AMT*LAG(CRATE,1) OVER (ORDER BY CDATE) 환산금액
FROM 
	TEST02 
WHERE 
	CDATE BETWEEN '20010904' AND '20010910';

-- test02를 이용하여 해당일자보다 작거나 같은날의 환율을 순서대로 6개까지 보여주는 쿼리를 만들어라
-- LAG 함수 이용
SELECT 
	CDATE 일자, AMT 금액, CRATE 환율,
	LAG(CRATE, 1) OVER  (ORDER BY CDATE)  "D-1",
	LAG(CRATE, 2) OVER  (ORDER BY CDATE)  "D-2",
	LAG(CRATE, 3) OVER  (ORDER BY CDATE)  "D-3",
	LAG(CRATE, 4) OVER  (ORDER BY CDATE)  "D-4",
	LAG(CRATE, 5) OVER  (ORDER BY CDATE)  "D-5"
FROM 
	TEST02 
WHERE 
	CDATE BETWEEN '20010904' AND '20010910';

-- 위의 문제를 변형하여 이후 일자의 환율을 가져오는 쿼리로 변경하시오
SELECT 
	CDATE 일자, AMT 금액, CRATE 환율,
	LEAD(CRATE, 1) OVER  (ORDER BY CDATE)  "D+1",
	LEAD(CRATE, 2) OVER  (ORDER BY CDATE)  "D+2",
	LEAD(CRATE, 3) OVER  (ORDER BY CDATE)  "D+3",
	LEAD(CRATE, 4) OVER  (ORDER BY CDATE)  "D+4",
	LEAD(CRATE, 5) OVER  (ORDER BY CDATE)  "D+5"
FROM 
	TEST02 
WHERE 
	CDATE BETWEEN '20010904' AND '20010910';




