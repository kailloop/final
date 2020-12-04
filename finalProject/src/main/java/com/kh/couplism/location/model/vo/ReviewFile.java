package com.kh.couplism.location.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@Builder
@NoArgsConstructor
public class ReviewFile {
	private int locationNo;
	private int reviewNo;
	private String originalName;
	private String renameName;
}
