package com.kh.couplism.lism.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.couplism.location.model.vo.Location;

@Repository
public class LismDaoImpl implements LismDao {

	@Override
	public List<Location> selectDate(SqlSession session, String date) {
		// TODO Auto-generated method stub
		return session.selectList("lism.selectDate",date);
	}

}
