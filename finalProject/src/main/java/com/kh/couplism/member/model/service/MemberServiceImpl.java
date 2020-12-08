package com.kh.couplism.member.model.service;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.couplism.member.model.dao.MemberDao;
import com.kh.couplism.member.model.vo.Member;

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
	public int duplicateId(String id) {
		// TODO Auto-generated method stub
		return dao.duplicateId(session,id);
	}

	@Override
	public Member selectOneMember(Map param) {
		// TODO Auto-generated method stub
		return dao.selectOneMember(session,param);
	}
	
}
