show tables;

create table memo(
	idx int primary key auto_increment,
	name varchar(20) not null,
	password varchar(20) not null,
	content text not null,
	regdate timestamp default now(),
	ip varchar(15) not null
); 

show tables;
desc memo;