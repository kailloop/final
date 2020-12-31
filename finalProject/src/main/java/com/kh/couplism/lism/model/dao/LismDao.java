package com.kh.couplism.lism.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kh.couplism.lism.model.vo.Lism;
import com.kh.couplism.lism.model.vo.LismDetail;
import com.kh.couplism.lism.model.vo.LismLikeCount;
import com.kh.couplism.location.model.vo.Location;
import com.kh.couplism.location.model.vo.LocationReservation;

public interface LismDao {
	
	List<Location> selectDate(SqlSession session,Map param);
	
	List<LocationReservation> getReservationNo(SqlSession session,Map param);
	
	int createEnd(SqlSession session,Map param);
	
	int enrollPicker(SqlSession session,Map param);
	
	Lism selectOneLism(SqlSession session,Map param);
	
	Lism selectOneNo(SqlSession session,Map param);
	
	List<LismDetail> selectDetail(SqlSession session,int lismNo);
	
	int selectDetailCount(SqlSession session,int no);
	
	LocationReservation getReservationOne(SqlSession session,Map param);
	
	Location getLocationOne(SqlSession session,Map param);
	
	LismLikeCount checkLike(SqlSession session,Map param);
	
	int enrollLike(SqlSession session,Map param);
	
	int updateLike(SqlSession session,Map param);
	
	int selectLikeCount(SqlSession session,Map param);
	
	int lismDelete(SqlSession session,Map param);
	
	int lismPickerDelete(SqlSession session,Map param);
	
	void deletePickerOne(SqlSession session,Map param);
	
	int updateLismEnd(SqlSession session,Map param);
	
	List<Lism> lismOpenList(SqlSession session,int cPage,int numPerPage);

	int lismOpenListCount(SqlSession session);
}
