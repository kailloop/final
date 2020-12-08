package com.kh.couplism.mypage.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.couplism.location.model.vo.LocationReservation;

public class MypageDaoImpl implements MypageDao {

	@Override
	public List<LocationReservation> selectList(SqlSession session) {
		return session.selectList("mypage.selectList");
	}

	
	
}
