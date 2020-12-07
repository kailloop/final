package com.kh.couplism.location.model.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.couplism.location.model.vo.Location;

@Repository
public class LocationDaoImpl implements LocationDao {

	@Override
	public List<Location> locationList(Map<String,String> types, RowBounds rb, SqlSessionTemplate session) {
		return session.selectList("location.locationList", types, rb);
	}

	@Override
	public int locationCount(Map<String, String> types, SqlSessionTemplate session) {
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
	
	
	

	
}
