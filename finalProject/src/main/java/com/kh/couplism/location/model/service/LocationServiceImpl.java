package com.kh.couplism.location.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.couplism.location.model.dao.LocationDao;
import com.kh.couplism.location.model.vo.Location;

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
	
	
	
	
}