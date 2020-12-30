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
import com.kh.couplism.location.model.vo.LocationPrice;
import com.kh.couplism.location.model.vo.LocationReservation;
import com.kh.couplism.location.model.vo.Review;

@Service
public class LocationServiceImpl implements LocationService {

	@Autowired
	private LocationDao dao;
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Location> locationList(Map<String,Object> types, RowBounds rb) {
		return dao.locationList(types, rb, session);
	}

	@Override
	public int locationCount(Map<String, Object> types) {
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

	@Override
	public int insertLocationPrice(LocationPrice lp) {
		return dao.insertLocationPrice(lp, session);
	}

	@Override
	public LocationMain getLocationMain(int locationNo) {
		return dao.getLocationMain(locationNo, session);
	}

	@Override
	public List<Review> getLocationReview(int locationNo) {
		return dao.getLocationReview(locationNo, session);
	}

	@Override
	public Location getLocation(int locationNo) {
		return dao.getLocation(locationNo, session);
	}

	@Override
	public List<LocationPrice> getLocationPrice(int locationNo) {
		return dao.getLocationPrice(locationNo, session);
	}

	@Override
	public List<LocationPrice> getLocationPrice(Map<String,Object> map) {
		return dao.getLocationPrice(map, session);
	}

	@Override
	public List<LocationReservation> getLocationPirceOfTime(Map<String, Object> map) {
		return dao.getLocationPirceOfTime(map, session);
	}

	@Override
	public LocationPrice checkPrice(Map<String, Object> map) {
		return dao.checkPrice(map, session);
	}

	@Override
	public int insertReservation(LocationReservation reservation) {
		return dao.insertReservation(reservation, session);
	}

	@Override
	public List<LocationReservation> checkReservation(Map<String,Object> map) {
		return dao.checkReservation(map, session);
	}

	@Override
	public int insertReview(Map<String, Object> map) {
		return dao.insertReview(map, session);
	}

	@Override
	public List<Location> locationListSplit(Map<String, Object> types, RowBounds rb) {
		return dao.locationListSplit(types,rb,session);
	}

	@Override
	public int locationCountSplit(Map<String, Object> types) {
		return dao.locationCountSplit(types,session);
	}
	
	
	
	
	
	
	
	
	
	
}
