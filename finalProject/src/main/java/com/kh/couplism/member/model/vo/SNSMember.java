package com.kh.couplism.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class SNSMember {
	private String email;
	private String nickname;
	private String birthday;
	private String age;
	private Date enrollDate;
}
