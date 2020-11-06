package com.kh.couplism.gallery.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.couplism.gallery.model.vo.Gallery;

public interface GalleryDao {
	List<Gallery> galleryList(SqlSession session,int cPage,int numPerPage);
	int selectCount(SqlSession session);
	
}
