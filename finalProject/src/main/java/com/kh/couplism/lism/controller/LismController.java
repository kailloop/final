package com.kh.couplism.lism.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.couplism.common.PageBarFactory;
import com.kh.couplism.lism.model.service.LismService;
import com.kh.couplism.lism.model.vo.Lism;
import com.kh.couplism.lism.model.vo.LismDetail;
import com.kh.couplism.lism.model.vo.LismLikeCount;
import com.kh.couplism.location.model.service.LocationService;
import com.kh.couplism.location.model.vo.Location;
import com.kh.couplism.location.model.vo.LocationMain;
import com.kh.couplism.location.model.vo.LocationReservation;

@Controller
public class LismController {
	
	@Autowired
	private Logger logger;
	
	@Autowired
	private LismService service;
	
	@Autowired
	private LocationService LService;
	
	/*@Autowired
	private LismService service;*/
	
	@RequestMapping("/moveLism")
	public ModelAndView moveLism(ModelAndView mv,
            @RequestParam(value="cPage", required=false, defaultValue="1") int cPage, 
            @RequestParam(value="numPerPage", required=false, defaultValue="10") int numPerPage) {
		mv.addObject("logoPath","/resources/images/lism.jpg");
		mv.addObject("titleHan","당신의 계획 '리즘'과 함께하세요");
		mv.addObject("titleEng","Always Together Your Lism");
		mv.addObject("borderSize","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		
		List<Lism> list=service.lismOpenList(cPage,numPerPage);
		
		int totalData=service.lismOpenListCount();
		
		mv.addObject("list",list);
        
        mv.addObject("pageBar",PageBarFactory.getPageBar(totalData, cPage, numPerPage, "moveLism"));
        mv.addObject("totalData",totalData);
		
		mv.setViewName("lism/lismMain");
		return mv;
	}
	
	@RequestMapping("/lism/create")
	public ModelAndView createLism(ModelAndView mv) {
		
		mv.addObject("logoPath","/resources/lism/lism-create.jpg");
		mv.addObject("titleHan","추억을 담아보세요");
		mv.addObject("titleEng","Create Your Lism");
		mv.addObject("borderSize","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		
		mv.setViewName("lism/create");
		
		
		
		return mv;
	}
	@RequestMapping("/lism/detail")
	public ModelAndView lismDetail(ModelAndView mv,@RequestParam Map param) {
		
		mv.addObject("logoPath","/resources/lism/lism-detail.jpg");
		mv.addObject("titleHan","코스로 보는 추억");
		mv.addObject("titleEng","Detail your Lism");
		mv.addObject("borderSize","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		
		Lism lism=service.selectOneNo(param);
		
		mv.addObject("lism",lism);
		
		System.out.println(lism);
		
		
		int count=service.selectDetailCount(lism.getLismNo());
		
		mv.addObject("count",count);
		
		
		mv.setViewName("lism/detail");
		
		return mv;
	}
	
	@RequestMapping("/lism/detailList")
	@ResponseBody
	public void lismDetailList(@RequestParam Map param,HttpServletRequest req,HttpServletResponse res) throws JsonIOException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		
		int lismNo=Integer.parseInt(String.valueOf(param.get("lismNo")));
		
		List<LismDetail> list=service.selectDetail(lismNo);
		System.out.println(list);
		
		new Gson().toJson(list,res.getWriter());
	}
	
	@RequestMapping("/lism/createEnd")
	public ModelAndView createEnd(ModelAndView mv,@RequestParam Map param) {
		//lism
		param.get("title");
		param.get("lismDate");
		System.out.println(param.get("lismTable"));
		System.out.println(param.get("creator"));
		int result=service.createEnd(param);
		Lism lism=service.selectOneLism(param);
		if(result>0) {
			//lismPicker
			int length=Integer.parseInt(String.valueOf(param.get("lismTable")));
			System.out.println(length);
			for(int i=0;i<(length+1);i++) {
				String name=(String)param.get("contentName"+i);
				String time=(String)param.get("contentTime"+i);
				int no=Integer.parseInt(String.valueOf(param.get("contentNo"+i)));
				System.out.println(no);
				System.out.println(name);
				System.out.println(time);
				if(name!=null&&time!=null) {
					param.put("name", name);
					param.put("time", time);
					param.put("no",no);
					param.put("lismNo",String.valueOf(lism.getLismNo()));
					System.out.println(param.get("name"));
					System.out.println(param.get("time"));
					System.out.println(param.get("no"));
					System.out.println(param.get("lismNo"));
					int subResult=service.enrollPicker(param);
				}else {
					
				}
			}
		}
		
		
		
		mv.addObject("logoPath","/resources/images/lism.jpg");
		mv.addObject("titleHan","당신의 계획 '리즘'과 함께하세요");
		mv.addObject("titleEng","Always Together Your Lism");
		mv.addObject("borderSize","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		
		mv.setViewName("lism/lismMain");
		
		
		return mv;
	}
	
	@RequestMapping("/lism/selectDate")
	@ResponseBody
	public void selectDate(HttpServletRequest request,HttpServletResponse res,@RequestParam Map param) throws JsonIOException, IOException {
		request.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		
		System.out.println(param.get("lismDate"));
		System.out.println(param.get("id"));
		
		String date=String.valueOf(param.get("lismDate"));
		List<Location> list=service.selectDate(param);
		System.out.println("리스트 : "+list);
		
		new Gson().toJson(list,res.getWriter());
	}
	
	@RequestMapping("/lism/getLocationMain")
	@ResponseBody
	public String getLocationMain(@RequestParam Map param,HttpServletRequest req,HttpServletResponse res) throws JsonIOException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		System.out.println(req.getParameter("parseData"));
		System.out.println(param.get("parseData"));
		LocationMain lm=LService.getLocationMain(Integer.parseInt((String) param.get("parseData")));
		System.out.println(lm);
		return lm.getRenameName();
	}
	
	@RequestMapping("/lism/getReservationNo")
	@ResponseBody
	public void getReservationNo(HttpServletRequest req,HttpServletResponse resp,@RequestParam Map param) throws JsonIOException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		String date=String.valueOf(param.get("lismDate"));
		
		List<LocationReservation> list=service.getReservationNo(param);
		
		System.out.println("리스트 : "+list);
		
		new Gson().toJson(list,resp.getWriter());
	}
	
	@RequestMapping("/lism/getReservationOne")
	@ResponseBody
	public void getReservationOne(HttpServletRequest req,HttpServletResponse res,@RequestParam Map param) throws JsonIOException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		
		System.out.println(param.get("date"));
		System.out.println(param.get("id"));
		System.out.println(param.get("time"));
		LocationReservation lr=service.getReservationOne(param);
		System.out.println(lr);
		
		new Gson().toJson(lr,res.getWriter());
	}
	
	@RequestMapping("/lism/getLocationOne")
	@ResponseBody
	public void getLocationOne(HttpServletRequest req,HttpServletResponse res,@RequestParam Map param) throws JsonIOException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		
		Location loc=service.getLocationOne(param);
		
		new Gson().toJson(loc,res.getWriter());
	}
	
	@RequestMapping("/lism/Like")
	@ResponseBody
	public String addLike(HttpServletRequest req,HttpServletResponse res,@RequestParam Map param) throws JsonIOException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		
		String msg="";
		LismLikeCount like=service.checkLike(param);
		
		if(like!=null) {
			
			msg="이미 추천하신 리즘입니다!";
			return msg;
		}else {
			int result=service.enrollLike(param);
			if(result>0) {
				msg="해당 Lism을 추천하셨습니다!";
				int likeCount=service.selectLikeCount(param);
				param.put("count", likeCount);
				int update=service.updateLike(param);
				return msg;
			}
			msg="오류가 발생하였습니다 관리자에게 문의해주세요";
			return msg;
		}
	}
	
	@RequestMapping("/lism/delete")
	public ModelAndView lismDelete(ModelAndView mv,@RequestParam Map param) {
		System.out.println(param.get("lismNo"));
		
		int result=service.lismDelete(param);
		if(result>0) {
			int subResult=service.lismPickerDelete(param);
			if(subResult>0) {
				
				
				mv.setViewName("redirect:/moveLism");
			}
		}
			
			mv.setViewName("redirect:/moveLism");
		return mv;
	}
	
	@RequestMapping("/lism/selectLike")
	@ResponseBody
	public int selectLike(HttpServletRequest req,HttpServletResponse res,@RequestParam Map param) throws UnsupportedEncodingException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		
		int count=service.selectLikeCount(param);
		
		return count;
	}
	@RequestMapping("/lism/deletePickerOne")
	@ResponseBody
	public void deletePickerOne(HttpServletRequest req,HttpServletResponse res,@RequestParam Map param) throws UnsupportedEncodingException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		
		service.deletePickerOne(param);
	}
	
	@RequestMapping("/lism/update")
	public ModelAndView updateLism(ModelAndView mv,@RequestParam Map param) {
		
		mv.addObject("logoPath","/resources/lism/lism-update.jpg");
		mv.addObject("titleHan","계획을 수정하세요");
		mv.addObject("titleEng","Modify Your Lism");
		mv.addObject("borderSize","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		
		Lism lism=service.selectOneNo(param);
		
		mv.addObject("lism",lism);
		
		int count=service.selectDetailCount(lism.getLismNo());
		
		mv.addObject("count",count);
		
		mv.setViewName("lism/update");
		
		return mv;
	}
	
	@RequestMapping("/lism/updateEnd")
	public ModelAndView updateEnd(ModelAndView mv,@RequestParam Map param) {
		
		int result=service.updateLismEnd(param);
		
		mv.setViewName("redirect:/moveLism");
		
		return mv;
	}
	
	
	
}
