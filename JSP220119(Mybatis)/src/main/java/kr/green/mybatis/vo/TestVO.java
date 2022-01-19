package kr.green.mybatis.vo;

import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;

import lombok.Data;

@XmlRootElement
@Data
public class TestVO {
	private Date today;
	private int result;
}
