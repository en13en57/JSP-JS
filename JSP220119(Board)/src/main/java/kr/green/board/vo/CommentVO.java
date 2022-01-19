package kr.green.board.vo;

import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;


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
