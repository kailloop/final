package com.kh.couplism.gallery.model.serivce;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.couplism.gallery.model.dao.GalleryDao;
import com.kh.couplism.gallery.model.vo.Gallery;

@Service
public class GalleryServiceImpl implements GalleryService {
	@Autowired
	private GalleryDao dao;
	@Autowired
	private SqlSession session;
	

	@Override
	public List<Gallery> galleryList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		
		return dao.galleryList(session,cPage,numPerPage);
	}


	@Override
	public int selectCount() {
		// TODO Auto-generated method stub
		return  dao.selectCount(session);
	}
}
