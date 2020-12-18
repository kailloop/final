package com.kh.couplism.community.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.couplism.community.model.vo.Coupon;
import com.kh.couplism.community.model.vo.Event;

@Repository
public interface CommunityDao {
	List<Event> selectList(SqlSession session,int cPage, int numPerPage);
	int selectCount(SqlSession session);
	
	Event selectEvent(SqlSession session, int eventNo);
	
	int insertEvent(SqlSession session,Event event);
	
	int eventRemove(SqlSession session,int eventNo);
	
	Event selectEventOne(SqlSession session,int eventNo);
	
	int updateEvent(SqlSession session,Event event);
	
	int couponDown(SqlSession session,Coupon coupon);
}
