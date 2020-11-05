package com.kh.couplism.gallery.model.serivce;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.couplism.gallery.model.dao.GalleryDao;
import com.kh.couplism.gallery.model.vo.Gallery;
import com.kh.couplism.gallery.model.vo.GalleryFile;

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


	@Override
	public List<Gallery> mygalleryList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.mygalleryList(session,cPage,numPerPage);
	}


	@Override
	public Gallery selectGallery(int no) {
		return dao.selectGallery(session,no);
	}




	@Override
	public int galleryDelete(int no) {
		// TODO Auto-generated method stub
		return dao.galleryDelete(session,no);
	}


	@Override
	public int insertGallery(Gallery g, List<GalleryFile> files) {
		// TODO Auto-generated method stub
		int result=dao.insertGallery(session,g);
//		if(result==0) throw new RuntimeException("입력");
		if(!files.isEmpty()) {
			for(GalleryFile gf:files) {
				result=dao.insertGalleryFile(session,gf);
				if(result==0) {throw new RuntimeException("오류");}
			}
			
		}
		
		return result;
	}


	
	
	
}
