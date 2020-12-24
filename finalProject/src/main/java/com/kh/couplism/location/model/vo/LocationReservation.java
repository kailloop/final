package com.kh.couplism.location.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@Builder
@NoArgsConstructor
public class LocationReservation {

	private int no;
	private int locationNo;
	private String id;
	private String name;
	private String time;
	private String day;
	private int people;
	private int price;
	private String paymentDate;
}
