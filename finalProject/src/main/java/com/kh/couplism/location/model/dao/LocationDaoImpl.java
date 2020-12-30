package com.kh.couplism.location.model.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.couplism.location.model.vo.Location;
import com.kh.couplism.location.model.vo.LocationFile;
import com.kh.couplism.location.model.vo.LocationMain;
import com.kh.couplism.location.model.vo.LocationPrice;
import com.kh.couplism.location.model.vo.LocationReservation;
import com.kh.couplism.location.model.vo.Review;

@Repository
public class LocationDaoImpl implements LocationDao {

	@Override
	public List<Location> locationList(Map<String,Object> types, RowBounds rb, SqlSessionTemplate session) {
		return session.selectList("location.locationList", types, rb);
	}

	@Override
	public int locationCount(Map<String, Object> types, SqlSessionTemplate session) {
		return session.selectOne("location.locationCount", types);
	}

	@Override
	public int checkDate(Date checkDate, SqlSessionTemplate session) {
		return session.insert("location.checkDate", checkDate);
	}

	@Override
	public List<Date> getDate(SqlSessionTemplate session) {
		return session.selectList("location.getDate");
	}

	@Override
	public int insertLocation(Location location, SqlSessionTemplate session) {
		return session.insert("location.insertLocation",location);
	}

	@Override
	public int insertLocationMain(LocationMain lm, SqlSessionTemplate session) {
		return session.insert("location.insertLocationMain",lm);
	}

	@Override
	public int insertLocationFile(LocationFile lf, SqlSessionTemplate session) {
		return session.insert("location.insertLocationFile",lf);
	}

	@Override
	public int insertLocationPrice(LocationPrice lp, SqlSessionTemplate session) {
		return session.insert("location.insertLocationPrice",lp);
	}

	@Override
	public LocationMain getLocationMain(int locationNo, SqlSessionTemplate session) {
		return session.selectOne("location.getLocationMain", locationNo);
	}

	@Override
	public List<Review> getLocationReview(int locationNo, SqlSessionTemplate session) {
		return session.selectList("location.getLocationReview", locationNo);
	}

	@Override
	public Location getLocation(int locationNo, SqlSessionTemplate session) {
		return session.selectOne("location.getLocation",locationNo);
	}

	@Override
	public List<LocationPrice> getLocationPrice(int locationNo, SqlSessionTemplate session) {
		return session.selectList("location.getLocationPrice",locationNo);
	}

	@Override
	public List<LocationPrice> getLocationPrice(Map<String,Object> map, SqlSessionTemplate session) {
		return session.selectList("location.getLocationPriceString",map);
	}

	@Override
	public List<LocationReservation> getLocationPirceOfTime(Map<String, Object> map, SqlSessionTemplate session) {
		return session.selectList("location.getLocationPirceOfTime",map);
	}

	@Override
	public LocationPrice checkPrice(Map<String, Object> map, SqlSessionTemplate session) {
		return session.selectOne("location.checkPrice",map);
	}

	@Override
	public int insertReservation(LocationReservation reservation, SqlSessionTemplate session) {
		return session.insert("location.insertReservation",reservation);
	}

	@Override
	public List<LocationReservation> checkReservation(Map<String, Object> map, SqlSessionTemplate session) {
		return session.selectList("location.checkReservation",map);
	}

	@Override
	public int insertReview(Map<String, Object> map, SqlSessionTemplate session) {
		return session.insert("location.insertReview",map);
	}

	@Override
	public List<Location> locationListSplit(Map<String, Object> types, RowBounds rb, SqlSessionTemplate session) {
		return session.selectList("location.locationListSplit", types, rb);
	}

	@Override
	public int locationCountSplit(Map<String, Object> types, SqlSessionTemplate session) {
		return session.selectOne("location.locationCountSplit", types);
	}

	@Override
	public int deleteLocationMain(int locationNo, SqlSessionTemplate session) {
		return session.delete("location.deleteLocationMain",locationNo);
	}

	@Override
	public int deleteLocationReservation(int locationNo, SqlSessionTemplate session) {
		return session.delete("location.deleteLocationReservation",locationNo);
	}

	@Override
	public int deleteLocationPrice(int locationNo, SqlSessionTemplate session) {
		return session.delete("location.deleteLocationPrice",locationNo);
	}

	@Override
	public int deleteLocationLocation(int locationNo, SqlSessionTemplate session) {
		return session.delete("location.deleteLocationLocation",locationNo);
	}

	@Override
	public int updateLocation(Location location, SqlSessionTemplate session) {
		return session.update("location.updateLocation", location);
	}

	@Override
	public int updateLocationMap(Map<String, Object> map, SqlSessionTemplate session) {
		return session.update("location.updateLocationMap",map);
	}

	
	
	
	
	

	
}
