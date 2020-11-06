package com.kh.couplism.notice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.couplism.notice.model.service.NoticeService;
import com.kh.couplism.notice.model.vo.Notice;
import com.kh.couplism.notice.model.vo.NoticeFile;

@Controller
public class NoticeController {

	@Autowired
	private Logger logger;
	@Autowired
	private NoticeService service;
	
	@RequestMapping("/notice/noticeList")
	public String NoticeList(HttpServletRequest request, Model m) {
		
		int cPage;
		try {
			cPage = Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		String search;
		String searchQuery;
		if(request.getParameter("search")==null) {
			search = "%%";
			searchQuery = "";
		}else {
			search = "%"+request.getParameter("search")+"%";
			searchQuery = request.getParameter("search");
		}
		
		int numPerpage = 15;
		
		RowBounds rb = new RowBounds((cPage-1)*numPerpage,numPerpage);
		
		List<Notice> list = service.noticeList(search,rb);
		int totalData = service.noticeCount(search);
		int totalPage=(int)Math.ceil((double)totalData/numPerpage);
		int pageBarSize=5;
		int pageNo =((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd = pageNo+pageBarSize-1;
		String pageBar = "";
		
		if (pageNo == 1) {
			pageBar = "<li class='page-item'>" + "<a class='page-link text-dark'aria-label='Previous'>"
					+ "<span aria-hidden='true'>&laquo;</span>" + "<span class='sr-only'>Previous</span>" + "</a>"
					+ "</li>";
		} else {
			pageBar = "<li class='page-item'>" + "<a class='page-link text-dark' href='" + request.getContextPath()
					+ "/notice/noticeList?cPage=" + (pageNo - 1)+"&search="+searchQuery+"' aria-label='Previous'>"
					+ "<span aria-hidden='true'>&laquo;</span>" + "<span class='sr-only'>Previous</span>" + "</a>"
					+ "</li>";
		}

		// 연결되는 페이지 번호 출력하기
		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (cPage == pageNo) {
				pageBar += "<li class='page-item'><a class='page-link text-dark'>" + pageNo + "</a></li>";
			} else {
				pageBar += "<li class='page-item'><a class='page-link text-dark' href='" + request.getContextPath()
						+ "/notice/noticeList?cPage=" + pageNo+"&search="+searchQuery+"'>" + pageNo + "</a></li>";
			}
			pageNo++;
		}
		if (pageNo > totalPage) {
			pageBar += "<li class='page-item'>" + "<a class='page-link text-dark' aria-label='Next'>"
					+ "<span aria-hidden='true'>&raquo;</span>" + "<span class='sr-only'>Next</span>" + "</a>"
					+ "</li>";
		} else {
			pageBar += "<li class='page-item'>" + "<a class='page-link text-dark' href='" + request.getContextPath()
					+ "/notice/noticeList?cPage="+pageNo+"&search="+searchQuery+"' aria-label='Next'>" + "<span aria-hidden='true'>&raquo;</span>"
					+ "<span class='sr-only'>Next</span>" + "</a>" + "</li>";
		}
		m.addAttribute("list",list);
		m.addAttribute("pageBar",pageBar);
		
		return"/notice/noticeList";
	}
	
	@RequestMapping("/notice/write")
	public String noticeWrite() {
		return"/notice/noticeWrite";
	}
	
	
	@RequestMapping("notice/writeEnd")
	public ModelAndView noticeWriteEnd(ModelAndView mv, List<MultipartFile> noticeFile, Notice notice, HttpServletRequest request) {
		
		logger.debug("========================== NoticeWriet ==========================");
		
		/*
		 * for(MultipartFile fl : noticeFile) { if(fl.getSize()!=0) {
		 * logger.debug("file명 : "+fl.getOriginalFilename());
		 * logger.debug("file Size : "+fl.getSize()); } }
		 * logger.debug("제목 : "+notice.getNoticeTitle());
		 * logger.debug("내용 : "+notice.getNoticeContent());
		 */
		
		notice.setUserId("admin");//로인완료시 처리를 해줘야함 !로그인 한사람을 Session에서 불러와서 입력해준다
		
		int result = service.insertNotice(notice);
		
		logger.debug("result : "+result);
		logger.debug("noticeNo : "+notice.getNoticeNo());
		
		//파일업로드 처리 
		//1. 업로드 경로 지정
		//2. 파일리네임 처리 후 파일 저장하기 
		
		if(result !=0){
			logger.debug("notice등록 성공!");
			String saveDir = request.getServletContext().getRealPath("/resources/upload/notice");
			
			File dir = new File(saveDir);
			
			int success=0;
			for(MultipartFile mf : noticeFile) {
				if(!mf.isEmpty()) {// mf.isEmpty()
					logger.debug("file명 : "+mf.getOriginalFilename());
					logger.debug("file Size : "+mf.getSize());
					String originalFileName = mf.getOriginalFilename();
					String ext = originalFileName.substring(originalFileName.lastIndexOf(".")+1);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HHmmssSSS");
					int randomNum = (int)(Math.random()*1000);
					String renamedFileName = "Couplism-Notice-"+sdf.format(new Date(System.currentTimeMillis()))+"_"+randomNum+"."+ext;
					logger.debug("변경된 파일이름 "+renamedFileName);
					try {
						mf.transferTo(new File(saveDir+"/"+renamedFileName));//파일을 저장
						logger.debug("파일 등록성공!");
						//파일을 db에 등록하는 로직작성
						NoticeFile nf = new NoticeFile(notice.getNoticeNo(), mf.getOriginalFilename(), renamedFileName);
						result = service.insertNoticeFile(nf);
						String fileCheck = "실패";
						if(result>0) {
							fileCheck = "성공";
						}
						logger.debug("파일 등록결과 : "+fileCheck);
						success++;
					}catch(IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		
		logger.debug("=================================================================");
		mv.setViewName("redirect:/notice/noticeList");
		
		return mv;
	}
	
	@RequestMapping("/notice/noticeView")
	public ModelAndView noticeView(ModelAndView mv, int noticeNo) {
		Notice notice = service.getNotice(noticeNo);
		List<NoticeFile> noticeFile = service.getNoticeFile(noticeNo);
		logger.debug("notice : "+notice);
		logger.debug("noticFile : "+noticeFile);
		mv.addObject("notice", notice);
		mv.addObject("noticeFile", noticeFile);
		mv.setViewName("/notice/noticeView");
		return mv;
	}
}
