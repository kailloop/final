package com.kh.couplism.lism.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Lism {
	private int lismNo;
	private String lismTitle;
	private String creator;
	private int LikeCount;
	private String openStatus;
	private Date enrollDate;
	private Date setDate;
	
}
