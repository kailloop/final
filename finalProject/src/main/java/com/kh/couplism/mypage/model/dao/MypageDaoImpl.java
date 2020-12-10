package com.kh.couplism.mypage.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.couplism.location.model.vo.LocationReservation;
@Repository
public class MypageDaoImpl implements MypageDao {

	@Override
	public List<LocationReservation> selectList(SqlSession session, String idv) {
		// TODO Auto-generated method stub
		return session.selectList("mypage.selectList",idv);
	}

	
	
	
}
