package kr.green.struts2;

import lombok.Data;


// Action클래스를 순수 POJO(Plain Object Java Object)로 만들어도 상관없다.
@Data
public class Login2Action {
	
	private String name;
	private String password;
	
	public String login() throws Exception{
		if("root".equals(getName()) && "root".equals(getPassword()))
		return "success";
		else return "error";
	}
}
