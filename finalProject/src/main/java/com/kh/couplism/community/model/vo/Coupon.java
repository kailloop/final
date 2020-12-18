package com.kh.couplism.community.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@Builder
@NoArgsConstructor
public class Coupon {
	private int eventNo;
	private String eventTitle;
	private String couponId;
	private int couponPrice;
}
