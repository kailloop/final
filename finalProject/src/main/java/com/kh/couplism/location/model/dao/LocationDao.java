package com.kh.couplism.location.model.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.couplism.location.model.vo.Location;
import com.kh.couplism.location.model.vo.LocationFile;
import com.kh.couplism.location.model.vo.LocationMain;
import com.kh.couplism.location.model.vo.LocationPrice;
import com.kh.couplism.location.model.vo.LocationReservation;
import com.kh.couplism.location.model.vo.Review;

public interface LocationDao {
	public List<Location> locationList(Map<String,Object> types, RowBounds rb, SqlSessionTemplate session);
	public int locationCount(Map<String,Object> types, SqlSessionTemplate session);
	public int checkDate(Date checkDate, SqlSessionTemplate session);
	public List<Date> getDate(SqlSessionTemplate session);
	public int insertLocation(Location location, SqlSessionTemplate session);
	public int insertLocationMain(LocationMain lm, SqlSessionTemplate session);
	public int insertLocationFile(LocationFile lf, SqlSessionTemplate session);
	public int insertLocationPrice(LocationPrice lp, SqlSessionTemplate session);
	public LocationMain getLocationMain(int locationNo, SqlSessionTemplate session);
	public List<Review> getLocationReview(int locationNo, SqlSessionTemplate session);
	public Location getLocation(int locationNo,SqlSessionTemplate session);
	public List<LocationPrice> getLocationPrice(int locationNo, SqlSessionTemplate session);
	public List<LocationPrice> getLocationPrice(Map<String,Object> map, SqlSessionTemplate session);
	public List<LocationReservation> getLocationPirceOfTime(Map<String,Object> map, SqlSessionTemplate session);
	public LocationPrice checkPrice(Map<String,Object> map, SqlSessionTemplate session);
	public int insertReservation(LocationReservation reservation, SqlSessionTemplate session);
	public List<LocationReservation> checkReservation(Map<String,Object> map, SqlSessionTemplate session);
	public int insertReview(Map<String,Object> map, SqlSessionTemplate session);
	public List<Location> locationListSplit(Map<String,Object> types, RowBounds rb, SqlSessionTemplate session);
	public int locationCountSplit(Map<String,Object> types, SqlSessionTemplate session);
}
