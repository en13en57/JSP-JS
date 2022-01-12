package kr.green.guest.vo;

import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

/*
 create table guestbook(
		idx int primary key auto_increment,
		name varchar(30) not null,
		password varchar(50) not null,
		content text not null,
		regDate timestamp default now(),
		ip varchar(20) not null
		);
 */

@XmlRootElement // JAAXB : xml로 출력할 수 있도록
@Data
public class GuestBookVO {
	private int idx;
	private String name;
	private String password;
	private String content;
	private Date regDate;
	private String ip;
	//수정(2)/삭제(3)/저장(1)을 구분하는 변수 추가
	private int mode;
	
}
