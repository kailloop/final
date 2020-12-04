package com.kh.couplism.location.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.couplism.location.model.vo.Location;

public interface LocationDao {
	public List<Location> locationList(Map<String,String> types, RowBounds rb, SqlSessionTemplate session);
	public int locationCount(Map<String,String> types, SqlSessionTemplate session);
}
