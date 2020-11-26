package com.kh.couplism.member.model.service;

import java.util.Map;
import com.kh.couplism.member.model.vo.Member;

public interface MemberService {
	
	int enrollMember(Member m);
	
	int duplicateId(String id);
	
	Member selectOneMember(Map param);
}
