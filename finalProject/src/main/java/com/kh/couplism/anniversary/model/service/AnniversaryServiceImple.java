package com.kh.couplism.anniversary.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.couplism.anniversary.model.dao.AnniversaryDao;
import com.kh.couplism.anniversary.model.vo.Calendar;

@Service
public class AnniversaryServiceImple implements AnniversaryService {

	@Autowired
	private AnniversaryDao dao;
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Calendar> selectList(String idv) {
		// TODO Auto-generated method stub
		return dao.selectList(session,idv);
	}
	
}
