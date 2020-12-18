package com.kh.couplism.community.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.couplism.common.PageBarFactory;
import com.kh.couplism.community.model.service.CommunityService;
import com.kh.couplism.community.model.vo.Coupon;
import com.kh.couplism.community.model.vo.Event;


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
		mv.addObject("borderSize","&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;");
		mv.setViewName("community/faq/faqList");
		return mv;
	}
	
	@RequestMapping("/event/eventList.do")
	public ModelAndView eventList(ModelAndView mv,
						@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, 
						@RequestParam(value="numPerPage", required=false, defaultValue="9") int numPerPage) {
		mv.addObject("logoPath","/resources/images/eventlogo.jpg");
		mv.addObject("titleHan","이벤트");
		mv.addObject("titleEng","EVENT");
		mv.addObject("borderSize","&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;");
		
		List<Event> list=service.selectList(cPage,numPerPage);
		int totalData=service.selectCount();
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalData, cPage, numPerPage, "boardList.do"));
		mv.addObject("totalData",totalData);
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
		mv.addObject("borderSize","&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;");
		
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
		mv.addObject("borderSize","&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;");
		mv.setViewName("community/event/eventWrite");
		return mv;
	}
	
	
	@RequestMapping("/eventWriteEnd")
	public ModelAndView eventWriteEnd(ModelAndView mv,MultipartFile img,Event event,HttpServletRequest request){
		
		logger.debug("파일명:"+img.getOriginalFilename());
		logger.debug("파일크기:"+img.getSize());
		logger.debug("작성자:"+event.getEventWriter());
		logger.debug("제목:"+event.getEventTitle());
		logger.debug("가격:"+event.getCouponPrice());
		logger.debug("내용:"+event.getEventContent());
		
		String saveDir=request.getServletContext().getRealPath("/resources/upload/event");
		File dir=new File(saveDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		if(!img.isEmpty()) {
			String original=img.getOriginalFilename();
			String ext=original.substring(original.lastIndexOf(".")+1);
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
			int random=(int)(Math.random()*100);
			String rename="evnet"+sdf.format(new Date(System.currentTimeMillis()))+random+"."+ext;
			try {
				img.transferTo(new File(saveDir+"/"+rename));
			}catch(IOException e) {
				e.printStackTrace();
			}
			event=new Event(0,event.getEventTitle(),event.getEventWriter(),event.getEventContent(),original,rename,event.getCouponPrice());
		}
		int result=0;
		try {
			result=service.insertEvent(event);
		}catch(RuntimeException e) {
			System.out.println("입력실패!");
			e.printStackTrace();
		}
		System.out.println(result);
		mv.addObject("msg",result>0?"게시글 등록":"게시글 등록실패");
		mv.addObject("loc","/event/eventList.do");
		mv.setViewName("common/msg");
		return mv;
	}
	
	
	
	@RequestMapping("/eventRemove")
	public ModelAndView eventremove(ModelAndView mv, @RequestParam(value="eventNo") int eventNo) {
	
		int result=service.eventRemove(eventNo);
		mv.setViewName("redirect:/event/eventList.do");

		return mv;
	}
	
	
	
	
	
//	글수정 이동하는 메소드
	@RequestMapping("/eventUpdate")
	public ModelAndView eventUpdate(ModelAndView mv, @RequestParam(value="eventNo") int eventNo) {
		mv.addObject("logoPath","/resources/images/eventlogo.jpg");
		mv.addObject("titleHan","이벤트 수정");
		mv.addObject("titleEng","Event Update");
		mv.addObject("borderSize","&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;");
		
		Event e=service.selectEventOne(eventNo);
		
		mv.addObject("event",e);
		mv.setViewName("community/event/eventUpdate");
		return mv;
	}
	
	@RequestMapping("/eventUpdateEnd")
	public ModelAndView eventUpdateEnd(ModelAndView mv,MultipartFile img,Event event,HttpServletRequest request,
								@RequestParam(value="eventNo") int eventNo) {
		logger.debug("파일명:"+img.getOriginalFilename());
		logger.debug("파일크기:"+img.getSize());
		logger.debug("작성자:"+event.getEventWriter());
		logger.debug("제목:"+event.getEventTitle());
		logger.debug("가격:"+event.getCouponPrice());
		logger.debug("내용:"+event.getEventContent());
		
		
		
		String saveDir=request.getServletContext().getRealPath("/resources/upload/event");
		File dir=new File(saveDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		if(!img.isEmpty()) {
			String original=img.getOriginalFilename();
			String ext=original.substring(original.lastIndexOf(".")+1);
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
			int random=(int)(Math.random()*100);
			String rename="evnet"+sdf.format(new Date(System.currentTimeMillis()))+random+"."+ext;
			try {
				img.transferTo(new File(saveDir+"/"+rename));
			}catch(IOException e) {
				e.printStackTrace();
			}
			event=new Event(0,event.getEventTitle(),event.getEventWriter(),event.getEventContent(),original,rename,event.getCouponPrice());
		}
		
		int result=0;
		try {
			result=service.updateEvent(event);
			System.out.println(result);
		}catch(RuntimeException e) {
			System.out.println("입력실패");
			e.printStackTrace();
		}
		mv.addObject("msg",result>0?"게시글 수정":"게시글 수정실패");
		mv.addObject("loc","/event/eventList.do");
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	
	
//	쿠폰발급받고 창띄워주는 메소드
	@RequestMapping("/coupon")
	public ModelAndView coupon(ModelAndView mv,Coupon coupon,
						@RequestParam(value="eventNo") int eventNo,
						@RequestParam(value="couponPrice") int couponPrice,
						@RequestParam(value="eventTitle") String eventTitle,
						@RequestParam(value="couponId") String couponId) {
		
		logger.debug("이벤트인덱스:"+coupon.getEventNo());
		logger.debug("이벤트제목:"+coupon.getEventTitle());
		logger.debug("쿠폰받는아이디:"+coupon.getCouponId());
		logger.debug("쿠폰가격:"+coupon.getCouponPrice());
		
		coupon=new Coupon(coupon.getEventNo(),coupon.getEventTitle(),coupon.getCouponId(),coupon.getCouponPrice());
		int result=service.couponDown(coupon);
		/* Coupon c=service.couponSelect(eventNo); */
		
		mv.setViewName("community/event/coupon");
		return mv;
	}
}
