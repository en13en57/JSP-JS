package kr.green.memo.vo;

import java.util.Date;

import lombok.Data;

/*
    create table memo (
   		idx int primary key auto_increment,
   		name varchar(30) not null,
   		password varchar(30) not null,
   		content  text not null,
   		regDate  timestamp default now(),
   		ip varchar(20) not null
   );  
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
