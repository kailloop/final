package com.kh.couplism.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {

	@RequestMapping("/mypage/userMypage.do")
	public String userMypage() {
		return "/mypage/userMypage";
	}
	
}
