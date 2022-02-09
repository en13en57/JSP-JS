package kr.green.struts2;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Namespaces;
import org.apache.struts2.convention.annotation.Result;

import lombok.Data;


@Namespaces(value = {@Namespace("/User"), @Namespace("/")}) // 경로지정
@Action(value = "login", results= {
		@Result(name = "success", location = "/WEB-INF/views/welcome.jsp"),
		@Result(name = "error", location = "/WEB-INF/views/error.jsp")
}) // 결과 지정
@Data
public class LoginAction {

	private String name;
	private String password;
	
	public String execute() throws Exception {
		if("admin".equals(getName()) && "admin".equals(getPassword()))
		return "success";
		else return "error";
	}

}
