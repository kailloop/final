package com.kh.couplism.notice.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.couplism.member.model.vo.Member;
import com.kh.couplism.notice.model.service.NoticeService;
import com.kh.couplism.notice.model.vo.Notice;
import com.kh.couplism.notice.model.vo.NoticeComment;
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
		m.addAttribute("titleHan","공지사항");
		m.addAttribute("titleEng","Notice");
		m.addAttribute("logoPath","resources/images/notice1.jpg");
		m.addAttribute("borderSize","&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;");
		return"/notice/noticeList";
	}
	
	@RequestMapping("/notice/write")
	public ModelAndView noticeWrite(ModelAndView mv) {
		mv.setViewName("/notice/noticeWrite");
		mv.addObject("titleHan","공지사항");
		mv.addObject("titleEng","Notice");
		mv.addObject("logoPath","resources/images/notice1.jpg");
		mv.addObject("borderSize","&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;");
		return mv;
	}
	
	
	@RequestMapping("notice/writeEnd")
	public ModelAndView noticeWriteEnd(ModelAndView mv, List<MultipartFile> noticeFile, Notice notice, HttpServletRequest request, HttpSession session) {
		
		logger.debug("========================== NoticeWriet ==========================");
		
		/*
		 * for(MultipartFile fl : noticeFile) { if(fl.getSize()!=0) {
		 * logger.debug("file명 : "+fl.getOriginalFilename());
		 * logger.debug("file Size : "+fl.getSize()); } }
		 * logger.debug("제목 : "+notice.getNoticeTitle());
		 * logger.debug("내용 : "+notice.getNoticeContent());
		 */
		//notice.setUserId("admin");//로인완료시 처리를 해줘야함 !로그인 한사람을 Session에서 불러와서 입력해준다
		logger.debug("Notiec : "+notice);
		int result = service.insertNotice(notice);
		
		logger.debug("result : "+result);
		logger.debug("noticeNo : "+notice.getNoticeNo());
		
		//파일업로드 처리 
		//1. 업로드 경로 지정
		//2. 파일리네임 처리 후 파일 저장하기 
		
		if(result !=0){
			logger.debug("notice등록 성공!");
			String saveDir = request.getServletContext().getRealPath("/resources/upload/notice");
			
			File dir = new File(saveDir);//???
			
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
		mv.addObject("titleHan","공지사항");
		mv.addObject("titleEng","Notice");
		mv.addObject("logoPath","resources/images/notice.jpg");
		mv.addObject("borderSize","&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;");
		return mv;
	}
	
	@RequestMapping("/notice/noticeView")
	public ModelAndView noticeView(ModelAndView mv, int noticeNo, HttpServletRequest request, HttpServletResponse response) {
		logger.debug("==============================================LocationView==============================================");
		Notice notice = service.getNotice(noticeNo);
		boolean check = false;
		Cookie[] cookieCheck = request.getCookies();
		for(Cookie c : cookieCheck) {
			if(c.getValue().equals(String.valueOf(noticeNo))){
				check = true;
			}
		}
		logger.debug("쿠키 존재여부 : "+check);
		if(check == false) {
			logger.debug("if문 들어옴 ");
			int viewCount =  notice.getViewCount();
			viewCount++;
			notice.setViewCount(viewCount);
			int result = service.upViewCount(notice);
			if(result == 1) {
				logger.debug("조회수 증가완료 !");
			}
			Cookie addCookie = new Cookie("couplism_Notice_"+noticeNo, String.valueOf(noticeNo));
			addCookie.setMaxAge(60*60*3);//3시간 동안 안오름
			response.addCookie(addCookie);
			logger.debug("Cookie추가 완료!");
		}
		
		List<NoticeFile> noticeFile = service.getNoticeFile(noticeNo);
		List<NoticeComment> noticeComment = service.getNoticeComment(noticeNo);
		int cp = 0;
		String html = "";
		int commentSize = noticeComment.size();
		for(NoticeComment nc : noticeComment) {
			if(nc.getReplyPosition()==0) {//나누어야 할경우의수 1.댓글일때 2.답글일때 
				if(cp!=0) {
					html += "</div>";
				}
				html += "<div class='commentDiv'>"
				+"<hr>"
				+"<p>"+nc.getUserId()+"</p>"
				+"<p>"+nc.getWriteDate()+"</p>"
				+"<input id='userId' type='hidden' value='"+nc.getUserId()+"'>"
				+"<input id='commentP' type='hidden' value='"+nc.getCommentPosition()+"'>"
				+"<input id='replyP' type='hidden' value='"+nc.getReplyPosition()+"'>"
				+"<textarea rows='' cols='' disabled readonly>"+nc.getCommentContent()+"</textarea>"
				+"<div id='hiddened'></div>";
				cp++;
			}else {
				html += "<div id='replyDiv' style='margin-left:50px;'>"
				+"<hr>"
				+"<p>"+nc.getUserId()+"</p>"
				+"<p>"+nc.getWriteDate()+"</p>"
				+"<textarea rows='' cols='' disabled readonly>"+nc.getCommentContent()+"</textarea>"
				+"<input id='replyP' type='hidden' value='"+nc.getReplyPosition()+"'>"
				+"</div>";
			}
		}
		html += "</div>"+"<hr>";
		
		logger.debug("notice : "+notice);
		logger.debug("noticFile : "+noticeFile);
		logger.debug("noticeComment : "+noticeComment);
		mv.addObject("notice", notice);
		mv.addObject("noticeFile", noticeFile);
		mv.addObject("noticeComment", noticeComment);
		mv.addObject("cp", cp+1);
		mv.addObject("html", html);
		mv.addObject("titleHan","공지사항");
		mv.addObject("titleEng","Notice");
		mv.addObject("logoPath","resources/images/notice.jpg");
		mv.addObject("borderSize","&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;");
		mv.setViewName("/notice/noticeView");
		logger.debug("========================================================================================================");
		
		return mv;
	}
	
	
	@RequestMapping("/notice/fileDownload")
	public void fileDownload(HttpServletResponse response, HttpServletRequest request, @RequestParam String fileName) throws IOException {
	 
		String path = request.getServletContext().getRealPath("/resources/upload/notice")+"/"+fileName;
	    
		File file = new File(path);
		
		String mimeType= request.getServletContext().getMimeType(file.toString());
		if(mimeType==null) {
			response.setContentType("application/octet-stream");
		}
		String downloadName = null;
		if(request.getHeader("user-agent").indexOf("MSIE") == -1) {
			downloadName = new String(fileName.getBytes("UTF-8"),"8859_1");
		}else {
			downloadName = new String(fileName.getBytes("EUC-KR"),"8859_1");
		}
		
		response.setHeader("Content-Disposition", "attachment;filename=\""+downloadName+"\";");
		FileInputStream fis = new FileInputStream(file);
		ServletOutputStream sos = response.getOutputStream();
		
		byte b[] = new byte[1024];
		int data = 0;
		
		while ((data = (fis.read(b, 0, b.length))) != -1) {
			sos.write(b, 0, data);
		}
		sos.flush();
		sos.close();
		fis.close();
		
	}
	@RequestMapping("/notice/addComment")
	public void noticAddComment(@RequestParam(value="commentPosition", defaultValue="0", required=false) int commentPosition,
								@RequestParam(value="replyPosition", defaultValue="0", required=false) int replyPosition,
								@RequestParam String commentContent,
								int noticeNo, HttpServletResponse rs, HttpServletRequest rq) throws IOException {
		logger.debug("----------------------------------------------------------------------------------------------------------------------");
		logger.debug("noticeNo : "+noticeNo);
		logger.debug("commentContent : "+commentContent);
		logger.debug("commentPosition : "+commentPosition);
		logger.debug("replyPosition : "+replyPosition);
		logger.debug(""+new NoticeComment(noticeNo,"admin",commentContent,commentPosition+1,replyPosition,""));
		
		
		int result = service.addComment(new NoticeComment(noticeNo,"admin",commentContent,commentPosition+1,replyPosition,""));
		logger.debug("result : "+result);
		if(result>0) {
			logger.debug("등록성공 !!");
		}
		logger.debug("----------------------------------------------------------------------------------------------------------------------");
		rs.sendRedirect("/couplism/notice/noticeView?noticeNo="+noticeNo);
	}
	
//	@RequestMapping("/notice/addCommentAjax")
//	@ResponseBody
//	public String noticeAddCommentAjax(@RequestParam(value="commentPosition", defaultValue="0", required=false) int commentPosition,
//									   @RequestParam(value="replyPosition", defaultValue="0", required=false) int replyPosition,
//									   @RequestParam(value="commentContent") String commentContent,
//									   int noticeNo, HttpServletResponse rs, HttpServletRequest rq ){
//		logger.debug("----------------------------------------------------------------------------------------------------------------------");
//		logger.debug("noticeNo : "+noticeNo);
//		logger.debug("commentContent : "+commentContent);
//		logger.debug("commentPosition : "+commentPosition);
//		logger.debug("replyPosition : "+replyPosition);
//		logger.debug(""+new NoticeComment(noticeNo,"admin",commentContent,commentPosition+1,replyPosition,""));
//		int result = service.addComment(new NoticeComment(noticeNo,"admin",commentContent,commentPosition+1,replyPosition,""));
//		logger.debug("result : "+result);
//		if(result>0) {
//			logger.debug("등록성공 !!");
//		}
//		logger.debug("----------------------------------------------------------------------------------------------------------------------");
//		
//		
//		//이제 댓글 테이블의 데이터를 가져와서 String으로 변환
//		List<NoticeComment> noticeComment = service.getNoticeComment(noticeNo);
//		
//		for(NoticeComment nc : noticeComment) {
//			
//		}
//		
//	
//		return"ajax성공";
//	}
	@RequestMapping("/notice/addCommentAjax")
	@ResponseBody
	public void noticeAddCommentAjax(@RequestParam(value="commentPosition", defaultValue="0", required=false) int commentPosition,
			   @RequestParam(value="replyPosition", defaultValue="0", required=false) int replyPosition,
			   @RequestParam(value="commentContent") String commentContent, String userId,
			   int noticeNo, HttpServletRequest rq, HttpServletResponse resp) throws JsonIOException, IOException{
		
		resp.setCharacterEncoding("utf-8");

		Map mp = new HashMap();
		int cp = 0;
//		logger.debug("noticeNo : "+(String)data.get("noticeNo"));
//		logger.debug("commentContent : "+(String)data.get("commentContent"));
//		logger.debug("commentPosition : "+(String)data.get("commentPosition"));
//		logger.debug("replyPosition : "+(String)data.get("replyPosition"));
//		String check = (String) data.get("noticeNo");

		logger.debug("----------------------------------------------------------------------------------------------------------------------");
		logger.debug("noticeNo : "+noticeNo);
		logger.debug("userId : "+userId);
		logger.debug("commentContent : "+commentContent);
		logger.debug("commentPosition : "+commentPosition);
		logger.debug("replyPosition : "+replyPosition);
		logger.debug(""+new NoticeComment(noticeNo,userId,commentContent,commentPosition,replyPosition,""));
		int result = 0;
		if(replyPosition>0) {//답글
			result = service.addComment(new NoticeComment(noticeNo,userId,commentContent,commentPosition,replyPosition,""));
		}else {
			result = service.addComment(new NoticeComment(noticeNo,userId,commentContent,commentPosition,replyPosition,""));
		}
		logger.debug("result : "+result);
		if(result>0) {
			logger.debug("등록성공 !!");
		}
		logger.debug("----------------------------------------------------------------------------------------------------------------------");
		
		
		//이제 댓글 테이블의 데이터를 가져와서 String으로 변환
		List<NoticeComment> noticeComment = service.getNoticeComment(noticeNo);
		String html = "";
		int commentSize = noticeComment.size();
		for(NoticeComment nc : noticeComment) {
			if(nc.getReplyPosition()==0) {//나누어야 할경우의수 1.댓글일때 2.답글일때 
				if(cp!=0) {
					html += "</div>";
				}
				html += "<div class='commentDiv'>"
				+"<hr>"
				+"<p>"+nc.getUserId()+"</p>"
				+"<p>"+nc.getWriteDate()+"</p>"
				+"<input id='userId' type='hidden' value='"+nc.getUserId()+"'>"
				+"<input id='commentP' type='hidden' value='"+nc.getCommentPosition()+"'>"
				+"<input id='replyP' type='hidden' value='"+nc.getReplyPosition()+"'>"
				+"<textarea rows='' cols='' disabled readonly>"+nc.getCommentContent()+"</textarea>"
				+"<div id='hiddened'></div>";
				cp++;
			}else {
				html += "<div id='replyDiv' style='margin-left:50px;'>"
				+"<hr>"
				+"<p>"+nc.getUserId()+"</p>"
				+"<p>"+nc.getWriteDate()+"</p>"
				+"<textarea rows='' cols='' disabled readonly>"+nc.getCommentContent()+"</textarea>"
				+"<input id='replyP' type='hidden' value='"+nc.getReplyPosition()+"'>"
				+"</div>";
			}
		}
		html += "</div>"+"<hr>"+"<h1>"+cp+":"+commentSize+"</h1>";
		logger.debug("cp : "+(cp+1));
		mp.put("cp",cp+1);
		mp.put("result", result);
		mp.put("html",html);
		new Gson().toJson(mp,resp.getWriter());
	}
	
	@RequestMapping("/notice/deleteNotice")
	public void deleteNotice(HttpServletRequest request, HttpServletResponse rs, int noticeNo) throws IOException {
		logger.debug("--------------------------------------------------deleteNotice--------------------------------------------------------");
		logger.debug("noticeNo = "+noticeNo);//삭제 순서 1.noticeFile 2.noticeComment 3.Notice 이렇게 삭제 
		
		List<NoticeFile> noticeFile = service.getNoticeFile(noticeNo);//프로젝트에 있는 파일도 삭제하기 위해 먼저 해당 파일의 리스트를 가져옴
		
		logger.debug("noticeFile 삭제");
		
		int noticeFileResult = service.deleteNoticeFile(noticeNo);
		logger.debug("DB삭제 결과"+noticeFileResult+"개 삭제 완료");
		logger.debug("프로젝트에 있는 파일 삭제 살행");
		logger.debug("파일 총갯수  : "+noticeFile.size()+"개");
		for(NoticeFile nf : noticeFile) {
			File file = new File(request.getServletContext().getRealPath("/resources/upload/notice/"+nf.getRenameName()));
			logger.debug(request.getServletContext().getRealPath("/resources/upload/notice/"+nf.getRenameName()));
			if(file.exists()) {
				logger.debug(nf.getRenameName()+" 접근 완료");
				boolean deleteResult =file.delete();
				logger.debug("처리결과  : "+deleteResult);
			}else {
				logger.debug(request.getServletContext().getRealPath("/resources/upload/notice/"+nf.getRenameName())+"를 찾을수 없습니다.");
			}
		}
		
		logger.debug("noticeFile 삭제완료.");
		logger.debug("noticeComment 삭제");
		
		List<NoticeComment> noticeComment = service.getNoticeComment(noticeNo);
		logger.debug("총 댓글 갯수 : "+noticeComment.size()+"개");
		logger.debug("NoticeComment 삭제 실행");
		int noticeCommentResult = service.deleteNoticeComment(noticeNo);
		logger.debug(noticeCommentResult+"개 삭제 완료");
		
		logger.debug("Notice 삭제 실행");
		service.deleteNotice(noticeNo);
		logger.debug("Notice 삭제 완료.");
		logger.debug("----------------------------------------------------------------------------------------------------------------------");
		rs.sendRedirect(request.getContextPath()+"/notice/noticeList?");
	}
	
	@RequestMapping("/notice/checkMember")//로그인 되어있는 사용자 가져옴
	public void checkMember(HttpSession session) {
		Member m = (Member)session.getAttribute("logginedMember");
		logger.debug(""+m);
	}
	
	@RequestMapping("/notice/modifyNotice")
	public ModelAndView modifyNotice(int noticeNo, ModelAndView mv) {
		logger.debug("--------------------------------------------------modifyNotice--------------------------------------------------------");
		logger.debug("noticeNo : "+noticeNo);
		Notice n = service.getNotice(noticeNo);
		logger.debug("notice가져옴");
		logger.debug("Notice : "+n);
		List<NoticeFile> nf = service.getNoticeFile(noticeNo);
		logger.debug("NoticeFile : "+nf);
		mv.addObject("NoticeFile", nf);
		mv.addObject("notice",n);
		mv.setViewName("/notice/modifyNotice");
		mv.addObject("titleHan","공지사항");
		mv.addObject("titleEng","Notice");
		mv.addObject("logoPath","resources/images/notice.jpg");
		mv.addObject("borderSize","&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;");
		logger.debug("----------------------------------------------------------------------------------------------------------------------");
		return mv;
	}
	@RequestMapping("/notice/modifyNoticeEnd")
	public ModelAndView modifyNoticeEnd(ModelAndView mv, List<MultipartFile> noticeFile, String[] deleteFileName, Notice notice, HttpServletRequest request, HttpSession session){
		logger.debug("--------------------------------------------------modifyNoticeEnd--------------------------------------------------------");
		logger.debug("Notiec : "+notice);
		logger.debug("NoticeFile : "+noticeFile);//수정에서 받아온 파일 리스트
		List<NoticeFile> nf = service.getNoticeFile(notice.getNoticeNo());//기존에 있던 파일 리스트
		//1.파일삭제
		
		if(deleteFileName!=null) {
			if(deleteFileName.length!=0) {
				for(String dn : deleteFileName) {
					File df = new File(request.getServletContext().getRealPath("/resources/upload/notice/")+dn);
					if(df.exists()) {
						Map<String,Object> deleteMap = new HashMap();
						deleteMap.put("noticeNo", notice.getNoticeNo());
						deleteMap.put("deleteFileName", dn);
						service.deleteNoticeFile(deleteMap);
						boolean deleteResult =df.delete();
						logger.debug(dn+" 처리결과  : "+deleteResult);
					}
				}
			}
		}
		//2.파일추가
		String saveDir = request.getServletContext().getRealPath("/resources/upload/notice");
		
		File dir = new File(saveDir);//???
		
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
					NoticeFile nfOfTry = new NoticeFile(notice.getNoticeNo(), mf.getOriginalFilename(), renamedFileName);
					int result = service.insertNoticeFile(nfOfTry);
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
		
		mv.setViewName("/notice/noticeList");
		mv.addObject("titleHan","공지사항");
		mv.addObject("titleEng","Notice");
		mv.addObject("logoPath","resources/images/notice.jpg");
		mv.addObject("borderSize","&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;");
		logger.debug("-------------------------------------------------------------------------------------------------------------------------");
		return mv;
	}
	
	@RequestMapping("checkCk")
	public String checkCk() {
		return "/location/checkCK";
	}
	
}
