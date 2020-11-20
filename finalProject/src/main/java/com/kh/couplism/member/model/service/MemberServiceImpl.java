package com.kh.couplism.member.model.service;

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

}
