package com.kh.couplism.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.couplism.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	
	@Override
	public int enrollMember(SqlSession session, Member m) {
		// TODO Auto-generated method stub
		return session.insert("member.enrollMember",m);
	}

}
