package com.kh.couplism.anniversary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AnniversaryController {
	
	@RequestMapping("/anniversary/anniversarySearch.do")
	public ModelAndView anniversarySearch(ModelAndView mv) {
		
		mv.addObject("logoPath","/resources/images/home-logo.jpg");
		mv.addObject("titleHan","한글 타이틀");
		mv.addObject("titleEng","ANNIVERSARY");
		mv.addObject("borderSize","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		mv.setViewName("anniversary/anniversarySearch");
		
		return mv;
	}
}
