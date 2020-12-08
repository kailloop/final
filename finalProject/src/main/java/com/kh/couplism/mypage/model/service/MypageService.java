package com.kh.couplism.mypage.model.service;

import java.util.List;

import com.kh.couplism.location.model.vo.LocationReservation;

public interface MypageService {
	List<LocationReservation> selectList();
}
