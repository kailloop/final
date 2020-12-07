package com.kh.couplism.member.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kh.couplism.member.model.vo.Member;

public interface MemberDao {
	
	int enrollMember(SqlSession session,Member m);
	
	int duplicateId(SqlSession session,String id);
	
	Member selectOneMember(SqlSession session,Map param);
}
