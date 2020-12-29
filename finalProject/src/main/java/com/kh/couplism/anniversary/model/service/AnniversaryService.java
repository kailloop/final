package com.kh.couplism.anniversary.model.service;

import java.util.List;

import com.kh.couplism.anniversary.model.vo.Anniversary;
import com.kh.couplism.anniversary.model.vo.Calendar;
import com.kh.couplism.location.model.vo.Location;

public interface AnniversaryService {
	List<Calendar> selectList(String idv);
	
	List<Anniversary> anniversaryList(int cPage, int numPerPage);
	int selectCount();
	
	List<Location> locationList(String userId,int cPage, int numPerPage);
	int locationCount(String userId);
	
	Location selectLocation(int locationNo);
	
	int insertAnniversary(Anniversary anniversary);
	
	List<Location> lookList(int cPage,int numPerPage);
	int lookCount();
	
}
