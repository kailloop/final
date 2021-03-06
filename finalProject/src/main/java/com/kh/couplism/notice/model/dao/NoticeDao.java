package com.kh.couplism.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import com.kh.couplism.notice.model.vo.Notice;
import com.kh.couplism.notice.model.vo.NoticeComment;
import com.kh.couplism.notice.model.vo.NoticeFile;

public interface NoticeDao {
	
	public List<Notice> noticeList(String search, RowBounds rb, SqlSessionTemplate session);
	public int noticeCount(String search, SqlSessionTemplate session);
	public int insertNotice(Notice notice, SqlSessionTemplate session);
	public int insertNoticeFile(NoticeFile noticeFile, SqlSessionTemplate session);
	public Notice getNotice(int noticeNo, SqlSessionTemplate session);
	public List<NoticeFile> getNoticeFile(int noticeNo, SqlSessionTemplate session);
	public List<NoticeComment> getNoticeComment(int noticeNo, SqlSessionTemplate session);
	public int addComment(NoticeComment nc, SqlSessionTemplate session);
	public int deleteNoticeFile(int noticeNo, SqlSessionTemplate session);
	public int deleteNoticeFile(Map<String,Object> deleteMap, SqlSessionTemplate session);
	public int deleteNoticeComment(int noticeNo, SqlSessionTemplate session);
	public int deleteNotice(int noticeNo, SqlSessionTemplate session);
	public int upViewCount(Notice notice, SqlSessionTemplate session);
}
