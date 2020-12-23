package com.kh.couplism.anniversary.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.couplism.anniversary.model.vo.Anniversary;
import com.kh.couplism.anniversary.model.vo.Calendar;
import com.kh.couplism.location.model.vo.Location;

@Repository
public class AnniversaryDaoImpl implements AnniversaryDao {

	@Override
	public List<Calendar> selectList(SqlSession session,String idv) {
		return session.selectList("anniversary.selectList",idv);
	}

	@Override
	public List<Anniversary> anniversaryList(SqlSession session, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return session.selectList("anniversary.anniversaryList",null,new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public int selectCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("anniversary.selectCount");
	}

	@Override
	public List<Location> locationList(SqlSession session, String userId, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return session.selectList("anniversary.locationList",userId,new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public int locationCount(SqlSession session,String userId) {
		// TODO Auto-generated method stub
		return session.selectOne("anniversary.locationCount",userId);
	}

	@Override
	public Location selectLocation(SqlSession session, int locationNo) {
		// TODO Auto-generated method stub
		return session.selectOne("anniversary.selectLocation",locationNo);
	}
	
	
	
}
