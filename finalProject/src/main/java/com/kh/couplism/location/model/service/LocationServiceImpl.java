package com.kh.couplism.location.model.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.couplism.location.model.dao.LocationDao;
import com.kh.couplism.location.model.vo.Location;
import com.kh.couplism.location.model.vo.LocationFile;
import com.kh.couplism.location.model.vo.LocationMain;

@Service
public class LocationServiceImpl implements LocationService {

	@Autowired
	private LocationDao dao;
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Location> locationList(Map<String,String> types, RowBounds rb) {
		return dao.locationList(types, rb, session);
	}

	@Override
	public int locationCount(Map<String, String> types) {
		return dao.locationCount(types,session);
	}

	@Override
	public int checkDate(Date checkDate) {
		return dao.checkDate(checkDate, session);
	}

	@Override
	public List<Date> getDate() {
		return dao.getDate(session);
	}

	@Override
	public int insertLocation(Location location) {
		return dao.insertLocation(location, session);
	}

	@Override
	public int insertLocationMain(LocationMain lm) {
		return dao.insertLocationMain(lm, session);
	}

	@Override
	public int insertLocationFile(LocationFile lf) {
		return dao.insertLocationFile(lf, session);
	}
	
	
	
	
	
	
	
	
	
}
