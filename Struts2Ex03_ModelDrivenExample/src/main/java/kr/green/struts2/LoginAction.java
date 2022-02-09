package kr.green.struts2;

import kr.green.struts2.vo.UserVO;
import lombok.Data;

@Data
public class LoginAction {

	private UserVO userVO;
	
	public String execute() throws Exception {
		if ("admin".equals(userVO.getUserID()) && "admin".equals(userVO.getPassword())) {
			userVO.setUserName("최고관리자");
			return "success";
		}else {
			return "input";
		}
	}

}
