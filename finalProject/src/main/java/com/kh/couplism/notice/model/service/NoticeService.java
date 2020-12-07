package com.kh.couplism.notice.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.kh.couplism.notice.model.vo.Notice;
import com.kh.couplism.notice.model.vo.NoticeComment;
import com.kh.couplism.notice.model.vo.NoticeFile;

public interface NoticeService {

	public List<Notice> noticeList(String search,RowBounds rb);
	public int noticeCount(String search);
	public int insertNotice(Notice notice);
	public int insertNoticeFile(NoticeFile noticeFile);
	public Notice getNotice(int noticeNo);
	public List<NoticeFile> getNoticeFile(int noticeNo);
	public List<NoticeComment> getNoticeComment(int noticeNo);
	public int addComment(NoticeComment nc);
	public int deleteNoticeFile(int noticeNo);
	public int deleteNoticeComment(int noticeNo);
	public int deleteNotice(int noticeNo);
	public int upViewCount(Notice notice);
}
