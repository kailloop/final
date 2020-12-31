package com.kh.couplism.lism.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.couplism.lism.model.dao.LismDao;
import com.kh.couplism.lism.model.vo.Lism;
import com.kh.couplism.lism.model.vo.LismDetail;
import com.kh.couplism.lism.model.vo.LismLikeCount;
import com.kh.couplism.location.model.vo.Location;
import com.kh.couplism.location.model.vo.LocationReservation;

@Service
public class LismServiceImpl implements LismService{

	@Autowired
	private LismDao dao;
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Location> selectDate(Map param) {
		// TODO Auto-generated method stub
		return dao.selectDate(session,param);
	}

	@Override
	public List<LocationReservation> getReservationNo(Map param) {
		// TODO Auto-generated method stub
		return dao.getReservationNo(session,param);
	}

	@Override
	public int createEnd(Map param) {
		// TODO Auto-generated method stub
		return dao.createEnd(session,param);
	}

	@Override
	public int enrollPicker(Map param) {
		// TODO Auto-generated method stub
		return dao.enrollPicker(session,param);
	}

	@Override
	public Lism selectOneLism(Map param) {
		// TODO Auto-generated method stub
		return dao.selectOneLism(session,param);
	}

	@Override
	public Lism selectOneNo(Map param) {
		// TODO Auto-generated method stub
		return dao.selectOneNo(session,param);
	}

	@Override
	public List<LismDetail> selectDetail(int lismNo) {
		// TODO Auto-generated method stub
		return dao.selectDetail(session,lismNo);
	}

	@Override
	public int selectDetailCount(int no) {
		// TODO Auto-generated method stub
		return dao.selectDetailCount(session,no);
	}

	@Override
	public LocationReservation getReservationOne(Map param) {
		// TODO Auto-generated method stub
		return dao.getReservationOne(session,param);
	}

	@Override
	public Location getLocationOne(Map param) {
		// TODO Auto-generated method stub
		return dao.getLocationOne(session,param);
	}

	@Override
	public LismLikeCount checkLike(Map param) {
		// TODO Auto-generated method stub
		return dao.checkLike(session,param);
	}

	@Override
	public int enrollLike(Map param) {
		// TODO Auto-generated method stub
		return dao.enrollLike(session,param);
	}

	@Override
	public int updateLike(Map param) {
		// TODO Auto-generated method stub
		return dao.updateLike(session,param);
	}

	@Override
	public int selectLikeCount(Map param) {
		// TODO Auto-generated method stub
		return dao.selectLikeCount(session,param);
	}

	@Override
	public int lismDelete(Map param) {
		// TODO Auto-generated method stub
		return dao.lismDelete(session,param);
	}

	@Override
	public int lismPickerDelete(Map param) {
		// TODO Auto-generated method stub
		return dao.lismPickerDelete(session,param);
	}

	@Override
	public void deletePickerOne(Map param) {
		// TODO Auto-generated method stub
		dao.deletePickerOne(session,param);
	}

	@Override
	public int updateLismEnd(Map param) {
		// TODO Auto-generated method stub
		return dao.updateLismEnd(session,param);
	}

	@Override
	public List<Lism> lismOpenList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return dao.lismOpenList(session,cPage,numPerPage);
	}

	@Override
	public int lismOpenListCount() {
		// TODO Auto-generated method stub
		return dao.lismOpenListCount(session);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
}
