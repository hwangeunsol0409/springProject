package org.eunsol.domain;

import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	private String id;
	private String passwd;
	private String name;
	private String birth;
	private String gender;
	private String email;
	private String user_email;
	private String email_address;
	private String phone;
	private String phone1;
	private String phone2;
	private String phone3;
	private String address;
	private String sample6_postcode;
	private String sample6_address;
	private String sample6_detailAddress;
	private String sample6_extraAddress;

	private boolean enabled;
	
	private List<Member_authVO> authList; //여러개 사용자 권한
}
