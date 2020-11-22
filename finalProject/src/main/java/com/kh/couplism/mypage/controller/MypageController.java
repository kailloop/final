package com.kh.couplism.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MypageController {

	
	
	
	@RequestMapping("/mypage/userMypage.do")
	public ModelAndView userMypage(ModelAndView mv) {
		mv.addObject("logoPath","/resources/images/home-logo3.jpg");
		mv.addObject("titleHan","한글 타이틀");
		mv.addObject("titleEng","MY PAGE");
		mv.addObject("borderSize","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				);
		mv.setViewName("mypage/userMypage");
		return mv;
	}
	
	@RequestMapping("/mypage/partnerMypage.do")
	public ModelAndView partnerpage(ModelAndView mv) {
		mv.addObject("logoPath","/resources/images/home-logo3.jpg");
		mv.addObject("titleHan","한글 타이틀");
		mv.addObject("titleEng","MY PAGE");
		mv.addObject("borderSize","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				);
		mv.setViewName("mypage/partnerMypage");
		return mv;
	}
	
	@RequestMapping("/mypage/adminMypage.do")
	public ModelAndView adminMypage(ModelAndView mv) {
		
		//사진
		mv.addObject("logoPath","/resources/images/home-logo3.jpg");
		//한글 타이틀
		mv.addObject("titleHan","한글 타이틀");
		//영어 타이틀
		mv.addObject("titleEng","MY PAGE");
		mv.setViewName("mypage/adminMypage");
		//막대
		mv.addObject("borderSize","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				);
		return mv;
	}
}
