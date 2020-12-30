package com.kh.couplism.lism.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.couplism.lism.model.vo.Lism;
import com.kh.couplism.lism.model.vo.LismDetail;
import com.kh.couplism.location.model.vo.Location;
import com.kh.couplism.location.model.vo.LocationReservation;

@Repository
public class LismDaoImpl implements LismDao {

	@Override
	public List<Location> selectDate(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectList("lism.selectDate",param);
	}

	@Override
	public List<LocationReservation> getReservationNo(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectList("lism.getReservationNo",param);
	}

	@Override
	public int createEnd(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("lism.createEnd",param);
	}

	@Override
	public int enrollPicker(SqlSession session,Map param) {
		// TODO Auto-generated method stub
		return session.insert("lism.enrollPicker",param);
	}

	@Override
	public Lism selectOneLism(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("lism.selectOneLism",param);
	}

	@Override
	public Lism selectOneNo(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("lism.selectOneNo",param);
	}
	
	@Override
	public List<LismDetail> selectDetail(SqlSession session, int lismNo) {
		// TODO Auto-generated method stub
		return session.selectList("lism.selectDetail",lismNo);
	}

	@Override
	public int selectDetailCount(SqlSession session, int no) {
		// TODO Auto-generated method stub
		return session.selectOne("lism.selectDetailCount",no);
	}

	@Override
	public LocationReservation getReservationOne(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("lism.getReservationOne",param);
	}

	@Override
	public Location getLocationOne(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("lism.getLocationOne",param);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
