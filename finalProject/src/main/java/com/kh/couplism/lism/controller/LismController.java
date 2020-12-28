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
import com.kh.couplism.lism.model.service.LismService;
import com.kh.couplism.location.model.service.LocationService;
import com.kh.couplism.location.model.vo.Location;
import com.kh.couplism.location.model.vo.LocationMain;

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
	public ModelAndView moveLism(ModelAndView mv) {
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
	@RequestMapping("/lism/selectDate")
	@ResponseBody
	public void selectDate(HttpServletRequest request,HttpServletResponse res,@RequestParam Map param) throws JsonIOException, IOException {
		request.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		
		System.out.println(param.get("lismDate"));
		
		String date=String.valueOf(param.get("lismDate"));
		System.out.println(date);
		System.out.println(date.substring(2));
		List<Location> list=service.selectDate(date);
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
	
}
