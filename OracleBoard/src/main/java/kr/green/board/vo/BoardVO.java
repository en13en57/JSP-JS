package kr.green.board.vo;

import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

/*
 * CREATE TABLE board(
	idx NUMBER PRIMARY KEY,
	name varchar2(100) NOT NULL,
	password varchar2(100) NOT NULL,
	subject varchar2(1000) NOT NULL,
	content varchar2(2500) NOT NULL,
	regdate timestamp DEFAULT sysdate,
	ip varchar2(20) NOT NULL,
	hit NUMBER DEFAULT 0
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
	private Date regDate;
	private String ip;
	private int hit;
}
