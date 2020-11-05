package com.kh.couplism.gallery.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.couplism.gallery.model.vo.Gallery;
import com.kh.couplism.gallery.model.vo.GalleryFile;
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

	@Override
	public List<Gallery> mygalleryList(SqlSession session, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return session.selectList("gallery.mygalleryList",null,new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public Gallery selectGallery(SqlSession session, int no) {
		// TODO Auto-generated method stub
		return session.selectOne("gallery.selectGallery",no);
	}

	@Override
	public int galleryDelete(SqlSession session, int no) {
		// TODO Auto-generated method stub
		return session.delete("gallery.galleryDelete",no);
		
	}

	@Override
	public int insertGallery(SqlSession session, Gallery g) {
		// TODO Auto-generated method stub
		return session.insert("gallery.insertGallery",g);
	}

	@Override
	public int insertGalleryFile(SqlSession session, GalleryFile file) {
		// TODO Auto-generated method stub
		return session.insert("gallery.insertGalleryFile",file);
	}

	

}
