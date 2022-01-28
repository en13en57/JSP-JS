package kr.green.cal.vo;


import lombok.Data;

/*
create table calendar(
	id number primary key,
	groupId NUMBER,
	title varchar2(50),
	writer varchar2(50),
	content varchar2(1000),
	start1 date,
	end1 date,
	allDay number(1),
	textColor varchar(50),
	backgroundColor varchar2(50),
	borderColor varchar2(50)
);
*/

@Data
public class CalendarVO {
	private int id;
	private String groupId;
	private String title;
	private String writer;
	private String content;
	private String start;
	private String end;
	private boolean allday;
	private String textColor;
	private String backgroundColor;
	private String borderColor;
}

