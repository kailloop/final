package com.kh.couplism.mypage.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.couplism.location.model.vo.LocationReservation;
import com.kh.couplism.mypage.model.dao.MypageDao;
@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	private MypageDao dao;
	
	@Autowired
	private SqlSession session;
	
	@Autowired
	private Logger logger;
	
	@Override
	public List<LocationReservation> selectList() {
		return dao.selectList(session);
	}
	
}
