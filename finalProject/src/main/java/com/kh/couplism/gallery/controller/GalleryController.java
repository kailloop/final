package com.kh.couplism.gallery.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.couplism.common.PageBarFactory;
import com.kh.couplism.gallery.model.serivce.GalleryService;
import com.kh.couplism.gallery.model.vo.Gallery;

@Controller
public class GalleryController {

	@Autowired
	private GalleryService service;
	@RequestMapping("/gallery/galleryList.do")
	public ModelAndView galleryList(ModelAndView mv,
			@RequestParam(value="cPage",required=false,defaultValue="1") int cPage,
			@RequestParam(value="numPerPage",required=false,defaultValue="12")int numPerPage){
		
		List<Gallery> list=service.galleryList(cPage, numPerPage);
		int totalData=service.selectCount();
		
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalData, cPage, numPerPage, "galleryList.do"));
		mv.addObject("totalData",totalData);
		mv.addObject("list",list);
		mv.setViewName("gallery/galleryList");
		
		return mv;
	}
	
}
