create table poll(
     idx int primary key auto_increment,
     subject varchar(100) not null, 
     item  text not null, 
     count text not null, 
     startDate varchar(10) not null,
     endDate varchar(10) not null,
     comment text
);
 
 
show tables;

desc poll;

insert into poll values 
(0,'중운이는?','좋은사람@@나쁜사람@@내애인','0@@0@@0','2022-01-01','2022-01-31','');
insert into poll values 
(0,'준모는?','좋은학생@@나쁜학생','0@@0','2022-01-01','2022-01-05','');
  
 