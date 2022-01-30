package kr.green.file.vo;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

/*
 create table boardFile2(
		idx number primary key ,
		ref number not null,
		oriName varchar2(100) not null,
		saveName varchar2(100) not NULL
	); 
 */

@XmlRootElement
@Data
public class BoardFileVO {
	private int idx;
	private int ref;
	private String oriName;
	private String saveName;
}
