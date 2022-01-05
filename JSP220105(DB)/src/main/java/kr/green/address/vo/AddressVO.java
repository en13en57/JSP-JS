package kr.green.address.vo;

import java.util.Date;

import lombok.Data;
/*

 테이블 1개당 최소 1개의 VO를 만들어라
 필드명과 필드타입을 일치하게 만들어라
 
*/

@Data
public class AddressVO {
	private int idx;
	private String name;
	private Date birth;
	private String phone;
	
}
