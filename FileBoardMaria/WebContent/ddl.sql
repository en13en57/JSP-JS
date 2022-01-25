create table fileBoard(
		idx int primary key auto_increment,
		name varchar(50) not null,
		password varchar(50) not null,
		subject varchar(100) not null,
		content text not null,
		regDate timestamp default now(),
		ip varchar(15) not null
	);
	
create table boardFile(
		idx int primary key auto_increment,
		ref int not null,
		oriName varchar(100) not null,
		saveName varchar(100) not null
	);
	select  * from fileboard ;
	select  * from boardFile ;
	
show tables;

select * from board;
select max(idx), min(idx), sum(idx), avg(idx) from board;

insert into fileboard 
	(name, password, subject, content, ip)
values
	('주인장1', '1234', '나 제목1', '난 내용1', '123.456.789.012'),
	('주인장2', '1234', '나 제목2', '난 내용2', '123.456.789.012'),
	('주인장3', '1234', '나 제목3', '난 내용3', '123.456.789.012'),
	('주인장4', '1234', '나 제목4', '난 내용4', '123.456.789.012'),
	('주인장5', '1234', '나 제목5', '난 내용5', '123.456.789.012'),
	('주인장6', '1234', '나 제목6', '난 내용6', '123.456.789.012');