package com.kh.couplism.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CommumityController {
	@RequestMapping("/faq/faqList.do")
	public ModelAndView userMypage(ModelAndView mv) {
		mv.addObject("logoPath","/resources/images/faq.jpg");
		mv.addObject("titleHan","편리한 홈페이지 이용을위해 자주하는 질문을 알려드립니다");
		mv.addObject("titleEng","FAQ");
		mv.addObject("borderSize","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				);
		mv.setViewName("community/faq/faqList");
		return mv;
	}
}
