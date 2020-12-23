package com.kh.couplism.anniversary.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.kh.couplism.anniversary.model.service.AnniversaryService;
import com.kh.couplism.anniversary.model.vo.Anniversary;
import com.kh.couplism.anniversary.model.vo.Calendar;
import com.kh.couplism.common.PageBarFactory;
import com.kh.couplism.location.model.vo.Location;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;



@Controller
public class AnniversaryController {
	
	
	@Autowired
	private AnniversaryService service;
	
	
	@RequestMapping("/anniversary/anniversarySearch.do")
	public ModelAndView anniversarySearch(ModelAndView mv,
					@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, 
					@RequestParam(value="numPerPage", required=false, defaultValue="10") int numPerPage) {
		mv.addObject("logoPath","/resources/images/anni/annilogo.jpg");
		mv.addObject("titleHan","기념일 예약");
		mv.addObject("titleEng","ANNIVERSARY");
		mv.addObject("borderSize","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		mv.setViewName("anniversary/anniversarySearch");
		
		List<Anniversary> list=service.anniversaryList(cPage,numPerPage);
		int totalData=service.selectCount();
		
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalData, cPage, numPerPage, "anniversarySearch.do"));
		mv.addObject("totalData",totalData);
		mv.addObject("list",list);
		return mv;
	}
	
	@RequestMapping("/anniversary/myCalendar.do")
	public ModelAndView myCalendar(ModelAndView mv,Calendar cal,
						@RequestParam(value="idvalue") String idv) {
		mv.addObject("logoPath","/resources/images/mypagelogo.jpg");
		mv.addObject("titleHan","한글 타이틀");
		mv.addObject("titleEng","MY CALENDAR");
		mv.addObject("borderSize","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		mv.setViewName("anniversary/myCalendar");
		
		List<Calendar> list=service.selectList(idv);
		System.out.println(list);
		System.out.println(idv);
		
		
		JSONArray jsonList=new JSONArray();
		System.out.println(list.size());
		
		mv.addObject("idv",idv);
		mv.addObject("list",list);
		mv.addObject("listsize",list.size());
		
		
		mv.addObject("jsonList",jsonList.fromObject(list));
		System.out.println(jsonList.fromObject(list));
		
		return mv;
	}
	
	
	
	//anniversary 글쓰기 이동해서 사업장리스트 보여주는 메소드
	@RequestMapping("/anniWrite")
	public ModelAndView anniWrite(ModelAndView mv,
					@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, 
					@RequestParam(value="numPerPage", required=false, defaultValue="5") int numPerPage,
					@RequestParam(value="userId") String userId) {
		mv.addObject("logoPath","/resources/images/anni/annilogo.jpg");
		mv.addObject("titleHan","기념일 등록");
		mv.addObject("titleEng","ANNIVERSARY WRITE");
		mv.addObject("borderSize","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		mv.setViewName("anniversary/anniversaryWrite");
		
		List<Location> locationList=service.locationList(userId,cPage, numPerPage);
		int totalData=service.locationCount(userId);
		
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalData, cPage, numPerPage, "anniversarySearch.do"));
		mv.addObject("totalData",totalData);
		mv.addObject("locationList",locationList);
		
		return mv;
	}
	
	
	//anniversary 글쓰기 이동한 다음 사업장리스트에서 선택 후 보여주는 메소드
		@RequestMapping("/anniWriteDetail")
		public ModelAndView anniWriteDetail(ModelAndView mv,@RequestParam(value="locationNo") int locationNo) {
			mv.addObject("logoPath","/resources/images/anni/annilogo.jpg");
			mv.addObject("titleHan","기념일 등록");
			mv.addObject("titleEng","ANNIVERSARY WRITE");
			mv.addObject("borderSize","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
			mv.setViewName("anniversary/anniversaryWriteDetail");
			
			Location location=service.selectLocation(locationNo);
			System.out.println(location);
			mv.addObject("location",location);
			
			return mv;
		}

	/*
	 * @RequestMapping("/calendarValue") public ModelAndView
	 * calendarValue(ModelAndView mv,
	 * 
	 * @RequestParam(value="idvalue") String idv) {
	 * 
	 * 
	 * 
	 * 
	 * 
	 * return mv; }
	 */

}
