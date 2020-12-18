package com.kh.couplism.member.model.service;

import java.util.Map;

import com.kh.couplism.member.model.vo.Member;
import com.kh.couplism.member.model.vo.Partner;
import com.kh.couplism.member.model.vo.SNSMember;

public interface MemberService {

	int enrollMember(Member m);
	
	int enrollPartner(Partner p);
	
	int enrollSnsMember(Map param);
	
	int duplicateId(String id);
	
	Member findId(Map param);
	
	SNSMember selectOneSnsMember(Map param);
	
	Member selectOneMember(Map param);
	
	Partner selectOnePartner(Map param);
	
}
