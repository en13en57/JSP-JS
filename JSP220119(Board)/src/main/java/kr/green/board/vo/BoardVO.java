package kr.green.board.vo;

import java.util.Date;
import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

/*
 create table board3(
	idx int primary key auto_increment,
	name varchar(30) not null,
	password varchar(50) not null,
	subject varchar(100) not null,
	content text not null,
	hit int default 0,
	regDate timestamp default now(),
	ip varchar(15) not null
);
 */

@XmlRootElement
@Data
public class BoardVO {
	private int idx;
	private String name;
	private String password;
	private String subject;
	private String content;
	private int hit;
	private Date regDate;
	private String ip;
	
	// 추가로 2개를 넣자 : 댓글의 개수, 댓글의 내용
	private int commentCount;
	private List<CommentVO> commentList;
	
}
