package com.kh.couplism.anniversary.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.couplism.anniversary.model.vo.Anniversary;
import com.kh.couplism.anniversary.model.vo.Calendar;
import com.kh.couplism.location.model.vo.Location;

public interface AnniversaryDao {
	List<Calendar> selectList(SqlSession session,String idv);
	
	List<Anniversary> anniversaryList(SqlSession session,int cPage,int numPerPage);
	int selectCount(SqlSession session);
	
	List<Location> locationList(SqlSession session,String userId, int cPage, int numPerPage);
	int locationCount(SqlSession session,String userId);
	
	Location selectLocation(SqlSession session,int locationNo);
	
	
}
