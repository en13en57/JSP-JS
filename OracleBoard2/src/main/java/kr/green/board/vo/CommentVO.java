package kr.green.board.vo;

import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

/*
 * CREATE TABLE board_comment(
	idx NUMBER PRIMARY KEY,
	REF number NOT NULL, -- 원본 글 번호
	name varchar2(100) NOT NULL,
	password varchar2(100) NOT NULL,
	content varchar2(2500) NOT NULL,
	regdate timestamp DEFAULT sysdate,
	ip varchar2(20) NOT NULL
);

 */

@XmlRootElement
@Data
public class CommentVO {
	private int idx;
	private int ref;
	private String name;
	private String password;
	private String content;
	private Date regDate;
	private String ip;
	
}
