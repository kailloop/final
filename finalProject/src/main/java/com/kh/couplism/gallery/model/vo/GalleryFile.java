package com.kh.couplism.gallery.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GalleryFile {
	private int gfGalleryRef;
	private String gfOriginalFileName;
	private String gfRenameFileName;
}
