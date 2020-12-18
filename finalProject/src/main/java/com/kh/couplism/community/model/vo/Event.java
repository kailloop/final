package com.kh.couplism.community.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@Builder
@NoArgsConstructor
public class Event {
	private int eventNo;
	private String eventTitle;
	private String eventWriter;
	private String eventContent;
	private String eventOriginalFilename;
	private String eventRenamedFilename;
	private int couponPrice;
}
