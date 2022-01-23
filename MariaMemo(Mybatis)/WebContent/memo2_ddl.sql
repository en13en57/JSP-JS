drop table memo2;
create table memo2(
	idx int primary key auto_increment,
	name varchar(20) not null,
	password varchar(20) not null,
	content text not null,
	regDate timestamp default now(),
	ip varchar(15) not null
);
show tables;
desc memo2;

insert into memo2
	(name,password,content,ip)
values
	('주인장1', '1234', '안녕하세요1', '192.168.0.1'),
	('주인장2', '1234', '안녕하세요2', '192.168.0.2'),
	('주인장3', '1234', '안녕하세요3', '192.168.0.3'),
	('주인장4', '1234', '안녕하세요4', '192.168.0.4'),
	('주인장5', '1234', '안녕하세요5', '192.168.0.5');
select * from memo2;