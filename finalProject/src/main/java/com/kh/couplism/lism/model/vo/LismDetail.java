package com.kh.couplism.lism.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class LismDetail {
	private int lismNo;
	private int locationNo;
	private String name;
	private Date setTime;
}
