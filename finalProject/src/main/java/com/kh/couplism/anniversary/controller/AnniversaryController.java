package com.kh.couplism.anniversary.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.kh.couplism.anniversary.model.service.AnniversaryService;
import com.kh.couplism.anniversary.model.vo.Calendar;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;



@Controller
public class AnniversaryController {
	
	
	@Autowired
	private AnniversaryService service;
	
	
	@RequestMapping("/anniversary/anniversarySearch.do")
	public ModelAndView anniversarySearch(ModelAndView mv) {
		mv.addObject("logoPath","/resources/images/anni/annilogo.jpg");
		mv.addObject("titleHan","한글 타이틀");
		mv.addObject("titleEng","ANNIVERSARY");
		mv.addObject("borderSize","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		mv.setViewName("anniversary/anniversarySearch");
		return mv;
	}
	
	@RequestMapping("/anniversary/myCalendar.do")
	public ModelAndView myCalendar(ModelAndView mv,Calendar cal) {
		mv.addObject("logoPath","/resources/images/anni/annilogo.jpg");
		mv.addObject("titleHan","한글 타이틀");
		mv.addObject("titleEng","MY CALENDAR");
		mv.addObject("borderSize","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		mv.setViewName("anniversary/myCalendar");
		
		
		List<Calendar> list=service.selectList();
		System.out.println(list);
		
		JSONArray jsonList=new JSONArray();
		mv.addObject("list",list);
		mv.addObject("jsonList",jsonList.fromObject(list));
		System.out.println(jsonList.fromObject(list));
		
		
		
		return mv;
	}
	
	/*
	 * @RequestMapping("/calendarValue")
	 * 
	 * @ResponseBody //자바객체 http요청의 body내용으로 매핑 public ModelAndView
	 * calendarValue(ModelAndView mv) {
	 * 
	 * 
	 * 
	 * 
	 * return mv; }
	 */
}
