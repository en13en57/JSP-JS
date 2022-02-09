package kr.green.struts2;

import com.opensymphony.xwork2.Action;

import lombok.Data;

@Data
public class LoginAction implements Action {

	private String name;
	private String password;
	
	@Override
	public String execute() throws Exception {
		if("admin".equals(getName()) && "admin".equals(getPassword()))
		return SUCCESS;
		else return ERROR;
	}

}
