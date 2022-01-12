select password('1234'), length(password('1234'));
	create table guestbook(
		idx int primary key auto_increment,
		name varchar(30) not null,
		password varchar(50) not null,
		content text not null,
		regDate timestamp default now(),
		ip varchar(20) not null
		);
desc guestbook;

-- 샘플로 데이터를 3개만 넣어보자
insert into guestbook 
	(name,password,content,ip)
values
	('주인장', password('1234'), '방명록입니다.','192.168.0.55'),
	('나그네', password('1234'), '방명록이넹','192.168.0.55'),
	('역마살', password('1234'), '방명록신기하넹','192.168.0.55');
select *from guestbook;
-- 비번이 암호화 되어 다음과 같이 하면 비번이 틀려서 가져오지 못한다.
select * from guestbook where idx=53 and password = '1234';
-- 다음과 같이해야 데이터를 가져온다.
select * from guestbook where idx=53 and password = password('1234');
-- 가져오는 개수를 세면 암호 일치 여부를 알 수 있다.
-- 1이면 존재
select count(*) from guestbook where idx=53 and password = password('1234');
-- 0이면 존재x 
select count(*) from guestbook where idx=53 and password = password('12345');
delete from guestbook;
select * from guestbook;