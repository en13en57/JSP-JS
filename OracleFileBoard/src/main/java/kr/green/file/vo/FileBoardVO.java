package kr.green.file.vo;

import java.util.Date;
import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

/*
 CREATE TABLE fileboard2(
	idx number PRIMARY KEY,
	name varchar2(50) NOT NULL,
	password varchar2(50) NOT NULL,
	title varchar2(100) NOT NULL,
	content clob NOT NULL,
	regDate timestamp DEFAULT sysdate,
	ip varchar2(15) NOT null
);
  */

@XmlRootElement
@Data
public class FileBoardVO {
	private int idx;
	private String name;
	private String password;
	private String title;
	private String content;
	private Date regDate;
	private String ip;
	
	private List<BoardFileVO> fileList;
}
