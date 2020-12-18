package com.kh.couplism.community.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.couplism.community.model.vo.Coupon;
import com.kh.couplism.community.model.vo.Event;

@Repository
public class CommunityDaoImpl implements CommunityDao {

	@Override
	public List<Event> selectList(SqlSession session,int cPage, int numPerPage) {
		return session.selectList("community.selectList",null,new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public int selectCount(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("community.selectCount");
	}

	@Override
	public Event selectEvent(SqlSession session, int eventNo) {
		return session.selectOne("community.selectEvent",eventNo);
	}

	@Override
	public int insertEvent(SqlSession session, Event event) {
		return session.insert("community.insertEvent",event);
	}

	@Override
	public int eventRemove(SqlSession session, int eventNo) {
		// TODO Auto-generated method stub
		return session.delete("community.eventRemove",eventNo);
	}

	@Override
	public Event selectEventOne(SqlSession session, int eventNo) {
		// TODO Auto-generated method stub
		return session.selectOne("community.selectEventOne",eventNo);
	}

	@Override
	public int updateEvent(SqlSession session, Event event) {
		// TODO Auto-generated method stub
		return session.update("community.updateEvent",event);
	}

	@Override
	public int couponDown(SqlSession session, Coupon coupon) {
		// TODO Auto-generated method stub
		return session.insert("community.couponDown",coupon);
	}
	
	
	
}
