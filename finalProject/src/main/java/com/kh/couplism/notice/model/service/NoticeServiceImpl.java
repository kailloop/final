package com.kh.couplism.notice.model.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.couplism.notice.model.dao.NoticeDao;
import com.kh.couplism.notice.model.vo.Notice;
import com.kh.couplism.notice.model.vo.NoticeFile;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<Notice> noticeList(String search, RowBounds rb) {
		return dao.noticeList(search,rb,session);
	}

	@Override
	public int noticeCount(String search) {
		return dao.noticeCount(search, session);
	}

	@Override
	public int insertNotice(Notice notice) {
		return dao.insertNotice(notice, session);
	}

	@Override
	public int insertNoticeFile(NoticeFile noticeFile) {
		return dao.insertNoticeFile(noticeFile, session);
	}

	@Override
	public Notice getNotice(int noticeNo) {
		return dao.getNotice(noticeNo, session);
	}

	@Override
	public List<NoticeFile> getNoticeFile(int noticeNo) {
		return dao.getNoticeFile(noticeNo, session);
	}
	
	
}
