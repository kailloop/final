package com.kh.couplism.community.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.couplism.community.model.vo.Event;

@Service
public interface CommunityService {

	List<Event> selectList();
	
	Event selectEvent(int eventNo);
	
	int insertEvent(Event event);
	
	int eventRemove(int eventNo);
}
