package com.kh.couplism.community.faq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FaqController {


	@RequestMapping("/faq/faqList.do")
	public String faqList() {
		return "/community/faq/faqList";
	}
	
	@RequestMapping("/faq/faqLocation.do")
    public String faqLocation() {
    	return "/community/faq/faqLocation";
    }
    
    @RequestMapping("/faq/faqLism.do")
    public String faqLism() {
    	return "/community/faq/faqLism";
    }
    
    @RequestMapping("/faq/faqAnniversary.do")
    public String faqAnniversary() {
    	return "/community/faq/faqAnniversary";
    }
    
    @RequestMapping("/faq/faqEtc.do")
    public String faqEtc() {
    	return "/community/faq/faqEtc";
    }
    
}
