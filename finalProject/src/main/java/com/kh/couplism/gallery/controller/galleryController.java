package com.kh.couplism.gallery.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.couplism.common.PageBarFactory;
import com.kh.couplism.gallery.model.serivce.GalleryService;
import com.kh.couplism.gallery.model.vo.Gallery;
import com.kh.couplism.gallery.model.vo.GalleryFile;


@Controller
public class galleryController {
	@Autowired
	private GalleryService service;
	@RequestMapping("/gallery/galleryList.do")
	public ModelAndView galleryList(ModelAndView mv,
			@RequestParam(value="cPage",required=false,defaultValue="1") int cPage,
			@RequestParam(value="numPerPage",required=false,defaultValue="6")int numPerPage){
		
		List<Gallery> list=service.galleryList(cPage, numPerPage);
		int totalData=service.selectCount();
		
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalData, cPage, numPerPage, "galleryList.do"));
		mv.addObject("totalData",totalData);
		mv.addObject("list",list);
		mv.setViewName("gallery/galleryList");
		
		return mv;
	}
	
	
	@RequestMapping("/gallery/galleryWrite.do")
	public String galleryWrite() {
		return "/gallery/galleryWrite";
	}
	
	@RequestMapping("/gallery/mygalleryList.do") /* 바꿔야됨 */
	public ModelAndView mygalleryList(ModelAndView mv,
			@RequestParam(value="cPage",required=false,defaultValue="1") int cPage,
			@RequestParam(value="numPerPage",required=false,defaultValue="6")int numPerPage){
		
		List<Gallery> list=service.mygalleryList(cPage, numPerPage);
		int totalData=service.selectCount();
		
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalData, cPage, numPerPage, "mygalleryList.do"));
		mv.addObject("totalData",totalData);
		mv.addObject("list",list);
		mv.setViewName("gallery/mygalleryList");
		
		return mv;
	}
	
	@RequestMapping("/gallery/galleryView.do")
	public ModelAndView galleryView(int no, ModelAndView mv) {
		mv.addObject("gallery", service.selectGallery(no));
		mv.setViewName("gallery/galleryView");		
		return mv;
	}
	
	@RequestMapping("/gallery/galleryDelete.do")
	public ModelAndView galleryDelete(int no, ModelAndView mv) {
		System.out.println(no);
		int result=service.galleryDelete(no);
		
		System.out.println(result);
		mv.setViewName("gallery/galleryList");
		return mv;
	}
	
	@RequestMapping("/gallery/galleryWriteEnd.do")
	public ModelAndView GalleryWriteEnd(Gallery g,MultipartFile[] files, ModelAndView m,HttpServletRequest request) {
		
		
		String upload=request.getServletContext().getRealPath("/resources/upload/gallery");
		File f=new File(upload);
		if(f.exists()) {
			f.mkdir();
		}
		List<GalleryFile> gf=new ArrayList();
		for(MultipartFile mf:files) {
			if(!mf.isEmpty()) {
				String originalFileName=mf.getOriginalFilename();
				String ext=originalFileName.substring(originalFileName.lastIndexOf(".")+1);
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy_MM_dd");
				int rndNum=(int)(Math.random()*10000);
				String renameFileName=sdf.format(new Date(System.currentTimeMillis()))+"_"+rndNum+"_"+ext;
				try {
					mf.transferTo(new File(upload+"/"+renameFileName));
				}catch(IOException e) {
					e.printStackTrace();
				}
				GalleryFile galleryFile=new GalleryFile(0,originalFileName,renameFileName);
				
				gf.add(galleryFile);
				System.out.println(mf);	
			}
		}
		
		int result=0;
		String error="";
		
		//try {  
			result=service.insertGallery(g,gf);
		//}catch(RuntimeException e) {
			System.out.println("실패");
			//String temp=e.getMessage();
//			error=temp.substring(temp.indexOf("SQLSyntaxErrorException"),temp.indexOf("\n",2));
		//}
		m.addObject("msg",result>0?"등록성공":"등록실패-["+error+"]");
		m.addObject("loc","/gallery/galleryList.do");
		
		
		m.setViewName("common/msg");
		
		return m;
		
		
	}
	
}
