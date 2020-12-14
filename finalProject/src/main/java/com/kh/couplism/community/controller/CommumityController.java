package com.kh.couplism.community.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.couplism.community.model.service.CommunityService;
import com.kh.couplism.community.model.vo.Event;
import com.sun.corba.se.impl.util.Utility;


@Controller
public class CommumityController {
	
		@Autowired
		private CommunityService service;
		
		@Autowired
		private Logger logger;
		
	
	@RequestMapping("/faq/faqList.do")
	public ModelAndView faqList(ModelAndView mv) {
		mv.addObject("logoPath","/resources/images/faq.jpg");
		mv.addObject("titleHan","편리한 홈페이지 이용을위해 자주하는 질문을 알려드립니다");
		mv.addObject("titleEng","FAQ");
		mv.addObject("borderSize","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				);
		mv.setViewName("community/faq/faqList");
		return mv;
	}
	
	@RequestMapping("/event/eventList.do")
	public ModelAndView eventList(ModelAndView mv) {
		mv.addObject("logoPath","/resources/images/eventlogo.jpg");
		mv.addObject("titleHan","이벤트");
		mv.addObject("titleEng","EVENT");
		mv.addObject("borderSize","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		
		List<Event> list=service.selectList();
		
		mv.addObject("list",list);
		
		
		
		mv.setViewName("community/event/eventList");
		return mv;
	}
	
	
	@RequestMapping("/eventView")
	public ModelAndView eventView(ModelAndView mv,
				@RequestParam(value="eventNo") int eventNo) {
		mv.addObject("logoPath","/resources/images/eventlogo.jpg");
		mv.addObject("titleHan","이벤트 상세");
		mv.addObject("titleEng","Event View");
		mv.addObject("borderSize","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		
		Event e=service.selectEvent(eventNo);
		System.out.println(e);
		mv.addObject("event",e);
		
		mv.setViewName("community/event/eventView");
		return mv;
	}
	
	
//	글쓰기 이동만하는 메소드
	@RequestMapping("/eventWrite")
	public ModelAndView eventWrite(ModelAndView mv) {
		mv.addObject("logoPath","/resources/images/eventlogo.jpg");
		mv.addObject("titleHan","이벤트 작성");
		mv.addObject("titleEng","Event Write");
		mv.addObject("borderSize","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		mv.setViewName("community/event/eventWrite");
		return mv;
	}
	
	
	@RequestMapping("/eventWriteEnd")
	public ModelAndView eventWriteEnd(ModelAndView mv,HttpServletRequest request,MultipartFile mf){
		String path=request.getServletContext().getRealPath("/resources/upload/event");
		
		
		Event e=new Event();
		int result=service.insertEvent(e);
		System.out.println(result);
		
		mv.addObject("result",result);
		mv.setViewName("community/event/eventList");
		
		
		return mv;
	}
	
}
