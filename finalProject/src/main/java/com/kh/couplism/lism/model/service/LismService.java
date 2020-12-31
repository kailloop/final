package com.kh.couplism.lism.model.service;

import java.util.List;
import java.util.Map;

import com.kh.couplism.lism.model.vo.Lism;
import com.kh.couplism.lism.model.vo.LismDetail;
import com.kh.couplism.lism.model.vo.LismLikeCount;
import com.kh.couplism.location.model.vo.Location;
import com.kh.couplism.location.model.vo.LocationReservation;

public interface LismService {
	
	List<Location> selectDate(Map param);
	
	List<LocationReservation> getReservationNo(Map param);
	
	int createEnd(Map param);

	int enrollPicker(Map param);
	
	Lism selectOneLism(Map param);
	
	Lism selectOneNo(Map param);
	
	List<LismDetail> selectDetail(int lismNo);
	
	int selectDetailCount(int no);
	
	LocationReservation getReservationOne(Map param);
	
	Location getLocationOne(Map param);
	
	LismLikeCount checkLike(Map param);
	
	int enrollLike(Map param);
	
	int updateLike(Map param);
	
	int selectLikeCount(Map param);
	
	int lismDelete(Map param);
	
	int lismPickerDelete(Map param);

	void deletePickerOne(Map param);

	int updateLismEnd(Map param);
	
	List<Lism> lismOpenList(int cPage,int numPerPage);

	int lismOpenListCount();
}
