package kr.green.category.vo;

import lombok.Data;

/*
 create table category(
	idx int primary key auto_increment, 
	ref int default 0, -- 조상의 부모
	seq int default 0, -- 조상별 나타날 순서
	lev int default 0, -- 몇단계 
	item varchar(50) not null, -- 항목
	del char(1) check(del in ('Y','N')) -- 사용여부로 0 또는 1 만 저장 가능하다.
);
 */

@Data
public class CategoryVO {	
	private int idx;
	private int ref;
	private int seq;
	private int lev;
	private String item;
	private String del;
}
