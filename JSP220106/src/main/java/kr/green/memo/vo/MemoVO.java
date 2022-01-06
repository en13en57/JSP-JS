package kr.green.memo.vo;

import java.util.Date;

import lombok.Data;

/*
 create table memo(
	idx int primary key auto_increment,
	name varchar(20) not null,
	password varchar(20) not null,
	content text not null,
	regdate timestamp default now(),
	ip varchar(15) not null
); 
 VO는 테이블 모양과 1:1 대응 되게 만든다.
 */

@Data
public class MemoVO {
	private int idx;
	private String name;
	private String password;
	private String content;
	private Date regDate;
	private String ip;
	
}
