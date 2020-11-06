package com.kh.couplism.gallery.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.couplism.gallery.model.vo.Gallery;

@Repository
public class GalleryDaoImpl implements GalleryDao {
	@Override
	public List<Gallery> galleryList(SqlSession session, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return session.selectList("gallery.galleryList",null,new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public int selectCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("gallery.selectCount");
	}
}
