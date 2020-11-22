package com.kh.couplism.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Member {
	private String id;
	private String password;
	private String nickname;
	private String couple;
	private String phone;
	private String birthday;
	private String gender;
	private String email;
	private String location;
	private Date enrollDate;
	
	
}
