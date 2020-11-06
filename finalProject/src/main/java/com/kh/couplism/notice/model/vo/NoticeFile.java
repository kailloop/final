package com.kh.couplism.notice.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class NoticeFile {
	private int noticeNo;
	private String originalName;
	private String renameName;
}
