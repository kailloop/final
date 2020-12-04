package com.kh.couplism.location.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@Builder
@NoArgsConstructor
public class Review {
	private int reviewNo;
	private int locationNo;
	private int reviewPosition;
	private int reviewLevel;
	private String reviewId;
	private String reviewContent;
	private int reviewGrade;
	private String ReviewDate;
}
