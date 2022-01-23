
   create table memo (
   		idx int primary key auto_increment,
   		name varchar(30) not null,
   		password varchar(30) not null,
   		content  text not null,
   		regDate  timestamp default now(),
   		ip varchar(20) not null
   );  
 show tables;
 desc memo;
 

INSERT INTO memo 
	(name,password,content, ip) 
VALUES
	('주인장','1234','우앙 1빠다~~~', '192.168.5.28'), 
	('주인장','1234','우앙 2빠다~~~', '192.168.5.28'), 
	('주인장','1234','우앙 3빠다~~~', '192.168.5.28'), 
	('주인장','1234','우앙 4빠다~~~', '192.168.5.28'), 
	('주인장','1234','우앙 5빠다~~~', '192.168.5.28'), 
	('주인장','1234','우앙 6빠다~~~', '192.168.5.28'), 
	('주인장','1234','우앙 7빠다~~~', '192.168.5.28'), 
	('주인장','1234','우앙 8빠다~~~', '192.168.5.28'); 
select count(*) from memo;

delete from memo;

select count(*) from memo;

