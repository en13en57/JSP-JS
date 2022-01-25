-- 1.	 사원 테이블에서 각 사원에 급여(SAL) 등급을 아래 예제처럼 출력하세요?(급여순위점수(SALGRADE) 테이블 조인)ex) 정렬은 등급(GRADE) 오름차순
SELECT 
	e.EMPNO , e.ENAME,  e.SAL, s.GRADE 
FROM 
	EMP e ,SALGRADE s
WHERE 
	