package com.kh.couplism.member.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.couplism.member.model.vo.Member;
import com.kh.couplism.member.model.vo.Partner;
import com.kh.couplism.member.model.vo.SNSMember;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	
	@Override
	public int enrollMember(SqlSession session, Member m) {
		// TODO Auto-generated method stub
		return session.insert("member.enrollMember",m);
	}
	
	@Override
	public int enrollPartner(SqlSession session, Partner p) {
		// TODO Auto-generated method stub
		return session.insert("member.enrollPartner",p);
	}

	@Override
	public int duplicateId(SqlSession session,String id) {
		
		return session.selectOne("member.duplicateId",id);
	}

	@Override
	public Member selectOneMember(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectOneMember",param);
	}

	@Override
	public SNSMember selectOneSnsMember(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectOneSnsMember",param);
	}

	@Override
	public int enrollSnsMember(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.insert("member.enrollSnsMember",param);
	}

	@Override
	public Member findId(SqlSession session, Map param) {
		// TODO Auto-generated method stub
		return session.selectOne("member.findId",param);
	}
	
	
	
	
	
}

