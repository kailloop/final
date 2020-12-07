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

	private int reservationNo;
	private int locationNo;
	private String userId;
	private int reservationPeopleCount;
	private String reservationTime;
	private String reservationDay;
	private int reservationPrice;
	private Date paymentDate;
	private Date ReservationDate;
}
