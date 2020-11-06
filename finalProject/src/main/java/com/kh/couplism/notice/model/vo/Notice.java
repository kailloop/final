package com.kh.couplism.notice.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor//매개변수잇는 생성자//
@Builder//
@NoArgsConstructor//기본 생성자*/
public class Notice {
	
	private int noticeNo;
	private String userId;
	private String noticeTitle;
	private String noticeContent;
	private String writeDate;
	private int viewCount;
	
}
