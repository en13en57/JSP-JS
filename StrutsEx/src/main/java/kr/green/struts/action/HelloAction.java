package kr.green.struts.action;

import com.opensymphony.xwork2.ActionSupport;

import kr.green.struts.vo.MessageVO;
import lombok.Data;

@Data
public class HelloAction extends ActionSupport{
	private MessageVO messageVO;

	@Override
	public String execute() throws Exception {
		messageVO = new MessageVO();
		messageVO.setName("한사람");
		messageVO.setAge(22);
		return SUCCESS;
	}
	
	
}
