package com.kh.couplism.location.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.couplism.location.model.service.LocationService;
import com.kh.couplism.location.model.vo.Location;
import com.kh.couplism.location.model.vo.LocationFile;
import com.kh.couplism.location.model.vo.LocationMain;
import com.kh.couplism.location.model.vo.LocationPrice;
import com.kh.couplism.location.model.vo.Review;

@Controller
public class LocationController {

	@Autowired
	private Logger logger;
	@Autowired
	private LocationService service;
	
	
	@RequestMapping("/moveLocation/category")
	public ModelAndView category(ModelAndView mv,@RequestParam(value="address")String location) {
		
		 mv.addObject("logoPath","/resources/images/category.jpg");
	      
	      mv.addObject("titleHan","전체 카테고리");
	      mv.addObject("titleEng","Choose Your Memory");
	      mv.addObject("borderSize","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
	            + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
	            + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
	            + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
	            + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
	            + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
	      
	      System.out.println(location);
	      mv.addObject("address",location);
	      mv.setViewName("location/category");
	      
	      
		
		return mv;
	}
	
	@RequestMapping("/moveLocation")
	   public ModelAndView moveLocation(ModelAndView mv) {
	      
	      mv.addObject("logoPath","/resources/images/location-Address.jpg");
	      
	      mv.addObject("titleHan","지역선택");
	      mv.addObject("titleEng","Select Your Harmony");
	      mv.addObject("borderSize","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
	            + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
	            + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
	            + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
	            + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
	            + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
	      
	      mv.setViewName("location/address");
	      
	      return mv;
	   }
	
	@RequestMapping("/enrollLocation")
	public ModelAndView enrollLocation(ModelAndView mv) {
		
		mv.addObject("logoPath","/resources/images/enroll-location.jpg");
		
		mv.addObject("titleHan","상점 등록");
		mv.addObject("titleEng","Create Your Shop");
		mv.addObject("borderSize","&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		
		mv.setViewName("location/enrollLocation");
		
		return mv;
	}
	
	@RequestMapping("/location")//로케이션 리스트 목록을 보여주는곳
	public ModelAndView location(
						 @RequestParam(value="address", defaultValue="", required=false) String address,
						 @RequestParam(value="keyword", defaultValue="", required=false) String keyword,
						 @RequestParam(value="category", defaultValue="", required=false) String category,
						 @RequestParam(value="cPage", defaultValue="1", required=false) int cPage,
						 @RequestParam(value="address")String location,
						 ModelAndView mv, HttpServletRequest request) {

		logger.debug("=======================================Location===========================================");
		logger.debug("category : " + category);
		logger.debug("address : " + address);
		logger.debug("keyword : " + keyword);
		logger.debug("cPage : " + cPage);
		
		
		
		
		Map<String, String> types = new HashMap();
		types.put("category", "%" + category + "%");
		types.put("address", "%" + address + "%");
		types.put("keyword", "%" + keyword + "%");
		
		logger.debug("types : " + types);
		
		int numPerPage = 15;
		RowBounds rb = new RowBounds((cPage - 1) * numPerPage, numPerPage);

		List<Location> locationList = service.locationList(types, rb);
		logger.debug("locatoin 갯수 : " + locationList.size());
		logger.debug("locationList : " + locationList);
		
		List<Map> list = new ArrayList();
		for(Location l : locationList) {
			logger.debug("l : "+l);
			logger.debug("l.getLocationNo() : "+l.getLocationNo());
			LocationMain locationMain = service.getLocationMain(l.getLocationNo());
			logger.debug("locationMain : "+locationMain);
			List<Review> rl = service.getLocationReview(l.getLocationNo());
			logger.debug("RewvieList lr : "+rl);
			int reviewTotal = 0;
			double review = 0.00;
			if(rl.size()>0) {
				for(Review lr : rl) {
				reviewTotal += lr.getReviewGrade();
				}
				review = reviewTotal/rl.size();
			}
			Double.parseDouble(String.format(Locale.KOREAN, "%.1f", review));
			Map<String,Object> locationMap = new HashMap();
			if(locationMain != null) {
				locationMap.put("locationMain", "resources/upload/locationMain/"+locationMain.getRenameName());
			}else {
				locationMap.put("locationMain", "");
			}
			
			locationMap.put("locationAddress",l.getLocationAddress());
			locationMap.put("locationStatus",l.getLocationStatus());
			locationMap.put("reviewCount",rl.size());
			locationMap.put("viewCount", l.getViewCount());
			locationMap.put("review",String.valueOf(review));
			locationMap.put("locationTitle",l.getLocationTitle());
			logger.debug("locationMap :"+locationMap);
			list.add(locationMap);
		}

		
		int totalData = service.locationCount(types);
		logger.debug("totalData : " + totalData);
		int totalPage = (int) Math.ceil((double) totalData / numPerPage);
		int pageBarSize = 5;
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;
		String pageBar = "";

		if (pageNo == 1) {
			pageBar = "<li class='page-item'>" + "<a class='page-link text-dark'aria-label='Previous'>"
					+ "<span aria-hidden='true'>&laquo;</span>" + "<span class='sr-only'>Previous</span>" + "</a>"
					+ "</li>";
		} else {
			pageBar = "<li class='page-item'>" + "<a class='page-link text-dark' href='" + request.getContextPath()
					+ "/location?cPage=" + (pageNo - 1) + "&category=" + category + "&address="
					+ address + "&keyword=" + keyword + "' aria-label='Previous'>"
					+ "<span aria-hidden='true'>&laquo;</span>" + "<span class='sr-only'>Previous</span>" + "</a>"
					+ "</li>";
		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (cPage == pageNo) {
				pageBar += "<li class='page-item'><a class='page-link text-dark'>" + pageNo + "</a></li>";
			} else {
				pageBar += "<li class='page-item'><a class='page-link text-dark' href='" + request.getContextPath()
						+ "/location?cPage=" + pageNo + "&category=" + category + "&address="
						+ address + "&keyword=" + keyword + "'>" + pageNo + "</a></li>";
			}
			pageNo++;
		}
		if (pageNo > totalPage) {
			pageBar += "<li class='page-item'>" + "<a class='page-link text-dark' aria-label='Next'>"
					+ "<span aria-hidden='true'>&raquo;</span>" + "<span class='sr-only'>Next</span>" + "</a>"
					+ "</li>";
		} else {
			pageBar += "<li class='page-item'>" + "<a class='page-link text-dark' href='" + request.getContextPath()
					+ "/gowith/search?cPage=" + pageNo + "&category=" + category + "&address="
					+ address + "&keyword=" + keyword + "' aria-label='Next'>"
					+ "<span aria-hidden='true'>&raquo;</span>" + "<span class='sr-only'>Next</span>" + "</a>"
					+ "</li>";
		}
		logger.debug(""+list);


		mv.addObject("address",address);
		mv.addObject("category",category);
		mv.setViewName("/location/list");
		mv.addObject("list", list);

		mv.addObject("pageBar", pageBar);

		mv.addObject("logoPath","/resources/images/locationmain.jpg");
		mv.addObject("titleHan","예약");
		mv.addObject("titleEng","Location");
		mv.addObject("borderSize","&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;");
		
		logger.debug("==========================================================================================");

		return mv;

	}

	@RequestMapping("/location/check")
	public String check() {
		return "/location/check";
	}

	@RequestMapping("checkDate")
	public void checkDate() {
		int result = service.checkDate(new Date());
		System.out.println(result);

		List<Date> dateList = service.getDate();
		for (Date d : dateList) {
			System.out.println(d);
		}
	}

	@RequestMapping("location/create")
	public String createLocation() {// 로케이션 생성 페이지로 이동
		return "/location/create";
	}

	@RequestMapping("location/createEnd")
	public ModelAndView createLocationEnd(ModelAndView mv, MultipartFile mainFile, List<MultipartFile> locationFile, Location location, 
			@RequestParam(value="locationTime")String[] locationTime, 
			@RequestParam(value="locationDay")String[] locationDay, 
			@RequestParam(value="locationPeople")String[] locationPeople,HttpServletRequest request) {
		logger.debug(
				"=============================================LocationCreate=============================================");
		location.setLocationCreator("admin");
		logger.debug("location : " + location);
		int locationResult = service.insertLocation(location);// location DB에 등록
		logger.debug("locationResult : " + locationResult);
		logger.debug("locationNo : " + location.getLocationNo());
		int locationMainResult = 0;
		int locationFileResult = 0;
		if (locationResult > 0) {// 정상적으로 location이 DB에 등록이 되었을때
			String saveDirMain = request.getServletContext().getRealPath("/resources/upload/locationMain");
			logger.debug("locationMain file명 : " + mainFile.getOriginalFilename());
			logger.debug("locationMain file Size : " + mainFile.getSize());
			String originalFileName = mainFile.getOriginalFilename();
			String ext = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HHmmssSSS");
			int randomNum = (int) (Math.random() * 1000);
			String renamedFileName = "Couplism-Location-Main-" + sdf.format(new Date(System.currentTimeMillis())) + "_"
					+ randomNum + "." + ext;
			logger.debug("변경된 파일이름 " + renamedFileName);
			try {
				mainFile.transferTo(new File(saveDirMain + "/" + renamedFileName));// 파일을 저장
				logger.debug("파일 등록성공!");
				// 파일을 db에 등록하는 로직작성
				LocationMain lm = new LocationMain(location.getLocationNo(), mainFile.getOriginalFilename(),
						renamedFileName);
				logger.debug("LocationMain : " + lm);
				locationMainResult = service.insertLocationMain(lm);
				String fileCheck = "실패";
				if (locationMainResult > 0) {
					fileCheck = "성공";
				}
				logger.debug("파일 등록결과 LocationMain : " + fileCheck);
			} catch (IOException e) {
				e.printStackTrace();
			}
			logger.debug("locationFile Size : "+locationFile.size());
			String saveDirFile = request.getServletContext().getRealPath("/resources/upload/location");
			for (MultipartFile mf : locationFile) {
				if (!mf.isEmpty()) {// mf.isEmpty()
					logger.debug("file명 : " + mf.getOriginalFilename());
					logger.debug("file Size : " + mf.getSize());
					String mforiginalFileName = mf.getOriginalFilename();
					String mfext = mforiginalFileName.substring(mforiginalFileName.lastIndexOf(".") + 1);
					SimpleDateFormat mfsdf = new SimpleDateFormat("yyyy-MM-dd-HHmmssSSS");
					int mfrandomNum = (int) (Math.random() * 1000);
					String mfrenamedFileName = "Couplism-location-File-"
							+ mfsdf.format(new Date(System.currentTimeMillis())) + "_" + mfrandomNum + "." + mfext;
					logger.debug("변경된 파일이름 " + mfrenamedFileName);
					try {
						mf.transferTo(new File(saveDirFile + "/" + mfrenamedFileName));// 파일을 저장
						logger.debug("파일 등록성공!");
						// 파일을 db에 등록하는 로직작성
						LocationFile lf = new LocationFile(location.getLocationNo(), mf.getOriginalFilename(),
								mfrenamedFileName);
						logger.debug("locationFile : " + lf);
						locationFileResult = service.insertLocationFile(lf);
						String fileCheck = "실패";
						if (locationFileResult > 0) {
							fileCheck = "성공";
						}
						logger.debug("파일 등록결과 LocationFile : " + fileCheck);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
			logger.debug("locationTime Size : "+locationTime.length);
			logger.debug("locationDay Size : "+locationDay.length);
			logger.debug("locationPeople Size : "+locationPeople.length);
			
			for(int i = 0; i<locationTime.length; i++) {//시간 순서별로 정리 필요함
				logger.debug(locationTime[i]);
				logger.debug(locationDay[i]);
				logger.debug(locationPeople[i]);
				LocationPrice lp = new LocationPrice(location.getLocationNo(),locationTime[i],locationDay[i],5600,Integer.parseInt(locationPeople[i]));
				logger.debug("LocationPrice : "+lp);
				int Result = service.insertLocationPrice(lp);
				logger.debug("결과 : "+Result);
			}
		}

		logger.debug("mainFile : " + mainFile.getOriginalFilename());
		logger.debug("locationFile : " + locationFile);
		logger.debug(
				"========================================================================================================");

		return mv;
	}
	
	@RequestMapping("/location/checks")
	public String checks(){
		return "location/checks";
	}
}
