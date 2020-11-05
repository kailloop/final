package com.kh.couplism.gallery.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Gallery {
	private int galleryNo;
	private String galleryTitle;
	private String galleryWriter;
	private String galleryContent;
	private Date galleryDate;
	private String[] openStatus;
}
