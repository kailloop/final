package com.kh.couplism.mypage.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.couplism.community.model.vo.Coupon;
import com.kh.couplism.location.model.vo.LocationReservation;
@Repository
public class MypageDaoImpl implements MypageDao {

	@Override
	public List<LocationReservation> selectList(SqlSession session, String idv) {
		// TODO Auto-generated method stub
		return session.selectList("mypage.selectList",idv);
	}

	@Override
	public List<Coupon> couponList(SqlSession session, String idvalue,int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return session.selectList("mypage.couponList",idvalue,new RowBounds((cPage-1)*numPerPage,numPerPage));
		
	}

	@Override
	public int selectCount(SqlSession session,String idvalue) {
		// TODO Auto-generated method stub
		return session.selectOne("mypage.selectCount",idvalue);
	}

	
	
	
}
