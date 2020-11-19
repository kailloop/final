package com.kh.couplism.community.faq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FaqController {



	@RequestMapping("/faq/faqList.do")
	public ModelAndView userMypage(ModelAndView mv) {
		mv.addObject("logoPath","/resources/images/home-logo.jpg");
		mv.addObject("titleHan","한글 타이틀");
		mv.addObject("titleEng","FAQ");
		mv.addObject("borderSize","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				);
		mv.setViewName("community/faq/faqList");
		return mv;
	}
    
}
