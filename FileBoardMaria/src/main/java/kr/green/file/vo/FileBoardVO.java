package kr.green.file.vo;

import java.util.Date;
import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

/*
   create table  fileBoard(
   	idx int primary key auto_increment,
   	name varchar(50) not null,
   	password varchar(50) not null,
   	subject varchar(100) not null,
   	content text not null,
   	regDate timestamp default now(),
   	ip varchar(15) not null
  );
 */
@XmlRootElement
@Data
public class FileBoardVO {
	private int idx;
	private String name;
	private String password;
	private String subject;
	private String content;
	private Date   regDate; 
	private String ip;
	
	private List<BoardFileVO> fileList; // 첨부파일들
}
