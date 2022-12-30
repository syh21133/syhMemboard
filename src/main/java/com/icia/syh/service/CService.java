package com.icia.syh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.icia.syh.dto.BOARD;
import com.icia.syh.dto.COMMENT;
import com.icia.syh.dto.PAGE;
import com.icia.syh.dao.CDAO;

@Service
public class CService {
	
	private ModelAndView mav = new ModelAndView();
	
	@Autowired
	private CDAO dao;
	
public List<COMMENT> cList(int cbNum) {
		
		List<COMMENT> commentList = dao.cList(cbNum);
		
		return commentList;
	}

	public List<COMMENT> cmtWrite(COMMENT comment) {
		
		List<COMMENT> commentList;
		
		int result = dao.cmtWrite(comment);
			
		if(result>0) {
			commentList = dao.cList(comment.getCbNum());
		}else {
			commentList = null;
		}
		
		return commentList;
	}

	public List<COMMENT> cmtDel(int cbNum, int cmtNum) {
		List<COMMENT> commentList;
		
		int result = dao.cmtDel(cbNum, cmtNum);
		
		if(result>0) {
			commentList = dao.cList(cbNum);
		}else {
			commentList = null;
		}
		
		return commentList;
	}

	public List<COMMENT> cmtModiform(int cbNum, int cmtNum) {

		
		List<COMMENT> commentList = dao.cList(cbNum);

		return commentList;
	}

	public List<COMMENT> cmtModi(int cmtNum, String cmtContent) {
		
		COMMENT comment = dao.cmtList(cmtNum);
		
		comment.setCmtContent(cmtContent);
		
		List<COMMENT> commentList = dao.cModi(comment);
		
		return commentList;
	}

	public ModelAndView myList(String mId, int page, int limit) {
		PAGE paging = new PAGE();
		
		int block = 5;
		int bCount = dao.mycCount(mId);
		int startRow = (page-1)*limit+1;
		int endRow = page*limit;
		int maxPage = (int)(Math.ceil((double)bCount/limit));
		int startPage = ((int)(Math.ceil((double)page/block))-1)*block+1;
		int endPage = startPage+block-1;
		
		if(endPage>maxPage) {
			endPage=maxPage;
		}
		
		paging.setPage(page);
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		paging.setMaxPage(maxPage);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setLimit(limit);
		paging.setMId(mId);
		
		List<BOARD> myCmt = dao.myCmt(paging);
		
		mav.addObject("myCmt", myCmt);
		mav.addObject("paging", paging);
		
		mav.setViewName("pages-mycmt");
		
		return mav;
	}

}
