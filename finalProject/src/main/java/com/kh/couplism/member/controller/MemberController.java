package com.kh.couplism.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.couplism.member.model.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping("/enrollMember.do")
	public String enrollMember() {
		return "/member/memberEnroll";
	}
}
