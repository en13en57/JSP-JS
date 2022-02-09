package kr.green.struts2;

import com.opensymphony.xwork2.ModelDriven;

import kr.green.struts2.vo.UserVO;
import lombok.Data;

// VO를 사용하여 데이터를 받으려면 ModelDriven인터페이스를 구현해 줘야 한다.
@Data 
public class LoginModelDrivenAction implements ModelDriven<UserVO>  {
	
	private UserVO userVO = new UserVO(); // 객체 생성하고
	
	@Override
	public UserVO getModel() {
		return userVO; // 생성된 객체를 리턴한다.
	}
	
	public String execute() throws Exception {
		if ("admin".equals(userVO.getUserID()) && "admin".equals(userVO.getPassword())) {
			userVO.setUserName("최고관리자");
			return "success";
		}else {
			return "input";
		}
	}

}
