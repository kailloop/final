package com.kh.couplism.location.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.couplism.location.model.service.LocationService;
import com.kh.couplism.location.model.vo.Location;
import com.kh.couplism.location.model.vo.LocationMain;
import com.kh.couplism.location.model.vo.LocationPrice;
import com.kh.couplism.location.model.vo.LocationReservation;
import com.kh.couplism.location.model.vo.Review;

@Controller
public class LocationController {

	@Autowired
	private Logger logger;
	@Autowired
	private LocationService service;

	@RequestMapping("/moveLocation/category")
	public ModelAndView category(ModelAndView mv, @RequestParam(value = "address") String location) {

		mv.addObject("logoPath", "/resources/images/category.jpg");

		mv.addObject("titleHan", "전체 카테고리");
		mv.addObject("titleEng", "Choose Your Memory");
		mv.addObject("borderSize",
				"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
						+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
						+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
						+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
						+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
						+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");

		System.out.println(location);
		mv.addObject("address", location);
		mv.setViewName("location/category");

		return mv;
	}

	@RequestMapping("/moveLocation")
	public ModelAndView moveLocation(ModelAndView mv) {

		mv.addObject("logoPath", "/resources/images/location-Address.jpg");

		mv.addObject("titleHan", "지역선택");
		mv.addObject("titleEng", "Select Your Harmony");
		mv.addObject("borderSize",
				"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
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

		mv.addObject("logoPath", "/resources/images/enroll-location.jpg");

		mv.addObject("titleHan", "상점 등록");
		mv.addObject("titleEng", "Create Your Shop");
		mv.addObject("borderSize",
				"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
						+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
						+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
						+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
						+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");

		mv.setViewName("location/enrollLocation");

		return mv;
	}

	@RequestMapping("/location") // 로케이션 리스트 목록을 보여주는곳
	public ModelAndView location(@RequestParam(value = "address", defaultValue = "", required = false) String address,
			@RequestParam(value = "keyword", defaultValue = "", required = false) String keyword,
			@RequestParam(value = "category", defaultValue = "", required = false) String category,
			@RequestParam(value = "cPage", defaultValue = "1", required = false) int cPage,
			@RequestParam(value = "address") String location, ModelAndView mv, HttpServletRequest request) {

		logger.debug("=======================================Location===========================================");
		logger.debug("category : " + category);
		logger.debug("address : " + address);
		logger.debug("keyword : " + keyword);
		logger.debug("cPage : " + cPage);
		String[] addressf = address.split(" ");
		String[] addresss = null;
		if(addressf.length>1) {
			addresss = addressf[1].split("/");
		}
		
		Map<String, Object> types = new HashMap();
		types.put("category", "%" + category + "%");
		types.put("address", "%" + address + "%");
		types.put("keyword", "%" + keyword + "%");
		int numPerPage = 15;
		RowBounds rb = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		List<Location> locationList = null;
		for(String a : addressf) {
			logger.debug("addressf :"+a);
		}
		for(String a : addresss) {
			logger.debug("addresss :"+a);
		}
		
		
		int totalData = 0;
		if(addresss.length>1) {
			String[] addresssChange = new String[addresss.length];
			for(int i = 0; i>addresss.length; i++) {
				addresssChange[i] = "%"+addresss[i]+"%";
			}
			types.put("addresss", addresssChange);
			types.put("loopValue", "%"+addressf[0]+"%");
			//types.put("loopCount",addresssChange.length);
			locationList = service.locationListSplit(types,rb);
			totalData = service.locationCountSplit(types);
		}else {
			locationList = service.locationList(types, rb);
			totalData = service.locationCount(types);
		}
		
		//타입 들어오는거 처리 
		
		

		logger.debug("types : " + types);

		

		
		logger.debug("locatoin 갯수 : " + locationList.size());
		logger.debug("locationList : " + locationList);

		List<Map> list = new ArrayList();
		for (Location l : locationList) {
			logger.debug("l : " + l);
			logger.debug("l.getLocationNo() : " + l.getLocationNo());
			l.setLocationAddress(l.getLocationAddress().replace("/", " "));
			LocationMain locationMain = service.getLocationMain(l.getLocationNo());
			logger.debug("locationMain : " + locationMain);
			List<Review> rl = service.getLocationReview(l.getLocationNo());
			logger.debug("RewvieList lr : " + rl);
			int reviewTotal = 0;
			double review = 0.00;
			if (rl.size() > 0) {
				for (Review lr : rl) {
					reviewTotal += lr.getReviewGrade();
				}
				review = reviewTotal / rl.size();
			}
			Double.parseDouble(String.format(Locale.KOREAN, "%.1f", review));
			Map<String, Object> locationMap = new HashMap();
			if (locationMain != null) {
				locationMap.put("locationMain", "resources/upload/locationMain/" + locationMain.getRenameName());
			} else {
				locationMap.put("locationMain", "");
			}
			locationMap.put("locationNo", l.getLocationNo());
			locationMap.put("locationAddress", l.getLocationAddress());
			locationMap.put("locationStatus", l.getLocationStatus());
			locationMap.put("reviewCount", rl.size());
			locationMap.put("viewCount", l.getViewCount());
			locationMap.put("review", String.valueOf(review));
			locationMap.put("locationTitle", l.getLocationTitle());
			logger.debug("locationMap :" + locationMap);
			list.add(locationMap);
		}
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
					+ "/location?cPage=" + (pageNo - 1) + "&category=" + category + "&address=" + address + "&keyword="
					+ keyword + "' aria-label='Previous'>" + "<span aria-hidden='true'>&laquo;</span>"
					+ "<span class='sr-only'>Previous</span>" + "</a>" + "</li>";
		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (cPage == pageNo) {
				pageBar += "<li class='page-item'><a class='page-link text-dark'>" + pageNo + "</a></li>";
			} else {
				pageBar += "<li class='page-item'><a class='page-link text-dark' href='" + request.getContextPath()
						+ "/location?cPage=" + pageNo + "&category=" + category + "&address=" + address + "&keyword="
						+ keyword + "'>" + pageNo + "</a></li>";
			}
			pageNo++;
		}
		if (pageNo > totalPage) {
			pageBar += "<li class='page-item'>" + "<a class='page-link text-dark' aria-label='Next'>"
					+ "<span aria-hidden='true'>&raquo;</span>" + "<span class='sr-only'>Next</span>" + "</a>"
					+ "</li>";
		} else {
			pageBar += "<li class='page-item'>" + "<a class='page-link text-dark' href='" + request.getContextPath()
					+ "/gowith/search?cPage=" + pageNo + "&category=" + category + "&address=" + address + "&keyword="
					+ keyword + "' aria-label='Next'>" + "<span aria-hidden='true'>&raquo;</span>"
					+ "<span class='sr-only'>Next</span>" + "</a>" + "</li>";
		}

		logger.debug("" + list);

		mv.addObject("address", address);
		mv.addObject("category", category);
		mv.setViewName("/location/list");

		mv.addObject("list", list);

		mv.addObject("pageBar", pageBar);

		mv.addObject("logoPath", "/resources/images/locationmain.jpg");
		mv.addObject("titleHan", "예약");
		mv.addObject("titleEng", "Location");
		mv.addObject("borderSize", "&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;");

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
	public String createLocation(Model m) {// 로케이션 생성 페이지로 이동

		m.addAttribute("logoPath", "resources/images/create-location.jpg");
		m.addAttribute("borderSize",
				"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
						+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
						+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		m.addAttribute("titleHan", "내 상점 만들기");
		m.addAttribute("titleEng", "Create Your Shop");

		return "/location/create";
	}

	@RequestMapping("location/createEnd")
	public ModelAndView createLocationEnd(ModelAndView mv, MultipartFile mainFile, String[] locationPrice,
			Location location, HttpServletRequest request) {
		logger.debug(
				"=============================================LocationCreate=============================================");

		/*
		 * String locationContent = location.getLocationContent();// LocationContent가져옴
		 * String[] contentSplit = locationContent.split("<img alt=\"\" src=");// 경로로
		 * 스플릿함 List<String> imgPath = new ArrayList(); for(int i = 1;
		 * i>contentSplit.length; i=i+2) { String[] splitPath =
		 * contentSplit[i].split("\""); imgPath.add(splitPath[0]); }
		 * logger.debug("imgPath List : "+imgPath);//이미지파일의 경로를 받아옴
		 * 
		 * //imgPath에 파일들을 삭제하고 로케이션 폴더에 새로등록하는 로직 생성
		 * 
		 * for(String path : imgPath) { File moveFile = new File(path);
		 * logger.debug("파일존재 여부 : "+moveFile.exists()); String[] newFilePath =
		 * moveFile.getName().split("#");//newFilePath[2]으로 저장하면됨 File newFile = new
		 * File(request.getServletContext().getRealPath("/resources/upload/location/")+
		 * newFilePath[1]); if(moveFile.exists()) { boolean isMoved =
		 * moveFile.renameTo(newFile); logger.debug("파일 이동여부 : "+isMoved); } }
		 * 
		 * File imgFile = new File(request.getServletContext().getRealPath(
		 * "/resources/upload/locationCreate")); File[] imgFileList =
		 * imgFile.listFiles(); for(File f : imgFileList) { String[] fileName =
		 * f.getName().split("#"); if(fileName[0] == location.getLocationCreator()) {
		 * f.delete(); logger.debug("사용자 명으로 된 location 임시 파일 삭제 완료!"); } }
		 */

		/*
		 * location.setLocationCreator("admin");//???
		 */

		logger.debug("locationPrice : " + locationPrice);
		logger.debug("location : " + location);

		String locationContent = location.getLocationContent();// LocationContent가져옴
		logger.debug("locationContent : " + location.getLocationContent());
		String[] contentSplit = locationContent.split("src=");// 경로로 스플릿함
		if (contentSplit.length > 1) {

			logger.debug("contentSplit : " + contentSplit);
			logger.debug("contentSplit.length : " + contentSplit.length);
			List<String> imgPath = new ArrayList();
			for (int i = 1; i < contentSplit.length; i++) {
				logger.debug("contentSplit[" + i + "] : " + contentSplit[i]);
				logger.debug("for문 정상적으로 작동");
				logger.debug("contentSplit replace : " + contentSplit[i].replace("\"", "\\|"));
				String splitPatha = contentSplit[i].replace("\"", "\\|");
				String[] splitPath = splitPatha.split("\\|");
				logger.debug("splitPath[1] : " + splitPath[1]);
				String[] pathArr = splitPath[1].replace("\\", "").split("/");
				int lastIndex = pathArr.length - 1;
				imgPath.add(pathArr[lastIndex]);
				logger.debug("pathArr[lastIndex] : " + pathArr[lastIndex]);
			}
			logger.debug("imgPath Size : " + imgPath.size());
			logger.debug("imgPath List : " + imgPath);// 이미지파일의 경로를 받아옴

			// imgPath에 파일들을 삭제하고 로케이션 폴더에 새로등록하는 로직 생성

			for (String path : imgPath) {
				logger.debug("path : " + path);
				File moveFile = new File(
						request.getServletContext().getRealPath("/resources/upload/location-Write-ContentFile") + "/"
								+ path);
				logger.debug("파일존재 여부 : " + moveFile.exists());
				logger.debug("moveFile.getName() : " + moveFile.getName());
				String[] newFilePath = moveFile.getName().split("_");// newFilePath[2]으로 저장하면됨
				logger.debug("newFilePath length : " + newFilePath.length);
				logger.debug("newFilePath : " + newFilePath);

				File newFile = new File(
						request.getServletContext().getRealPath("/resources/upload/location") + "/" + newFilePath[1]);
				if (moveFile.exists()) {
					boolean isMoved = moveFile.renameTo(newFile);
					logger.debug("파일 이동여부 : " + isMoved);
				}

			}
			logger.debug("userId : " + location.getLocationCreator());
			File imgFile = new File(
					request.getServletContext().getRealPath("/resources/upload/location-Write-ContentFile"));
			File[] imgFileList = imgFile.listFiles();
			logger.debug("imgFileList.length() : " + imgFileList.length);
			for (File f : imgFileList) {// 이로직 로그인할때도 돌려줘야함 !!@#!@#
				String[] fileName = f.getName().split("_");
				logger.debug("fileName[0] : " + fileName[0]);
				logger.debug("fileName[1] : " + fileName[1]);
				if (fileName[0].equals(location.getLocationCreator())) {
					f.delete();
					logger.debug("사용자 명으로 된 location 임시 파일 삭제 완료!");
				}
			}

			// 이제 변경된경로로 noticeContent안에 src수정

			String pathReplace = location.getLocationContent().replace("location-Write-ContentFile", "location")
					.replace(location.getLocationCreator() + "_", "");
			logger.debug("변경된 noticeContent : " + pathReplace);
			location.setLocationContent(pathReplace);
		}
		logger.debug("location : " + location);
		int result = service.insertLocation(location);

		logger.debug("result : " + result);
		logger.debug("locationNo : " + location.getLocationNo());

		int locationMainResult;

		if (result > 0) {
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
			/*
			 * logger.debug("locationFile Size : "+locationFile.size()); String saveDirFile
			 * = request.getServletContext().getRealPath("/resources/upload/location"); for
			 * (MultipartFile mf : locationFile) { if (!mf.isEmpty()) {// mf.isEmpty()
			 * logger.debug("file명 : " + mf.getOriginalFilename());
			 * logger.debug("file Size : " + mf.getSize()); String mforiginalFileName =
			 * mf.getOriginalFilename(); String mfext =
			 * mforiginalFileName.substring(mforiginalFileName.lastIndexOf(".") + 1);
			 * SimpleDateFormat mfsdf = new SimpleDateFormat("yyyy-MM-dd-HHmmssSSS"); int
			 * mfrandomNum = (int) (Math.random() * 1000); String mfrenamedFileName =
			 * "Couplism-location-File-" + mfsdf.format(new
			 * Date(System.currentTimeMillis())) + "_" + mfrandomNum + "." + mfext;
			 * logger.debug("변경된 파일이름 " + mfrenamedFileName); try { mf.transferTo(new
			 * File(saveDirFile + "/" + mfrenamedFileName));// 파일을 저장
			 * logger.debug("파일 등록성공!"); // 파일을 db에 등록하는 로직작성 LocationFile lf = new
			 * LocationFile(location.getLocationNo(), mf.getOriginalFilename(),
			 * mfrenamedFileName); logger.debug("locationFile : " + lf); locationFileResult
			 * = service.insertLocationFile(lf); String fileCheck = "실패"; if
			 * (locationFileResult > 0) { fileCheck = "성공"; }
			 * logger.debug("파일 등록결과 LocationFile : " + fileCheck); } catch (IOException e)
			 * { e.printStackTrace(); } } }
			 */

			for (String s : locationPrice) {
				String[] split = s.split("/");
				LocationPrice price = new LocationPrice(location.getLocationNo(), split[0], split[1],
						Integer.parseInt(split[2]), Integer.parseInt(split[3]));
				logger.debug("locationPrice : " + price);
				int resultPrice = service.insertLocationPrice(price);
				logger.debug("locationPrice 등록결과 : " + resultPrice);
			}
		}
		logger.debug("mainFile : " + mainFile.getOriginalFilename());
		logger.debug(
				"========================================================================================================");
		mv = location("","","",0,"",mv,request);
		return mv;
	}

	@RequestMapping("/location/checks")
	public String checks() {
		return "location/checks";
	}

	@RequestMapping(value = "/location/imageUpload", method = RequestMethod.POST)
	public void communityImageUpload(HttpServletRequest request, HttpServletResponse response,
			@RequestParam MultipartFile upload, String creator) {
		logger.debug("이미지 업로드 들어옴");
		logger.debug("creator : " + creator);
		OutputStream out = null;
		PrintWriter printWriter = null;
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		try {

			byte[] bytes = upload.getBytes();

			String mforiginalFileName = upload.getOriginalFilename();
			String mfext = mforiginalFileName.substring(mforiginalFileName.lastIndexOf(".") + 1);
			SimpleDateFormat mfsdf = new SimpleDateFormat("yyyy-MM-dd-HHmmssSSS");
			int mfrandomNum = (int) (Math.random() * 1000);
			String mfrenamedFileName = creator + "_" + "Couplism-Location-File-"
					+ mfsdf.format(new Date(System.currentTimeMillis())) + "-" + mfrandomNum + "." + mfext;
			File f = new File(request.getServletContext().getRealPath("/resources/upload/location-Write-ContentFile")
					+ "/" + mfrenamedFileName);
			out = new FileOutputStream(f);
			out.write(bytes);
			String callback = request.getParameter("CKEditorFuncNum");

			printWriter = response.getWriter();
			String fileUrl = request.getContextPath() + "/resources/upload/location-Write-ContentFile/" + f.getName();// url경로
			logger.debug(callback);
			logger.debug(fileUrl);
			/*
			 * printWriter.
			 * println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
			 * + "1" + ",'" + fileUrl + "','이미지를 업로드 하였습니다.'" + ")</script>");
			 * printWriter.flush();
			 */

			printWriter.println(
					"{\"filename\" : \"" + mfrenamedFileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
			logger.debug(
					"{\"filename\" : \"" + mfrenamedFileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return;
	}

	@RequestMapping("/location/locationView")
	public ModelAndView locationView(ModelAndView mv, int locationNo, HttpSession session, String id, HttpServletRequest request) {
		logger.debug(
				"================================================locationView================================================");
		logger.debug("id : " + id);
		Location location = service.getLocation(locationNo);
		logger.debug("location : " + location);
		List<LocationPrice> locationPrice = service.getLocationPrice(locationNo);
		if (locationPrice.size() > 1) {
			// 예약 가능
			logger.debug("예약 가능!");
		}
		for (LocationPrice lp : locationPrice) {// 로케이션 프라이스
			logger.debug("locationPrice : " + lp);
		}
		List<Review> review = service.getLocationReview(locationNo);

		int reviewTotal = 0;
		double reviewPoint = 0.00;
		int ReviewExist = 0;
		if (review.size() > 0) {
			for (Review r : review) {
				reviewTotal += r.getReviewGrade();
				if (id != null) {
					if (r.getReviewId().equals(id)) {
						ReviewExist++;
						logger.debug("ReviewExist : "+ReviewExist);
					}
				}

			}
			reviewPoint = reviewTotal / review.size();
		}

		if (id != null) {
			Map<String, Object> mp = new HashMap();
			mp.put("id", id);
			mp.put("locationNo", locationNo);
			List<LocationReservation> lr = service.checkReservation(mp);
			if (lr != null) {
				int lrSize = lr.size();
				mv.addObject("reservationSize", lrSize);
				logger.debug("reservationSize : " + lrSize);
				logger.debug("ReviewExist : " + ReviewExist);
				logger.debug("등록안한 갯수 : " + (lrSize - ReviewExist));
			}
		}
		String[] mapPath = location.getLocationAddress().split("/");
		location.setLocationAddress(location.getLocationAddress().replace("/"," "));
		
		Double.parseDouble(String.format(Locale.KOREAN, "%.1f", reviewPoint));
		LocationMain lm = service.getLocationMain(locationNo);
		logger.debug("locationMain : resources/upload/locationMain/"+lm.getRenameName());
		logger.debug("mapPath : "+mapPath[0]);
		mv.addObject("location", location);// 로케이션 추가
		mv.addObject("mapPath", mapPath[0]);
		mv.addObject("reviewPoint", reviewPoint);// 리뷰 포인트 추가
		mv.addObject("review", review);// 리뷰 추가
		mv.addObject("locationPrice", locationPrice);
		mv.addObject("ReviewExist", ReviewExist);
		mv.addObject("locationMain", "resources/upload/locationMain/"+lm.getRenameName());
		mv.addObject("logoPath", "/resources/images/locationmain.jpg");
		mv.addObject("titleHan", "예약");
		mv.addObject("titleEng", "Location");
		mv.addObject("borderSize", "&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;");
		if(location.getLocationStatus()==0) {
			mv.setViewName("location/view");
		}else {
			mv.setViewName("location/Mview");
		}
		

		// 리뷰 불러옴 !
		// 리뷰 불러올려면 ! 결제 !@

		logger.debug(
				"============================================================================================================");
		return mv;
	}

	@RequestMapping("location/locationPayment")
	public ModelAndView locationPayment(int locationNo, String locationName, ModelAndView mv) {
		logger.debug("==================================LocationPayment=====================================");
		logger.debug("locationNo : " + locationNo);
		logger.debug("locationName : " + locationName);
		List<LocationPrice> lp = service.getLocationPrice(locationNo);
		logger.debug("locationPrice : " + lp);
		Date today = new Date();
		logger.debug("오늘 : " + today);
		mv.addObject("locationPrice", lp);
		mv.addObject("locationNo", locationNo);
		mv.addObject("locationName", locationName);
		mv.addObject("test", "테스트 데이터 잘들어옴");
		mv.addObject("logoPath", "/resources/images/locationmain.jpg");
		mv.addObject("titleHan", "예약");
		mv.addObject("titleEng", "Location");
		mv.addObject("borderSize", "&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;");
		mv.setViewName("/location/payment");
		logger.debug("======================================================================================");
		return mv;
	}

	@RequestMapping("location/dateLogic")
	@ResponseBody
	public void dateLogic(String day, int locationNo, HttpServletRequest rq, HttpServletResponse resp)
			throws ParseException, JsonIOException, IOException {
		logger.debug("====================================location dateLogic===================================");
		logger.debug("locationNo" + locationNo);
		logger.debug("day : " + day);
		String[] splitDay = day.split("-");
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
		Date selectDay = fm.parse(day);
		SimpleDateFormat sdf = new SimpleDateFormat("E", new Locale("en", "US"));
		logger.debug("selectDay : " + selectDay);
		String dayOfTheWeek = sdf.format(selectDay);
		logger.debug("dayOfTheWeek : " + dayOfTheWeek);
		SimpleDateFormat sdf2 = new SimpleDateFormat("yy/MM/dd");
		String getDate = sdf2.format(selectDay);
		logger.debug("getDate : " + getDate);
		Map<String, Object> map = new HashMap();
		map.put("locationNo", locationNo);
		map.put("day", "%" + dayOfTheWeek + "%");
		List<LocationPrice> locationPrice = service.getLocationPrice(map);// priceDay꺼내와서
		for (LocationPrice lp : locationPrice) {
			String time = lp.getPriceTime();
			Map<String, Object> fmp = new HashMap();
			fmp.put("day", "%" + getDate + "%");
			fmp.put("time", time);
			fmp.put("locationNo", locationNo);
			List<LocationReservation> lr = service.getLocationPirceOfTime(fmp);// locationNo 날짜 시간 한꺼번에 찾아서 rnum
			logger.debug("lr : " + lr);
			int reservationPeople = 0;
			for (LocationReservation r : lr) {
				reservationPeople += r.getPeople();
			}
			int totalPeople = lp.getPricePeople() - reservationPeople;
			lp.setPricePeople(totalPeople);

		}
		logger.debug("locationPrice : " + locationPrice);
		logger.debug("=========================================================================================");
		new Gson().toJson(locationPrice, resp.getWriter());
	}

	@RequestMapping("location/checkReservation")
	@ResponseBody
	public void checkReservation(HttpServletResponse resp, String day, String time, int people, int no)
			throws JsonIOException, IOException, ParseException {

		logger.debug("=========================================checkReservaiont===================================");
		logger.debug("day : " + day);
		logger.debug("people : " + people);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date d = sdf.parse(day);
		logger.debug("time : " + time);
		logger.debug("no : " + no);
		SimpleDateFormat sdf2 = new SimpleDateFormat("yy/MM/dd");
		String formatString = sdf2.format(d);
		SimpleDateFormat sdf3 = new SimpleDateFormat("E", new Locale("en", "US"));
		String dayOfTheWeek = sdf3.format(d);
		logger.debug("dayOfTheWeek : " + dayOfTheWeek);
		Map<String, Object> m = new HashMap();
		m.put("day2", "%" + dayOfTheWeek + "%");
		m.put("day", "%" + formatString + "%");
		m.put("time", time);
		m.put("locationNo", no);

		List<LocationReservation> lr = service.getLocationPirceOfTime(m);
		int reservationCount = 0;
		for (LocationReservation r : lr) {
			reservationCount += r.getPeople();
		}
		logger.debug("reservaiontCount : " + reservationCount);
		LocationPrice lp = service.checkPrice(m);
		int completionCount = lp.getPricePeople() - reservationCount;
		logger.debug("completionCount : " + completionCount);
		resp.setCharacterEncoding("utf-8");
		String returnData = "";
		if (completionCount >= people) {
			returnData = "true";
		} else {
			returnData = "false";
		}
		new Gson().toJson(returnData, resp.getWriter());
		logger.debug("==========================================================================================");
	}

	@RequestMapping("testPage")
	public String testPage() {
		return "/location/NewFile";
	}

	@RequestMapping("location/insertReservation")
	@ResponseBody
	public String insertReservation(LocationReservation reservation) {
		logger.debug(
				"============================================== insertReservation ==========================================");
		logger.debug("reservation : " + reservation);
		int result = service.insertReservation(reservation);
		logger.debug("result : " + result);
		String returnData = "";
		if (result > 0) {
			returnData = "true";
		} else {
			returnData = "false";
		}
		logger.debug(
				"===========================================================================================================");
		return returnData;
	}
	
	@RequestMapping("/location/AddReview")
	@ResponseBody
	public String AddReview(int locationNo, String content, String id, int grade,HttpServletRequest request) {
		logger.debug("============================================= AddReview ==================================================");
		logger.debug("locationNo : "+locationNo);
		logger.debug("content : "+content);
		logger.debug("id : "+id);
		logger.debug("grade : "+grade);
		// ckEditor  에서 서버에 저장한 파일에 대한 처리 후 가져온 값들은 content에 대한 내용을 db에 insert시킨다
		
		String[] contentSplit = content.split("src=");// 경로로 스플릿함
		if (contentSplit.length > 1) {

			logger.debug("contentSplit : " + contentSplit);
			logger.debug("contentSplit.length : " + contentSplit.length);
			List<String> imgPath = new ArrayList();
			for (int i = 1; i < contentSplit.length; i++) {
				logger.debug("contentSplit[" + i + "] : " + contentSplit[i]);
				logger.debug("for문 정상적으로 작동");
				logger.debug("contentSplit replace : " + contentSplit[i].replace("\"", "\\|"));
				String splitPatha = contentSplit[i].replace("\"", "\\|");
				String[] splitPath = splitPatha.split("\\|");
				logger.debug("splitPath[1] : " + splitPath[1]);
				String[] pathArr = splitPath[1].replace("\\", "").split("/");
				int lastIndex = pathArr.length - 1;
				imgPath.add(pathArr[lastIndex]);
				logger.debug("pathArr[lastIndex] : " + pathArr[lastIndex]);
			}
			logger.debug("imgPath Size : " + imgPath.size());
			logger.debug("imgPath List : " + imgPath);// 이미지파일의 경로를 받아옴

			// imgPath에 파일들을 삭제하고 로케이션 폴더에 새로등록하는 로직 생성

			for (String path : imgPath) {
				logger.debug("path : " + path);
				File moveFile = new File(
						request.getServletContext().getRealPath("/resources/upload/location-Write-ContentFile") + "/"
								+ path);
				logger.debug("파일존재 여부 : " + moveFile.exists());
				logger.debug("moveFile.getName() : " + moveFile.getName());
				String[] newFilePath = moveFile.getName().split("_");// newFilePath[2]으로 저장하면됨
				logger.debug("newFilePath length : " + newFilePath.length);
				logger.debug("newFilePath : " + newFilePath);

				File newFile = new File(
						request.getServletContext().getRealPath("/resources/upload/location") + "/" + newFilePath[1]);
				if (moveFile.exists()) {
					boolean isMoved = moveFile.renameTo(newFile);
					logger.debug("파일 이동여부 : " + isMoved);
				}

			}
			logger.debug("userId : " + id);
			File imgFile = new File(
					request.getServletContext().getRealPath("/resources/upload/location-Write-ContentFile"));
			File[] imgFileList = imgFile.listFiles();
			logger.debug("imgFileList.length() : " + imgFileList.length);
			for (File f : imgFileList) {// 이로직 로그인할때도 돌려줘야함 !!@#!@#
				String[] fileName = f.getName().split("_");
				logger.debug("fileName[0] : " + fileName[0]);
				logger.debug("fileName[1] : " + fileName[1]);
				if (fileName[0].equals(id)) {
					f.delete();
					logger.debug("사용자 명으로 된 location 임시 파일 삭제 완료!");
				}
			}

			// 이제 변경된경로로 noticeContent안에 src수정

			String pathReplace = content.replace("location-Write-ContentFile", "location")
					.replace(id+ "_", "");
			logger.debug("변경된 noticeContent : " + pathReplace);
			content = pathReplace;
		}
		Map<String,Object> map = new HashMap();
		map.put("locationNo", locationNo);
		map.put("id", id);
		map.put("grade", grade);
		map.put("content",content);
		int result = service.insertReview(map);
		logger.debug("result : "+result);
		logger.debug("==========================================================================================================");
		
		
		if(result>0) {
			return "true";
		}else {
			return "false";
		}
		
	}
	
	@RequestMapping("/location/createMember")
	public ModelAndView createMember(ModelAndView mv) {
		mv.addObject("logoPath", "resources/images/create-location.jpg");
		mv.addObject("borderSize",
				"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
						+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
						+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		mv.addObject("titleHan", "내 상점 만들기");
		mv.addObject("titleEng", "Create Your Shop");

		return mv;
	}
	
	@RequestMapping("/location/createMemberEnd")
	public ModelAndView createMemberEnd(ModelAndView mv, Location location, MultipartFile mainFile, HttpServletRequest request) {
		
		
		logger.debug("===========================================================  createMember ================================================");
		logger.debug("location : "+location);
		//1. 인서트 
		// service에서 새로운 location insert문작성 status 가 2 
		
		location.setLocationStatus(2);
		
		//2. locationMain 등록하기
		
		int result = service.insertLocation(location);// location insert결과 
		int locationMainResult=0;// locationMain insert결과가 담길곳
		
		if (result > 0) {
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
		
		}
		mv = location("","","",0,"",mv,request);
		return mv;
		
	}
}
