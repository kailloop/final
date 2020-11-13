package com.kh.couplism.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String adminMypage() {
		return "/mypage/adminMypage";
	}
}
