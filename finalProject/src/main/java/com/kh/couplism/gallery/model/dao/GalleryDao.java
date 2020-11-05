package com.kh.couplism.gallery.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kh.couplism.gallery.model.vo.Gallery;
import com.kh.couplism.gallery.model.vo.GalleryFile;

public interface GalleryDao {
	List<Gallery> galleryList(SqlSession session,int cPage,int numPerPage);
	List<Gallery> mygalleryList(SqlSession session,int cPage,int numPerPage);
	int selectCount(SqlSession session);
	
	Gallery selectGallery(SqlSession session,int no);
	
	int galleryDelete(SqlSession session,int no);
	
	int insertGallery(SqlSession session,Gallery g);
	int insertGalleryFile(SqlSession session,GalleryFile file);
	
	
}
