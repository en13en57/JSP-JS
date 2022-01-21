drop table category;

-- 답변형 로직 구현하기
create table category(
	idx int primary key auto_increment, 
	ref int default 0, -- 조상의 부모
	seq int default 0, -- 조상별 나타날 순서
	lev int default 0, -- 몇단계 
	item varchar(50) not null, -- 항목
	del char(1) check(del in ('Y','N')) -- 사용여부로 0 또는 1 만 저장 가능하다.
);

-- 원본글 2개를 넣어보자
insert into category 
(ref,item,del)
values
(1,'전자제품','Y'),
(2,'주류제품','Y');

select * from category;
select * from category order by idx desc ;

-- 주류에 소주를 추가해보자
insert into category 
(ref,seq,lev,item,del)
values
(2,1,1,'소주','Y'); -- ref는 그대로 seq, lev는 원본의 값 +1 해서 넣는다.

select * from category order by idx desc ; -- 이렇게 가져오면 안된다
select * from category order by ref desc, seq ;

-- 새로운 답변을 위로 넣기 위해서는 seq가 나보다 큰값들을 모두 +1해서 변경 후 추가한다.
update category set seq=seq+1 where ref=2 and seq>0;
insert into category 
(ref,seq,lev,item,del)
values
(2,1,1,'양주','Y');

-- 전자 제품의 자식으로 청소기와 세탁기를 넣고
-- 세탁기 밑에는 LG,삼성 청소기 밑에는 다이슨,LG를 넣어 차례대로 보이게 해보자
insert into category (ref, seq, lev, item, del) values (1, 1, 1, '청소기','Y'); -- 청소기 넣기
select * from category order by ref desc, seq ;

update category set seq=seq+1 where ref=1 and seq>0;
insert into category (ref, seq, lev, item, del) values (1, 1, 1, '세탁기','Y'); -- 세탁기 넣기
select * from category order by ref desc, seq ;

-- LG를 세탁기 밑에 넣어보자
update category set seq=seq+1 where ref=1 and seq>1;
insert into category (ref, seq, lev, item, del) values (1, 2, 2, 'LG','Y'); -- LG 넣기
select * from category order by ref desc, seq ;

-- 삼성를 세탁기 밑에 넣어보자
update category set seq=seq+1 where ref=1 and seq>1;
insert into category (ref, seq, lev, item, del) values (1, 2, 2, '삼성','Y'); -- 삼성 넣기
select * from category order by ref desc, seq ;

-- 다이슨을 청소기 밑에 넣어보자
update category set seq=seq+1 where ref=1 and seq>4;
insert into category (ref, seq, lev, item, del) values (1, 5, 2, '다이슨','Y'); -- 다이슨 넣기
select * from category order by ref desc, seq ;

-- LG를 청소기 밑에 넣어보자
update category set seq=seq+1 where ref=1 and seq>4;
insert into category (ref, seq, lev, item, del) values (1, 5, 2, 'LG','Y'); -- LG 넣기
select * from category order by ref desc, seq ;

-- 여기에 새로운 대항목을 넣는다고 가상해보자!
-- ref에 넣을 값을 확인 해 주어야 한다.
-- 1. 일단 ref를 빼고 넣는다.
insert into category(item,del) values ('의류','Y');
-- 2. 마지막 삽입된 글 번호를 구한다.
select max(idx) from category ;
-- 3. 2에서 구한 글 번호를 ref값으로 넣는다. (서브쿼리)
update category set ref = (select max(idx) from category) where idx = (select max(idx) from category);
select * from category order by ref desc, seq ;

insert into category(item,del) values ('컴퓨터','Y');
update category set ref = (select max(idx) from category) where idx = (select max(idx) from category);
select * from category order by ref desc, seq ;

delete from category ;

select count(*) from category where ref = 46 and seq>0; -- 6개 -- 이것은 맞지만
select count(*) from category where ref = 46 and seq>0; -- 5개 -- 이것은 틀리다.

-- 그래서 위의 명령은 사용불가.
select * from category where ref = 21 and seq>1 and lev=1;
select seq from category where ref = 21 and seq>1 and lev=1;
-- 탁주의 자식들만
select * from category where ref = 21 and seq>1 and seq<(select seq from category where ref = 21 and seq>1 and lev=1);
select * from category order by ref desc, seq ;
-- 소주의 자식들만
select * from category where ref = 21 and seq>4 and seq<(select seq from category where ref = 21 and seq>1 and lev=1);







