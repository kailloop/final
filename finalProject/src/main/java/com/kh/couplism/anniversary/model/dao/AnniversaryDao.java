package com.kh.couplism.anniversary.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.couplism.anniversary.model.vo.Calendar;

public interface AnniversaryDao {
	List<Calendar> selectList(SqlSession session);
}
