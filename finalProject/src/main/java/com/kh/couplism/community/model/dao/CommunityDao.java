package com.kh.couplism.community.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.couplism.community.model.vo.Event;

@Repository
public interface CommunityDao {
	List<Event> selectList(SqlSession session);
	
	Event selectEvent(SqlSession session, int eventNo);
	
	int insertEvent(SqlSession session,Event event);
	
	int eventRemove(SqlSession session,int eventNo);
}
