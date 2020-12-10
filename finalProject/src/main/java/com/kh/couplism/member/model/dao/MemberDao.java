package com.kh.couplism.member.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.kh.couplism.member.model.vo.Member;
import com.kh.couplism.member.model.vo.Partner;

public interface MemberDao {
	
	int enrollMember(SqlSession session,Member m);
	
	int enrollPartner(SqlSession session,Partner p);
	
	int duplicateId(SqlSession session,String id);
	
	Member selectOneMember(SqlSession session,Map param);
}

