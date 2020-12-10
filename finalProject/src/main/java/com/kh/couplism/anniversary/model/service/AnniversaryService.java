package com.kh.couplism.anniversary.model.service;

import java.util.List;

import com.kh.couplism.anniversary.model.vo.Calendar;

public interface AnniversaryService {
	List<Calendar> selectList(String idv);
}
