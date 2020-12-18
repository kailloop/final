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
	private int reviewNo;//리뷰번호
	private int locationNo;//location번호
	private int reviewLevel;//리뷰 위치
	private String reviewId;//리뷰 작성자
	private String reviewContent;//리뷰 내용
	private int reviewGrade;//리뷰 별점
	private String reviewDate;//리뷰 작성일
}
