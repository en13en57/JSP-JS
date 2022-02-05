-- 일정이 저장될 테이블
create table calendar( 
	id number primary key, 
	groupId NUMBER, 
	title varchar2(50), 
	writer varchar2(50), 
	content varchar2(1000), 
	start1 date, 
	end1 date, 
	allDay number(1), 
	textColor varchar(50), 
	backgroundColor varchar2(50), 
	borderColor varchar2(50) 
);
-- id값을 자동으로 넣어줄 시퀀스
create sequence cal_seq start with 1 increment by 1 minvalue 1 maxvalue 99999;

INSERT INTO calendar values(cal_seq.nextval,'','할일title','test', '내용-content',to_date('2022/01/01','YYYY/MM/DD'), to_date('2022/01/03','YYYY/MM/DD'),1,'yellow','navy','navy');
INSERT INTO calendar values(cal_seq.nextval,'','술먹기','test1', '내용-content',to_date('2022/01/11','YYYY/MM/DD'), to_date('2022/01/11','YYYY/MM/DD'),1,'green','pink','navy');
INSERT INTO calendar values(cal_seq.nextval,'','휴가','test2', '내용-content',to_date('2022/01/22','YYYY/MM/DD'), to_date('2022/01/31','YYYY/MM/DD'),1,'blue','silver','navy');

INSERT INTO calendar values(cal_seq.nextval,'','이발','test2', '머리깍기',to_date('2022/01/05 10:30','YYYY/MM/DD HH:MI'), to_date('2022/01/31','YYYY/MM/DD'),0,'red','silver','navy');
INSERT INTO calendar values(cal_seq.nextval,'','청소','test2', '대청소',to_date('2022/01/17 11:00','YYYY/MM/DD HH:MI'), to_date('2022/01/31','YYYY/MM/DD'),0,'blue','silver','navy');


INSERT INTO calendar values(cal_seq.nextval,'','이발2','test2', '머리깍기',to_date('2022/01/05 08:30','YYYY/MM/DD HH:MI'), to_date('2022/01/31','YYYY/MM/DD'),0,'red','silver','navy');
INSERT INTO calendar values(cal_seq.nextval,'','청소2','test2', '대청소',to_date('2022/01/17 10:00','YYYY/MM/DD HH:MI'), to_date('2022/01/31','YYYY/MM/DD'),0,'blue','silver','navy');

COMMIT;
SELECT * FROM CALENDAR;

SELECT 
	id, 
	groupid,
	title, 
	writer,
	content,
	TO_char(start1, 'YYYY-MM-DD"T"HH24:MI:SS') start1, 
	TO_char(end1, 'YYYY-MM-DD"T"HH24:MI:SS') end1, 
	ALLDAY, 
	TEXTCOLOR, 
	BACKGROUNDCOLOR, 
	BORDERCOLOR 
FROM 
	CALENDAR;


