package com.kh.couplism.lism.model.service;

import java.util.List;
import java.util.Map;

import com.kh.couplism.lism.model.vo.Lism;
import com.kh.couplism.location.model.vo.Location;
import com.kh.couplism.location.model.vo.LocationReservation;

public interface LismService {
	
	List<Location> selectDate(Map param);
	
	List<LocationReservation> getReservationNo(Map param);
	
	int createEnd(Map param);

	int enrollPicker(Map param);
	
	Lism selectOneLism(Map param);
}
