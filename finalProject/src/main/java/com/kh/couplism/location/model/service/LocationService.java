package com.kh.couplism.location.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.kh.couplism.location.model.vo.Location;

public interface LocationService {

	public List<Location> locationList (Map<String,String> types, RowBounds rb);
	public int locationCount(Map<String,String> types);
}
