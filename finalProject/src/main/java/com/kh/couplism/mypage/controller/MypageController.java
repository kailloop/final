package com.kh.couplism.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.couplism.common.PageBarFactory;
import com.kh.couplism.community.model.vo.Coupon;
import com.kh.couplism.location.model.vo.LocationReservation;
import com.kh.couplism.mypage.model.service.MypageService;

@Controller
public class MypageController {

	@Autowired
	private MypageService service;
	
	@Autowired
	private Logger logger;
	//일반회원(+네이버회원,+카카오회원)마이페이지 이동하는 메소드
	@RequestMapping("/mypage/userMypage.do")
	public ModelAndView userMypage(ModelAndView mv) {
		mv.addObject("logoPath","/resources/images/mypagelogo.jpg");
		mv.addObject("titleHan","한글 타이틀");
		mv.addObject("titleEng","MY PAGE");
		mv.addObject("borderSize","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				);
		mv.setViewName("mypage/userMypage");
		return mv;
	}
	
	//파트너회원 마이페이지 이동하는 메소드
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
	
	//관리자(admin) 마이페이지 이동하는 메소드
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
	
	//유저마이페이지 예약내역 이동하는 메소드
	@RequestMapping("/reservation")
	public ModelAndView reservation(ModelAndView mv,
							@RequestParam(value="idvalue") String idv) {
		mv.addObject("logoPath","/resources/images/mypagelogo.jpg");
		mv.addObject("titleHan","한글 타이틀");
		mv.addObject("titleEng","Reservation");
		mv.addObject("borderSize","&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;"
				+ "&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;"
				);
		
		System.out.println("idvalue값 : "+idv);
		
		
		List<LocationReservation> list=service.selectList(idv);
		System.out.println(list);
		
		mv.addObject("idvalue",idv);
		mv.addObject("list",list);
		mv.setViewName("mypage/reservationList");
		
		
		return mv;
	}
	
	//유저마이페이지 쿠폰함 이동하는 메소드
	@RequestMapping("/conponList")
	public ModelAndView couponList(ModelAndView mv,
					@RequestParam(value="idvalue") String idvalue,
					@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, 
					@RequestParam(value="numPerPage", required=false, defaultValue="5") int numPerPage) {
		mv.addObject("logoPath","/resources/images/mypagelogo.jpg");
		mv.addObject("titleHan","쿠폰함");
		mv.addObject("titleEng","Coupon");
		mv.addObject("borderSize","&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;");
		
		List<Coupon> list=service.couponList(idvalue,cPage,numPerPage);
		int totalData=service.selectCount(idvalue);
		
		mv.addObject("list",list);
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalData, cPage, numPerPage, "couponList"));
		mv.addObject("totalData",totalData);
		mv.setViewName("mypage/couponList");
		return mv;
	}
	
	
	
}
