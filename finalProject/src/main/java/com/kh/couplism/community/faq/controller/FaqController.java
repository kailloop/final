package com.kh.couplism.community.faq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FaqController {


	@RequestMapping("/faq/faqList.do")
	public String faqList() {
		return "/community/faq/faqList";
	}
}
