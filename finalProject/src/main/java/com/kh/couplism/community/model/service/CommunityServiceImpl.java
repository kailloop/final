package com.kh.couplism.community.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.couplism.community.model.dao.CommunityDao;
import com.kh.couplism.community.model.vo.Event;

@Service
public class CommunityServiceImpl implements CommunityService {
	@Autowired
	private CommunityDao dao;
	
	@Autowired
	private SqlSession session;

	@Override
	public List<Event> selectList() {
		// TODO Auto-generated method stub
		return dao.selectList(session);
	}

	@Override
	public Event selectEvent(int eventNo) {
		// TODO Auto-generated method stub
		return dao.selectEvent(session,eventNo);
	}

	@Override
	public int insertEvent(Event event) {
		// TODO Auto-generated method stub
		return dao.insertEvent(session,event);
	}

	@Override
	public int eventRemove(int eventNo) {
		// TODO Auto-generated method stub
		return dao.eventRemove(session,eventNo);
	}

	@Override
	public Event selectEventOne(int eventNo) {
		// TODO Auto-generated method stub
		return dao.selectEventOne(session,eventNo);
	}

	@Override
	public int updateEvent(Event event) {
		// TODO Auto-generated method stub
		return dao.updateEvent(session,event);
	}
	
	
	
}
