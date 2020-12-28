package com.kh.couplism.lism.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.couplism.lism.model.dao.LismDao;
import com.kh.couplism.location.model.vo.Location;

@Service
public class LismServiceImpl implements LismService{

	@Autowired
	private LismDao dao;
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Location> selectDate(String date) {
		// TODO Auto-generated method stub
		return dao.selectDate(session,date);
	}
	
	
	
}
