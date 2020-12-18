package com.kh.couplism.community.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.couplism.community.model.vo.Coupon;
import com.kh.couplism.community.model.vo.Event;

@Service
public interface CommunityService {

	List<Event> selectList(int cPage, int numPerPage);
	int selectCount();
	
	Event selectEvent(int eventNo);
	
	int insertEvent(Event event);
	
	int eventRemove(int eventNo);
	
	Event selectEventOne(int eventNo);
	
	int updateEvent(Event event);
	
	int couponDown(Coupon coupon);
	
	Coupon couponSelect(String couponId);
}
