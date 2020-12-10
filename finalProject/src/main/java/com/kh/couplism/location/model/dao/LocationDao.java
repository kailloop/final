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

public interface LocationDao {
	public List<Location> locationList(Map<String,String> types, RowBounds rb, SqlSessionTemplate session);
	public int locationCount(Map<String,String> types, SqlSessionTemplate session);
	public int checkDate(Date checkDate, SqlSessionTemplate session);
	public List<Date> getDate(SqlSessionTemplate session);
	public int insertLocation(Location location, SqlSessionTemplate session);
	public int insertLocationMain(LocationMain lm, SqlSessionTemplate session);
	public int insertLocationFile(LocationFile lf, SqlSessionTemplate session);
	public int insertLocationPrice(LocationPrice lp, SqlSessionTemplate session);
}
