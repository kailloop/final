package com.kh.couplism.location.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@Builder
@NoArgsConstructor
public class Location {
	private int locationNo;
	private String locationType;
	private String locationTitle;
	private String locationCreator;
	private String locationContent;
	private String locationPhone;
	private String locationAddress;
	private int locationStatus;
}
