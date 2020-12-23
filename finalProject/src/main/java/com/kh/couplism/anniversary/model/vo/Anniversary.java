package com.kh.couplism.anniversary.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Anniversary {
	private int anniversaryNo;
	private int locationNo;
	private int anniversaryStatus;
	private int anniversaryPrice;
	private String anniversaryDate;
	private String anniversaryType;
}
