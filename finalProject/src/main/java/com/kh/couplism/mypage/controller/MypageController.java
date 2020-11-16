package com.kh.couplism.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MypageController {

	@RequestMapping("/mypage/userMypage.do")
	public String userMypage() {
		return "/mypage/userMypage";
	}
	
	@RequestMapping("/mypage/partnerMypage.do")
	public String partnerpage() {
		return "/mypage/partnerMypage";
	}
	
	@RequestMapping("/mypage/adminMypage.do")
	public ModelAndView adminMypage(ModelAndView mv) {
		
		//사진
		mv.addObject("logoPath","/resources/images/home-logo3.jpg");
		//한글 타이틀
		mv.addObject("titleHan","한글 타이틀");
		//영어 타이틀
		mv.addObject("titleEng","English Title");
		mv.setViewName("mypage/adminMypage");
		
		return mv;
	}
}
