-- testuser는 오라클 명령어 실습을 하기 위한 계정입니다.
-- 한글 1글자 3바이트이다.
DROP TABLE temp;
CREATE TABLE TEMP (
	 EMP_ID      NUMBER PRIMARY KEY,
	 EMP_NAME    VARCHAR2(10) NOT NULL,
	 BIRTH_DATE  DATE,
	 DEPT_CODE   VARCHAR2(06) NOT NULL,
	 EMP_TYPE    VARCHAR2(06),
	 USE_YN      VARCHAR2(01) NOT NULL,
	 TEL         VARCHAR2(15),
	 HOBBY       VARCHAR2(30),
	 SALARY      NUMBER,
	 LEV         VARCHAR2(06)
);

CREATE TABLE TDEPT (
	 DEPT_CODE   VARCHAR2(06) PRIMARY KEY,
	 DEPT_NAME   VARCHAR2(20) NOT NULL,
	 PARENT_DEPT VARCHAR2(06) NOT NULL,
	 USE_YN      VARCHAR2(01) NOT NULL,
	 AREA        VARCHAR2(10),
	 BOSS_ID     NUMBER
);

INSERT INTO TEMP VALUES (19970101,'김길동',TO_DATE('19740125','YYYYMMDD'),'AA0001','정규','Y','','등산',100000000,'부장');
INSERT INTO TEMP VALUES (19960101,'홍길동',TO_DATE('19730322','YYYYMMDD'),'AB0001','정규','Y','','낚시',72000000,'과장');
INSERT INTO TEMP VALUES (19970201,'박문수',TO_DATE('19750415','YYYYMMDD'),'AC0001','정규','Y','','바둑',50000000,'과장');
INSERT INTO TEMP VALUES (19930331,'정도령',TO_DATE('19760525','YYYYMMDD'),'BA0001','정규','Y','','노래',70000000,'차장');
INSERT INTO TEMP VALUES (19950303,'이순신',TO_DATE('19730615','YYYYMMDD'),'BB0001','정규','Y','','',56000000,'대리');
INSERT INTO TEMP VALUES (19966102,'지문덕',TO_DATE('19720705','YYYYMMDD'),'BC0001','정규','Y','','',45000000,'과장');
INSERT INTO TEMP VALUES (19930402,'강감찬',TO_DATE('19720815','YYYYMMDD'),'CA0001','정규','Y','','',64000000,'차장');
INSERT INTO TEMP VALUES (19960303,'설까치',TO_DATE('19710925','YYYYMMDD'),'CB0001','정규','Y','','',35000000,'사원');
INSERT INTO TEMP VALUES (19970112,'연흥부',TO_DATE('19761105','YYYYMMDD'),'CC0001','정규','Y','','',45000000,'대리');
INSERT INTO TEMP VALUES (19960212,'배뱅이',TO_DATE('19721215','YYYYMMDD'),'CD0001','정규','Y','','',39000000,'과장');
--
INSERT INTO TDEPT VALUES ('AA0001','경영지원','AA0001','Y','서울',19940101);
INSERT INTO TDEPT VALUES ('AB0001','재무','AA0001','Y','서울',19960101);
INSERT INTO TDEPT VALUES ('AC0001','총무','AA0001','Y','서울',19970201);
INSERT INTO TDEPT VALUES ('BA0001','기술지원','BA0001','Y','인천',19930301);
INSERT INTO TDEPT VALUES ('BB0001','H/W지원','BA0001','Y','인천',19950303);
INSERT INTO TDEPT VALUES ('BC0001','S/W지원','BA0001','Y','인천',19966102);
INSERT INTO TDEPT VALUES ('CA0001','영업','CA0001','Y','본사',19930402);
INSERT INTO TDEPT VALUES ('CB0001','영업기획','CA0001','Y','본사',19950103);
INSERT INTO TDEPT VALUES ('CC0001','영업1','CA0001','Y','본사',19970112);
INSERT INTO TDEPT VALUES ('CD0001','영업2','CA0001','Y','본사',19960212);
--
COMMIT;

SELECT * FROM	temp;
SELECT * FROM	TDEPT;

-- 연봉을 이용하여 월급을 계산해 보자!!

SELECT 	EMP_NAME 이름 , SALARY 연봉 FROM	temp;

SELECT 	EMP_NAME 이름 , SALARY 연봉, SALARY/18 월급 FROM temp; -- 600%보너스

SELECT 	EMP_NAME 이름 , SALARY 연봉, round(SALARY/18) 월급 FROM temp; -- 600%보너스, round(숫자, 자리수)

SELECT 	EMP_NAME 이름 , SALARY 연봉, round(SALARY/18,-2) 월급 FROM temp; -- 600%보너스 , 자릿수가 음수면 양의 자릿수이다.

-- 홀수달은 100%, 짝수달은 200% 지급하라!!!
SELECT 	EMP_NAME 이름 , SALARY 연봉, round(SALARY/18,-2) "홀수달 월급", round(SALARY/18,-2)*2 "짝수달 월급" FROM temp;

-- 위의 결과에 홀수달은 교통비 10만원추가 짝수달은 교통비 20만원 추가해서 조회하시오.
SELECT 	
	EMP_NAME 이름 , SALARY 연봉, round(SALARY/18,-2) + 100000 "홀수달 월급", round(SALARY/18,-2)*2 + 200000 "짝수달 월급" 
FROM 
	temp;

-- temp테이블에서 취미가 null이 아닌 직원의 목록만 조회하시오
SELECT * FROM temp WHERE HOBBY != NULL; -- 이놈은 안된다.
-- null의 비교는 is null 또는 is not null을 써야 한다.
SELECT * FROM temp WHERE HOBBY IS NOT NULL;
SELECT * FROM temp WHERE HOBBY IS NULL;

-- 취미가 없는 사원의 취미를 "음주" 바꿔서 모두 조회하시오!!!!
SELECT EMP_NAME "이름" , HOBBY "취미" FROM temp;

-- NVL함수 : NVL(변수또는 필드, NULL인 경우가질 값)
SELECT EMP_NAME "이름" , NVL(HOBBY,'음주') "취미" FROM temp;

-- NVL2함수 : NVL2(변수또는 필드, NULL이 아닌 경우 가질값, NULL인 경우가질 값)
SELECT EMP_NAME "이름" , NVL2(HOBBY, HOBBY,'음주') "취미" FROM temp;

-- 취미가 없는 직원의 취미를 등산으로 하여 취미가 등산인 직원의 목록을 보자
SELECT 
	EMP_NAME , HOBBY , NVL(HOBBY,'등산')
FROM 
	TEMP t 
WHERE 
	HOBBY IS NULL
OR HOBBY ='등산';

SELECT 
	EMP_ID , EMP_NAME ,  NVL(HOBBY,'등산') 
FROM 
	TEMP t 
WHERE 
	NVL(HOBBY,'등산') = '등산';

-- 테이블에 별칭 사용
SELECT 
	EMP_ID 사번 , EMP_NAME 이름 , E.DEPT_CODE 부서코드 , D.DEPT_NAME 부서이름 
FROM 
	TEMP E , TDEPT D
WHERE 
	E.DEPT_CODE  = D.DEPT_CODE ;


-- 별칭을 사용하지 않는경우
SELECT 
	EMP_ID 사번 , EMP_NAME 이름 , TEMP.DEPT_CODE 부서코드 , TDEPT.DEPT_NAME 부서이름 
FROM 
	TEMP , TDEPT
WHERE 
	TEMP.DEPT_CODE  = TDEPT.DEPT_CODE ;

-- self join에서는 반드시 별칭을 써야만 한다.

-- ----------------------------------------------------------------
-- 오라클은 auto_increment가 없다 
-- 그렇다면 어떻게 idx값으르 처리할까요?
-- sequence가 있다.

-- CREATE SEQUENCE 시퀀스이름(테이블명_키필드명_idx)

CREATE TABLE test(
	idx NUMBER PRIMARY KEY,
	name varchar2(100) NOT null
);
DELETE FROM test; 
DROP SEQUENCE  test_idx_seq;
CREATE SEQUENCE test_idx_seq;

SELECT test_idx_seq.nextval FROM dual; -- 다음 번호
SELECT test_idx_seq.currval FROM dual; -- 현재 번호
INSERT INTO test VALUES (test_idx_seq.nextval,'한사람');

SELECT * FROM test;

-- ----------------------------------------------------------------
-- 문자 결합 연산자 : ||

SELECT 
	EMP_NAME || '(' || LEV || ')'
FROM 
	TEMP t ;
-- 그런데 ()가 아니다 작은 따옴표로 직급을 나타내고 싶다면 어떻게 해야 할까요?  -- 김길동'부장'

-- 작은 따옴표를 출력하고 싶은 경우는 ''''를 써야 한다.
SELECT 
	EMP_NAME || '''' || LEV || '''', EMP_NAME || '"' || LEV || '"'
FROM 
	TEMP t ;

-- 사용자가 가진 객체들을 확인하고 싶은경우는?
SELECT 	* FROM 	user_objects;
SELECT 	object_name, object_type FROM 	user_objects;

-- 오라클은 테이블을 작성하면 키필드를 기준으로 INDEX가 자동 생성 됩니다. 

-- 권한이 있는 테이블 목록만 보고싶다.
SELECT 	object_name  FROM 	user_objects WHERE object_type='TABLE';
SELECT 	object_name "테이블명" FROM user_objects WHERE object_type='TABLE';
-- 테이블 명을 확인하는 view가 이미 만들어져 있다.
-- view란? 가상테이블로 보이는 모양에 이름을 붙여서 만들어주어 필요시 편하게 불러쓸 수 있는 기능이다.
SELECT * FROM tab;

-- View를 만들려면 권한이 있어야 가능하다. sys 계정에서 권한을 부여해야 한다.
-- View를 만들수 있는 권한 부여 
-- GRANT CREATE VIEW  TO TESTUSER;
CREATE VIEW viewtable AS SELECT object_name "테이블명" FROM user_objects WHERE object_type='TABLE';

SELECT * FROM viewtable;

-- 문자열 결합 연산자를 이용하여 모든테이블을 지우는 명령을 만들어 낼 수 있다.
SELECT 'DROP table ' || 테이블명 || ';' FROM viewtable;

SELECT EMP_ID || '	' || EMP_NAME || '	' || SALARY FROM temp;

--  취미가 있는 사원 중에 직급이 과장인 사람의 사번, 성명, 취미를 조회 하시오
SELECT 
	EMP_ID 사번, EMP_NAME 이름, HOBBY 취미	
FROM 
	TEMP
WHERE 
	LEV ='과장' AND HOBBY IS NOT NULL;

-- 1997년에 입사한 사원
SELECT 
	EMP_ID , EMP_NAME 	
FROM 
	TEMP t
WHERE 
	EMP_ID >= 19970000 AND EMP_ID <19980000;

SELECT 
	EMP_ID , EMP_NAME 	
FROM 
	TEMP t
WHERE 
	EMP_ID BETWEEN 19970000 AND 19980000;

SELECT 
	EMP_ID , EMP_NAME 	
FROM 
	TEMP t
WHERE 
	SUBSTR(EMP_ID,0,4)='1997';

-- SUBSTR 함수 : SUBSTR(문자열, 시작위치, 개수)
SELECT 
	EMP_ID , SUBSTR(EMP_ID,0,4), SUBSTR(EMP_ID,0,3), SUBSTR(EMP_ID,5,2) 월	
FROM 
	TEMP t
WHERE 
	SUBSTR(EMP_ID,0,4)='1997';

-- 이번달이 생일인 직원의 사번, 이름, 생일을 조회하시오!!!
SELECT 
	EMP_NAME , BIRTH_DATE , BIRTH_DATE || '',sysdate,  SUBSTR(BIRTH_DATE, 4, 2), SUBSTR( SYSDATE, 4, 2)
FROM 
	TEMP
WHERE 
	SUBSTR(BIRTH_DATE, 4, 2)=SUBSTR(SYSDATE, 4, 2); 

-- 근속년수가 25년 이상인 사원의 목록
-- EXTRACT 함수 :  EXTRACT(찾는값 from 데이터)
SELECT EXTRACT(YEAR FROM SYSDATE),EXTRACT(MONTH FROM SYSDATE),EXTRACT(DAY FROM SYSDATE)  FROM dual;

SELECT 
	EMP_ID , EMP_ID /10000 입사연도, round(EMP_ID/10000) "입사연도(정수)", 
	EXTRACT(YEAR FROM SYSDATE)-round(EMP_ID/10000) 근속년수
FROM 
	TEMP;

SELECT 
	EMP_ID , EMP_NAME 
FROM 
	TEMP
WHERE 
	EXTRACT(YEAR FROM SYSDATE)-round(EMP_ID/10000) <= 25;
	
-- 나이 계산
SELECT 
	EMP_ID , round(EMP_ID/10000) "입사연도(정수)",
	EXTRACT(YEAR FROM SYSDATE)-round(EMP_ID/10000) 근속년수,
	EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM BIRTH_DATE)+1 나이
FROM 
	TEMP t;
