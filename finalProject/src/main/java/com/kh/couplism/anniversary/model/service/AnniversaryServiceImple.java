package com.kh.couplism.anniversary.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.couplism.anniversary.model.dao.AnniversaryDao;
import com.kh.couplism.anniversary.model.vo.Anniversary;
import com.kh.couplism.anniversary.model.vo.Calendar;
import com.kh.couplism.location.model.vo.Location;

@Service
public class AnniversaryServiceImple implements AnniversaryService {

	@Autowired
	private AnniversaryDao dao;
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Calendar> selectList(String idv) {
		// TODO Auto-generated method stub
		return dao.selectList(session,idv);
	}

	@Override
	public List<Anniversary> anniversaryList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.anniversaryList(session,cPage,numPerPage);
	}

	@Override
	public int selectCount() {
		// TODO Auto-generated method stub
		return dao.selectCount(session);
	}

	@Override
	public List<Location> locationList(String userId, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.locationList(session,userId,cPage,numPerPage);
	}

	@Override
	public int locationCount(String userId) {
		// TODO Auto-generated method stub
		return dao.locationCount(session,userId);
	}

	@Override
	public Location selectLocation(int locationNo) {
		// TODO Auto-generated method stub
		return dao.selectLocation(session,locationNo);
	}
	
	
}
