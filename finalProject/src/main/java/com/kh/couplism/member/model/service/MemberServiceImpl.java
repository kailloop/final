package com.kh.couplism.member.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.couplism.member.model.dao.MemberDao;
import com.kh.couplism.member.model.vo.Member;
import com.kh.couplism.member.model.vo.Partner;
import com.kh.couplism.member.model.vo.SNSMember;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public int enrollMember(Member m) {
		// TODO Auto-generated method stub
		return dao.enrollMember(session,m);
	}
	
	@Override
	public int enrollPartner(Partner p) {
		// TODO Auto-generated method stub
		return dao.enrollPartner(session,p);
	}

	@Override
	public int duplicateId(String id) {
		// TODO Auto-generated method stub
		return dao.duplicateId(session,id);
	}

	@Override
	public Member selectOneMember(Map param) {
		// TODO Auto-generated method stub
		return dao.selectOneMember(session,param);
	}

	@Override
	public SNSMember selectOneSnsMember(Map param) {
		// TODO Auto-generated method stub
		return dao.selectOneSnsMember(session,param);
	}

	@Override
	public int enrollSnsMember(Map param) {
		// TODO Auto-generated method stub
		return dao.enrollSnsMember(session,param);
	}
	
	
	
	
	
}
