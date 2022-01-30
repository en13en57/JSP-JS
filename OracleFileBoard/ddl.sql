CREATE TABLE fileboard2(
	idx number PRIMARY KEY,
	name varchar2(50) NOT NULL,
	password varchar2(50) NOT NULL,
	title varchar2(100) NOT NULL,
	content clob NOT NULL,
	regDate timestamp DEFAULT sysdate,
	ip varchar2(15) NOT null
);

create table boardFile2(
		idx number primary key ,
		ref number not null,
		oriName varchar2(100) not null,
		saveName varchar2(100) not NULL
	);
create sequence board_seq
	start with 1
	increment by 1
	minvalue 1
	maxvalue 99999;


