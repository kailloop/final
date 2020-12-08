package com.kh.couplism.mypage.controller;

import java.util.List;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.couplism.location.model.vo.LocationReservation;
import com.kh.couplism.mypage.model.service.MypageService;

@Controller
public class MypageController {

	@Autowired
	private MypageService service;
	
	@Autowired
	private Logger logger;
	
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
		
		//막대
		mv.addObject("borderSize","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				);
		return mv;
	}
	
	@RequestMapping("/reservation")
	public ModelAndView reservation(ModelAndView mv) {
		mv.addObject("logoPath","/resources/images/home-logo3.jpg");
		mv.addObject("titleHan","한글 타이틀");
		mv.addObject("titleEng","Reservation");
		mv.addObject("borderSize","&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;"
				+ "&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;"
				);
		
		List<LocationReservation> list=service.selectList();
		
		System.out.println(list);
		mv.addObject("list",list);
		mv.setViewName("mypage/reservationList");
		
		return mv;
	}
	
	
	
	
	
	
}
