drop table board_table;
create table board_table(
	idx int primary key auto_increment, 
	name varchar(60) not null
);

drop table if exists comment_table;
create table if not exists comment_table(
	idx int primary key auto_increment, 
	ref int, 
	hobby varchar(100) not null,
	FOREIGN KEY(ref) REFERENCES board_table(idx)	
	-- 이 테이블의 외래키는 ref이고, board_table 테이블의 idx 와 연결
);

drop table if exists comment_table2;
create table if not exists comment_table2(
	idx int primary key auto_increment, 
	ref int, 
	hobby varchar(100) not null,
	constraint FK_board_idx_comment_ref FOREIGN KEY(ref) REFERENCES board_table(idx)
	-- 외래키의 이름을 "FK_기준테이블명_외래키있는테이블명"으로 저장하면 이름만으로 확인가능
	-- 이 테이블의 외래키는 ref이고, board_table 테이블의 idx 와 연결
);

select * from information_schema.table_constraints where table_name = 'comment_table';	-- 테이블 정보확인
select * from information_schema.table_constraints where table_name = 'comment_table2';	-- 테이블 정보확인
-- ==================================================================

insert into board_table (name) 
values
('한사람'),('두사람'),('세사람');

select * from board_table;


insert into comment_table (ref,hobby) values 
(1,'독서'),(2,'독서'),(3,'잠자기');

select * from comment_table;
insert into comment_table (ref,hobby) values (4,'고성방가'); -- 에러 : 없는 키 삽입
select * from comment_table;

delete from board_table where idx = 1; -- 에러 : 참조값이 있는데 삭제 
select * from board_table;
-- ==================================================================

drop table if exists comment_table3;
create table if not exists comment_table3(
	idx int primary key auto_increment, 
	ref int, 
	hobby varchar(100) not null
);

-- 작성 후 외래키 추가하기
ALTER TABLE comment_table3	-- 테이블 수정
    ADD CONSTRAINT FK_board_idx_comment3_ref 	-- 제약조건 추가. 외래키 이름을 설정
    FOREIGN KEY (ref) 	-- 외래키 제약조건을 ref에 설정
    REFERENCES board_table(idx);	-- 참조할 기준 테이블은 board_table 테이블의 idx 열로 설정

select * from information_schema.table_constraints where table_name = 'comment_table3';	-- 테이블 정보확인

ALTER TABLE comment_table3
	DROP FOREIGN KEY FK_board_idx_comment3_ref; -- (외래키명) 외래 키 제거

select * from information_schema.table_constraints where table_name = 'comment_table3';	-- 테이블 정보확인

ALTER TABLE comment_table3
	ADD CONSTRAINT FK_board_idx_comment3_ref
	FOREIGN KEY (ref)
	REFERENCES board_table(idx)
	ON UPDATE CASCADE;	-- 기준 테이블의 참조된 기본키값이 변경 시 comment_table3의  ref 값도 함께 변경

select * from information_schema.table_constraints where table_name = 'comment_table3';	-- 테이블 정보확인

insert into board_table (name) values ('추가인');	
	
insert into comment_table3 (ref,hobby) values (4,'술마시기');

select * from board_table;
select * from comment_table3;

select name, hobby from board_table b, comment_table3 c where b.idx=c.ref;

update board_table set idx=10000 where idx=4;

select * from board_table;
select * from comment_table3;

select name, hobby from board_table b, comment_table3 c where b.idx=c.ref;