package com.kh.couplism.lism.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kh.couplism.location.model.vo.Location;

public interface LismDao {
	
	List<Location> selectDate(SqlSession session,String date);

}
