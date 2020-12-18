package com.kh.couplism.mypage.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.kh.couplism.community.model.vo.Coupon;
import com.kh.couplism.location.model.vo.LocationReservation;

public interface MypageDao {
	List<LocationReservation> selectList(SqlSession session,String idv);
	
	List<Coupon> couponList(SqlSession session,String idvalue,int cPage, int numPerPage);
	int selectCount(SqlSession session,String idvalue);
	
}
