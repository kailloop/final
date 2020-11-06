package com.kh.couplism.notice.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.couplism.notice.model.vo.Notice;
import com.kh.couplism.notice.model.vo.NoticeFile;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Override
	public List<Notice> noticeList(String search, RowBounds rb, SqlSessionTemplate session) {
		return session.selectList("notice.noticeList",search,rb);
	}

	@Override
	public int noticeCount(String search, SqlSessionTemplate session) {
		return session.selectOne("notice.noticeCount",search);
	}

	@Override
	public int insertNotice(Notice notice, SqlSessionTemplate session) {
		return session.insert("notice.insertNotice", notice);
	}

	@Override
	public int insertNoticeFile(NoticeFile noticeFile, SqlSessionTemplate session) {
		return session.insert("notice.insertNoticeFile", noticeFile);
	}

	@Override
	public Notice getNotice(int noticeNo, SqlSessionTemplate session) {
		return session.selectOne("notice.getNotice", noticeNo);
	}

	@Override
	public List<NoticeFile> getNoticeFile(int noticeNo, SqlSessionTemplate session) {
		return session.selectList("notice.getNoticeFile", noticeNo);
	}
	
}
