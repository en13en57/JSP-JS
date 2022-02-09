package kr.green.struts2;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Namespaces;
import org.apache.struts2.convention.annotation.Result;

import lombok.Data;


// Action클래스를 순수 POJO(Plain Object Java Object)로 만들어도 상관없다.
@Namespaces(value = {@Namespace("/User"), @Namespace("/")}) // 경로지정
@Action(value = "login2", results= {
		@Result(name = "success", location = "/WEB-INF/views/welcome.jsp"),
		@Result(name = "error", location = "/WEB-INF/views/error.jsp")
}) 
@Data
public class Login2Action {
	
	private String name;
	private String password;
	
	public String execute() throws Exception{
		if("root".equals(getName()) && "root".equals(getPassword()))
		return "success";
		else return "error";
	}
}
