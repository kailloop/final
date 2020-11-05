package com.kh.couplism.gallery.model.serivce;

import java.util.List;
import java.util.Map;

import com.kh.couplism.gallery.model.vo.Gallery;
import com.kh.couplism.gallery.model.vo.GalleryFile;

public interface GalleryService {
	List<Gallery> galleryList(int cPage,int numPerPage);
	List<Gallery> mygalleryList(int cPage,int numPerPage);
	int selectCount();
	
	Gallery selectGallery(int no);
	
	int galleryDelete(int no);
	
	int insertGallery(Gallery g, List<GalleryFile> files);
}
