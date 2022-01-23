package kr.green.memo.vo;

import java.sql.Date;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

@XmlRootElement
@Data
public class MemoVO {
	private int idx;
	private String name;
	private String password;
	private String content;
	private Date regDate ;
	private String ip;
}
