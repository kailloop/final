package com.kh.couplism.anniversary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AnniversaryController {
	
	@RequestMapping("/anniversary/anniversarySearch.do")
    public String anniversarySearcht() {
    	return "/anniversary/anniversarySearch";
    }
}
