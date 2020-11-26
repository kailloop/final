package com.kh.couplism.notice.model.service;

import java.util.List;

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
}
