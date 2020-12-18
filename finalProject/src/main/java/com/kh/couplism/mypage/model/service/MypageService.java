package com.kh.couplism.mypage.model.service;

import java.util.List;

import com.kh.couplism.community.model.vo.Coupon;
import com.kh.couplism.location.model.vo.LocationReservation;

public interface MypageService {
	List<LocationReservation> selectList(String idv);
	
	List<Coupon> couponList(String idvalue,int cPage, int numPerPage);
	int selectCount(String idvalue);
}
