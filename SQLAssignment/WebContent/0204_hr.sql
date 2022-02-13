-- HR계정입니다.
SELECT * FROM EMPLOYEES;
SELECT count(*) FROM EMPLOYEES;

-- 이름으로 정렬한후 21~30번까지만 조회하는 쿼리를 작성하시오!!!
SELECT FIRST_NAME || ' ' || LAST_NAME 이름 FROM EMPLOYEES ORDER BY LAST_NAME; 

-- 원하는 범위의 행만 가져오는 쿼리

SELECT 
	rownum rnum, Q.*
FROM 
	(SELECT FIRST_NAME || ' ' || LAST_NAME 이름 FROM EMPLOYEES ORDER BY LAST_NAME) Q -- 정렬한다.
WHERE 
	rownum<=30; -- 뒷자리 잘라낸다.

SELECT 
	R.*
FROM 
	(
	SELECT 
		rownum rnum, Q.*
	FROM 
		(SELECT FIRST_NAME || ' ' || LAST_NAME 이름 FROM EMPLOYEES ORDER BY LAST_NAME) Q -- 정렬한다.
	WHERE 
		rownum<=30
	) R
WHERE 
	rnum>=21; -- 앞자리 잘라낸다.
	
	
	
	
	