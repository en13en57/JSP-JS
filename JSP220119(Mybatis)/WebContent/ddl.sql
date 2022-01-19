-- 자유 게시판 테이블 작성
create table board3(
	idx int primary key auto_increment,
	name varchar(30) not null,
	password varchar(50) not null,
	subject varchar(100) not null,
	content text not null,
	hit int default 0,
	regDate timestamp default now(),
	ip varchar(15) not null
);
desc board3;
select * from board3;

-- 댓글 테이블
create table comment(
	idx int primary key auto_increment,
	ref int not null, -- 원본글 번호
	name varchar(30) not null,
	password varchar(50) not null,
	content text not null,
	hit int default 0,
	regDate timestamp default now(),
	ip varchar(15) not null,
	FOREIGN KEY(ref) REFERENCES board3(idx) -- 외래키 지정
);
desc comment;
select * from comment;
drop table comment;
-- 샘플데이터를 넣어보자
insert into board3 (name,password,subject,content,ip) values
('주인장', password('1234'), '자유게시판1', '내용입니다.', '192.168.123.234'),
('나그네', password('1234'), '자유게시판2', '내용좋구나.', '192.168.123.234'),
('지나는이', password('1234'), '자유게시판3', '내용좋아.', '192.168.123.234');
select * from board3;

insert into comment (ref, name, password, content, ip) values
(1, '나야나', password('1234'),'와 1빠', '192.168.555.555'),
(2, '너구나', password('1234'),'와 1빠', '192.168.555.555'),
(1, '한사람', password('1234'),'와 2빠에요', '192.168.555.555'),
(1, '두사람', password('1234'),'와 3빠~~~', '192.168.555.555');

select * from comment;
select * from comment where ref=1; -- 1번댓글
select * from comment where ref=2; -- 2번댓글
select * from comment where ref=3; -- 3번댓글
