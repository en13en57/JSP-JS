package kr.green.memo.vo;

import lombok.Data;

/*
	{
		"memo" : "와~~ 1빠다~~~",
		"name" : "주인장",
		"password" : "123456",
		"regDate" : "2021-12-27 10:23:45",
		"ip" : "192.168.0.29"
	}
 */
@Data
public class MemoVO {
	private String name;
	private String password;
	private String memo;
	private String regDate;
	private String ip;
}
