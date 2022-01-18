package kr.green.ajax.vo;

import javax.xml.bind.annotation.XmlRootElement;
import lombok.Data;

@XmlRootElement
@Data
public class HanjaVO {
	private int index;
	private String h;
	private String k;
}
