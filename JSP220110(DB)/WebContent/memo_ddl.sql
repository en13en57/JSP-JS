drop table memo;
show tables;
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
 
INSERT INTO memo (name, password, content, ip)
VALUES ('주인장', '1234', '우왕1', '192.168.5.28'),
	   ('주인장', '1234', '우왕2', '192.168.5.28'),
	   ('주인장', '1234', '우왕3', '192.168.5.28'),
	   ('주인장', '1234', '우왕4', '192.168.5.28'),
	   ('주인장', '1234', '우왕5', '192.168.5.28'),
	   ('주인장', '1234', '우왕6', '192.168.5.28'),
	   ('주인장', '1234', '우왕7', '192.168.5.28'),
	   ('주인장', '1234', '우왕8', '192.168.5.28');
select count(*) from memo;
delete from memo;
