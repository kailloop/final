package com.kh.couplism.gallery.model.serivce;

import java.util.List;

import com.kh.couplism.gallery.model.vo.Gallery;

public interface GalleryService {
	List<Gallery> galleryList(int cPage,int numPerPage);
	int selectCount();
}
