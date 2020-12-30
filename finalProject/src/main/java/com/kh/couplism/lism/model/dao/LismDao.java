package com.kh.couplism.lism.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kh.couplism.lism.model.vo.Lism;
import com.kh.couplism.location.model.vo.Location;
import com.kh.couplism.location.model.vo.LocationReservation;

public interface LismDao {
	
	List<Location> selectDate(SqlSession session,Map param);
	
	List<LocationReservation> getReservationNo(SqlSession session,Map param);
	
	int createEnd(SqlSession session,Map param);
	
	int enrollPicker(SqlSession session,Map param);
	
	Lism selectOneLism(SqlSession session,Map param);
}
