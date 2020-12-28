package com.kh.couplism.lism.model.service;

import java.util.List;
import java.util.Map;

import com.kh.couplism.location.model.vo.Location;

public interface LismService {
	
	List<Location> selectDate(String date);

}
