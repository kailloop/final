package com.kh.couplism.member.model.service;

import java.util.Map;

import com.kh.couplism.member.model.vo.Member;
import com.kh.couplism.member.model.vo.Partner;

public interface MemberService {
	
	int enrollMember(Member m);
	
	int enrollPartner(Partner p);
	
	int duplicateId(String id);
	
	
	Member selectOneMember(Map param);
	
	
}
