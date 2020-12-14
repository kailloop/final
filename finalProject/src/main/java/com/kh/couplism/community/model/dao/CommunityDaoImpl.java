package com.kh.couplism.community.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.couplism.community.model.vo.Event;

@Repository
public class CommunityDaoImpl implements CommunityDao {

	@Override
	public List<Event> selectList(SqlSession session) {
		
		return session.selectList("community.selectList");
	}

	@Override
	public Event selectEvent(SqlSession session, int eventNo) {
		return session.selectOne("community.selectEvent",eventNo);
	}

	@Override
	public int insertEvent(SqlSession session, Event e) {
		return session.insert("community.insertEvent",e);
	}
	
	
	
}
