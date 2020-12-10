package com.kh.couplism.anniversary.model.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Calendar {
	private int calendarNo;
	private String calendarTitle;
	private String calendarWriter;
	private String calendarStart;
	private String calendarEnd;
}
