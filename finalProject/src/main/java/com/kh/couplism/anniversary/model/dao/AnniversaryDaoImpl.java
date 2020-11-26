package com.kh.couplism.anniversary.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.couplism.anniversary.model.vo.Calendar;

@Repository
public class AnniversaryDaoImpl implements AnniversaryDao {

	@Override
	public List<Calendar> selectList(SqlSession session) {
		return session.selectList("anniversary.selectList");
	}
	
}
