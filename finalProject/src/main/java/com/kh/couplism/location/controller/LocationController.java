package com.kh.couplism.location.controller;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.couplism.location.model.service.LocationService;
import com.kh.couplism.location.model.vo.Location;

@Controller
public class LocationController {
	
	@Autowired
	private Logger logger;
	@Autowired
	private LocationService service;
	
	
	@RequestMapping("/location")//로케이션 리스트 목록을 보여주는곳
	public ModelAndView location(@RequestParam(value="locationType", defaultValue="", required=false) String locationType,
						 @RequestParam(value="locationAddress", defaultValue="", required=false) String locationAddress,
						 @RequestParam(value="keyword", defaultValue="", required=false) String keyword,
						 @RequestParam(value="cPage", defaultValue="1", required=false) int cPage,
						 ModelAndView mv, HttpServletRequest request) {
		logger.debug("=======================================Location===========================================");
		logger.debug("locationType : "+locationType);
		logger.debug("locationAddress : "+locationAddress);
		logger.debug("keyword : "+keyword);
		logger.debug("cPage : "+cPage);
		
		Map<String,String> types = new HashMap();
		types.put("locationType", "%"+locationType+"%");
		types.put("locationAddress", "%"+locationAddress+"%");
		types.put("keyword", "%"+keyword+"%");
		
		logger.debug("types : "+types);
		
		int numPerPage = 15;
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage);
		
		List<Location> locationList = service.locationList(types,rb);
		
		logger.debug("locatoin 갯수 : "+locationList.size());
		logger.debug("locationList : "+locationList);
		int totalData = service.locationCount(types);
		logger.debug("totalData : "+totalData);
		int totalPage=(int)Math.ceil((double)totalData/numPerPage);
		int pageBarSize=5;
		int pageNo =((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo+pageBarSize-1;
		String pageBar = "";
		
		if (pageNo == 1) {
			pageBar = "<li class='page-item'>" + "<a class='page-link text-dark'aria-label='Previous'>"
					+ "<span aria-hidden='true'>&laquo;</span>" + "<span class='sr-only'>Previous</span>" + "</a>"
					+ "</li>";
		} else {
			pageBar = "<li class='page-item'>" + "<a class='page-link text-dark' href='" + request.getContextPath()
					+ "/location?cPage=" + (pageNo - 1) + "&locationType=" + locationType + "&locationAddress=" + locationAddress +"&keyword=" + keyword
					+ "' aria-label='Previous'>" + "<span aria-hidden='true'>&laquo;</span>"
					+ "<span class='sr-only'>Previous</span>" + "</a>" + "</li>";
		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (cPage == pageNo) {
				pageBar += "<li class='page-item'><a class='page-link text-dark'>" + pageNo + "</a></li>";
			} else {
				pageBar += "<li class='page-item'><a class='page-link text-dark' href='" + request.getContextPath()
						+ "/location?cPage=" + pageNo + "&locationType=" + locationType + "&locationAddress=" + locationAddress +"&keyword=" + keyword + "'>"
						+ pageNo + "</a></li>";
			}
			pageNo++;
		}
		if (pageNo > totalPage) {
			pageBar += "<li class='page-item'>" + "<a class='page-link text-dark' aria-label='Next'>"
					+ "<span aria-hidden='true'>&raquo;</span>" + "<span class='sr-only'>Next</span>" + "</a>"
					+ "</li>";
		} else {
			pageBar += "<li class='page-item'>" + "<a class='page-link text-dark' href='" + request.getContextPath()
					+ "/gowith/search?cPage=" + pageNo + "&locationType=" + locationType + "&locationAddress=" + locationAddress +"&keyword=" + keyword
					+ "' aria-label='Next'>" + "<span aria-hidden='true'>&raquo;</span>"
					+ "<span class='sr-only'>Next</span>" + "</a>" + "</li>";
		}
		
		mv.setViewName("/location/list");
		mv.addObject("locationList", locationList);
		mv.addObject("pageBar", pageBar);
		
		logger.debug("==========================================================================================");
		
		return mv;

	}
	
	@RequestMapping("/location/check")
	public String check() {
		return "/location/check";
	}
	
	@RequestMapping("checkDate")
	public void checkDate() {
		int result = service.checkDate(new Date());
		System.out.println(result);
		
		List<Date> dateList = service.getDate();
		for(Date d : dateList) {
			System.out.println(d);
		}
	}
	
}
