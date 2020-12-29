package com.kh.couplism.anniversary.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.kh.couplism.anniversary.model.service.AnniversaryService;
import com.kh.couplism.anniversary.model.vo.Anniversary;
import com.kh.couplism.anniversary.model.vo.Calendar;
import com.kh.couplism.common.PageBarFactory;
import com.kh.couplism.community.model.vo.Event;
import com.kh.couplism.location.model.vo.Location;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;



@Controller
public class AnniversaryController {
	
	
	@Autowired
	private AnniversaryService service;
	
	@Autowired
	private Logger logger;
	
	@RequestMapping("/anniversary/anniversarySearch.do")
	public ModelAndView anniversarySearch(ModelAndView mv,
					@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, 
					@RequestParam(value="numPerPage", required=false, defaultValue="10") int numPerPage) {
		mv.addObject("logoPath","/resources/images/anni/annilogo.jpg");
		mv.addObject("titleHan","기념일 예약");
		mv.addObject("titleEng","ANNIVERSARY");
		mv.addObject("borderSize","&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;");
		mv.setViewName("anniversary/anniversarySearch");
		
		List<Anniversary> list=service.anniversaryList(cPage,numPerPage);
		int totalData=service.selectCount();
		
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalData, cPage, numPerPage, "anniversarySearch.do"));
		mv.addObject("totalData",totalData);
		mv.addObject("list",list);
		return mv;
	}
	
	@RequestMapping("/anniversary/myCalendar.do")
	public ModelAndView myCalendar(ModelAndView mv,Calendar cal,
						@RequestParam(value="idvalue") String idv) {
		mv.addObject("logoPath","/resources/images/mypagelogo.jpg");
		mv.addObject("titleHan","한글 타이틀");
		mv.addObject("titleEng","MY CALENDAR");
		mv.addObject("borderSize","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		mv.setViewName("anniversary/myCalendar");
		
		List<Calendar> list=service.selectList(idv);
		System.out.println(list);
		System.out.println(idv);
		
		
		JSONArray jsonList=new JSONArray();
		System.out.println(list.size());
		
		mv.addObject("idv",idv);
		mv.addObject("list",list);
		mv.addObject("listsize",list.size());
		
		
		mv.addObject("jsonList",jsonList.fromObject(list));
		System.out.println(jsonList.fromObject(list));
		
		return mv;
	}
	
	
	
	//anniversary 글쓰기 이동해서 사업장리스트 보여주는 메소드
	@RequestMapping("/anniWrite")
	public ModelAndView anniWrite(ModelAndView mv,
					@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, 
					@RequestParam(value="numPerPage", required=false, defaultValue="5") int numPerPage,
					@RequestParam(value="userId") String userId) {
		mv.addObject("logoPath","/resources/images/anni/annilogo.jpg");
		mv.addObject("titleHan","기념일 등록");
		mv.addObject("titleEng","ANNIVERSARY WRITE");
		mv.addObject("borderSize","&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;");
		mv.setViewName("anniversary/anniversaryWrite");
		
		List<Location> locationList=service.locationList(userId,cPage, numPerPage);
		int totalData=service.locationCount(userId);
		
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalData, cPage, numPerPage, "anniversarySearch.do"));
		mv.addObject("totalData",totalData);
		mv.addObject("locationList",locationList);
		
		return mv;
	}
	
	
	//anniversary 글쓰기 이동한 다음 사업장리스트에서 선택 후 보여주는 메소드
	@RequestMapping("/anniWriteDetail")
		public ModelAndView anniWriteDetail(ModelAndView mv,@RequestParam(value="locationNo") int locationNo) {
			mv.addObject("logoPath","/resources/images/anni/annilogo.jpg");
			mv.addObject("titleHan","기념일 등록");
			mv.addObject("titleEng","ANNIVERSARY WRITE");
			mv.addObject("borderSize","&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;");
			mv.setViewName("anniversary/anniversaryWriteDetail");
			
			Location location=service.selectLocation(locationNo);
			System.out.println(location);
			mv.addObject("location",location);
			mv.addObject("locationNo",locationNo);
			return mv;
	}
		
	//글쓰기 메소드
	@RequestMapping("/anniversaryWriteEnd")
	public ModelAndView anniversaryWriteEnd(ModelAndView mv,Anniversary anniversary,HttpServletRequest request,
							@RequestParam(value="locationNo") int locationNo) {
		
		logger.debug("No:"+anniversary.getLocationNo());
		
		logger.debug("Type:"+anniversary.getAnniversaryType());
		
		//anniversaryPrice배열
		String[] arr = request.getParameterValues("anniversaryPrice");
		int[] intarr=new int[arr.length];
		for(int i=0;i<arr.length;i++) {
			intarr[i]=Integer.parseInt(arr[i]);
		}
		//anniversaryType배열
		String[] typearr=request.getParameterValues("anniversaryType");
		//anniversaryDate배열
		String[] dayarr=request.getParameterValues("anniversaryDate");
		//anniversaryTime배열
		String[] timearr=request.getParameterValues("anniversaryTime");
		//anniversaryPeople배열
		String[] peoplearr = request.getParameterValues("anniversaryPeople");
		int[] peopleintarr=new int[peoplearr.length];
		for(int i=0;i<peoplearr.length;i++) {
			peopleintarr[i]=Integer.parseInt(peoplearr[i]);
		}
		//anniversaryContent배열
		String[] contentarr=request.getParameterValues("anniversaryContent");
		
		for(int i=0;i<intarr.length;i++) {
			System.out.println("intarr["+i+"]"+intarr[i]);
			System.out.println("typearr["+i+"]"+typearr[i]);
			System.out.println("dayarr["+i+"]"+dayarr[i]);
			System.out.println("timearr["+i+"]"+timearr[i]);
			System.out.println("peopleintarr["+i+"]"+peopleintarr[i]);
			System.out.println("contentarr["+i+"]"+contentarr[i]);
			anniversary=new Anniversary(0,anniversary.getLocationNo(),1,intarr[i],dayarr[i],typearr[i],timearr[i],peopleintarr[i],contentarr[i]);
			int result=0;
			try {
				result=service.insertAnniversary(anniversary);
			}catch(RuntimeException e) {
				System.out.println("입력실패");
				e.printStackTrace();
			}
			System.out.println(result);
			mv.addObject("msg",result>0?"기념일 등록성공":"기념일 등록실패");
			mv.addObject("loc","/anniversary/anniversarySearch.do");
			mv.setViewName("common/msg");
		}
		
		return mv;
	}
	
	
	
	//일반회원 anniversary글쓰기 이동만 메소드
		@RequestMapping("/anniWriteMember")
		public ModelAndView anniWriteMember(ModelAndView mv,
				@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, 
				@RequestParam(value="numPerPage", required=false, defaultValue="5") int numPerPage) {
			mv.addObject("logoPath","/resources/images/anni/annilogo.jpg");
			mv.addObject("titleHan","기념일 등록");
			mv.addObject("titleEng","ANNIVERSARY WRITE");
			mv.addObject("borderSize","&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;");
			mv.setViewName("anniversary/anniversaryWriteMember");
			
			List<Location> lookList=service.lookList(cPage, numPerPage);
			int totalData=service.lookCount();
			
			mv.addObject("pageBar",PageBarFactory.getPageBar(totalData, cPage, numPerPage, "anniversarySearch.do"));
			mv.addObject("totalData",totalData);
			mv.addObject("lookList",lookList);
			return mv;
		}
	
	
	
	/*
	 * @RequestMapping("/calendarValue") public ModelAndView
	 * calendarValue(ModelAndView mv,
	 * 
	 * @RequestParam(value="idvalue") String idv) {
	 * 
	 * 
	 * 
	 * 
	 * 
	 * return mv; }
	 */

}
