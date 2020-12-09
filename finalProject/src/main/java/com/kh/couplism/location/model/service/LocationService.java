package com.kh.couplism.location.model.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.kh.couplism.location.model.vo.Location;
import com.kh.couplism.location.model.vo.LocationFile;
import com.kh.couplism.location.model.vo.LocationMain;
import com.kh.couplism.location.model.vo.LocationPrice;

public interface LocationService {

	public List<Location> locationList (Map<String,String> types, RowBounds rb);
	public int locationCount(Map<String,String> types);
	public int checkDate(Date checkDate);
	public List<Date> getDate();
	public int insertLocation(Location location);
	public int insertLocationMain(LocationMain lm);
	public int insertLocationFile(LocationFile lf);
	public int insertLocationPrice(LocationPrice lp);
}
