package com.kh.couplism.location.model.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.kh.couplism.location.model.vo.Location;
import com.kh.couplism.location.model.vo.LocationFile;
import com.kh.couplism.location.model.vo.LocationMain;
import com.kh.couplism.location.model.vo.LocationPrice;
import com.kh.couplism.location.model.vo.LocationReservation;
import com.kh.couplism.location.model.vo.Review;

public interface LocationService {

	public List<Location> locationList (Map<String,Object> types, RowBounds rb);
	public int locationCount(Map<String,Object> types);
	public int checkDate(Date checkDate);
	public List<Date> getDate();
	public int insertLocation(Location location);
	public int insertLocationMain(LocationMain lm);
	public int insertLocationFile(LocationFile lf);
	public int insertLocationPrice(LocationPrice lp);
	public LocationMain getLocationMain(int locationNo);
	public List<Review> getLocationReview(int locationNo);
	public Location getLocation(int locationNo);
	public List<LocationPrice> getLocationPrice(int locationNo);
	public List<LocationPrice> getLocationPrice(Map<String,Object> map);
	public List<LocationReservation> getLocationPirceOfTime(Map<String,Object> map);
	public LocationPrice checkPrice(Map<String,Object>map);
	public int insertReservation(LocationReservation reservation);
	public List<LocationReservation> checkReservation(Map<String,Object> map);
	public int insertReview(Map<String,Object>map);
	public List<Location> locationListSplit (Map<String,Object> types, RowBounds rb);
	public int locationCountSplit(Map<String,Object> types);
	public int deleteLocationMain(int locationNo);
	public int deleteLocationReservation(int locationNo);
	public int deleteLocationPrice(int locationNo);
	public int deleteLocationLocation(int locationNo);
	public int updateLocation(Location location);
	public int updateLocationMap(Map<String,Object> map);
	
}
