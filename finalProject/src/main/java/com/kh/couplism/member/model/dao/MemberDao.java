package com.kh.couplism.member.model.dao;

import org.apache.ibatis.session.SqlSession;

import com.kh.couplism.member.model.vo.Member;

public interface MemberDao {
	
	int enrollMember(SqlSession session,Member m);
}
