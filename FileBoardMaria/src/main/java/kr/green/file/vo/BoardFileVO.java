package kr.green.file.vo;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

/*
 * create table boardFile(
		idx int primary key auto_increment,
		ref int not null,
		oriName varchar(100) not null,
		saveName varchar(100) not null
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
