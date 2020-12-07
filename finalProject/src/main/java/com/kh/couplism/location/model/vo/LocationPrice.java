package com.kh.couplism.location.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@Builder
@NoArgsConstructor
public class LocationPrice {

	private int locationNo;
	private String priceTime;
	private String priceDay;
	private int price;
	private int pricePeople;
}
