package com.icia.syh.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.icia.syh.dto.BOARD;
import com.icia.syh.dto.PAGE;
import com.icia.syh.dto.SEARCH;
import com.icia.syh.dao.BDAO;

@Service
public class BService {
	
	private ModelAndView mav = new ModelAndView();
	
	@Autowired
	private BDAO dao;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private HttpServletRequest request;
	
	
	public ModelAndView bWrite(BOARD board) throws IllegalStateException, IOException {

		MultipartFile bFile = board.getBFile();

		UUID uuid = UUID.randomUUID();

		if (!bFile.isEmpty() ) {
			String fileName = uuid.toString().substring(0, 8) + "_" + bFile.getOriginalFilename();

			board.setBFileName(fileName);

			String savePath = request.getSession().getServletContext().getRealPath("/resources/proFile/");

			bFile.transferTo(new File(savePath + fileName));

		} else {
			String filename = bFile.getOriginalFilename();
			board.setBFileName(filename);
		}

		int result = dao.bWrite(board);

		if (result > 0) {
			mav.setViewName("redirect:/bList");
		} else {
			mav.setViewName("B_write");
		}

		return mav;
	}


	public ModelAndView bView(int bNum) {

		BOARD board = dao.bView(bNum);

		mav.setViewName("pages-board-view");
		mav.addObject("view", board);

		return mav;
	}

	public ModelAndView bModiForm(int bNum) {

		BOARD board = dao.bView(bNum);

		mav.setViewName("pages-board-modi");
		mav.addObject("modi", board);

		return mav;
	}

	public ModelAndView bModi(BOARD board) throws IllegalStateException, IOException {

		MultipartFile bFile = board.getBFile();
		
		UUID uuid = UUID.randomUUID();

		if (bFile.getOriginalFilename().isEmpty()) {
			String fileName = board.getBFileName();
			board.setBFileName(fileName);

		} else {

			
			if (bFile != null) {
				
				String deletePath = request.getSession().getServletContext().getRealPath("/resources/proFile/");
				File deleteFile = new File(deletePath + board.getBFileName());
				if (deleteFile.exists()) {
					deleteFile.delete();
					System.out.println("기존 파일 삭제 성공!");
				} else {
					System.out.println("파일존재x, 삭제 실패!");
				}
				
				String fileName = uuid.toString().substring(0, 8) + "_" + bFile.getOriginalFilename();

				board.setBFileName(fileName);

				String savePath = request.getSession().getServletContext().getRealPath("/resources/proFile/");

				bFile.transferTo(new File(savePath+ fileName));
				
				System.out.println(savePath);

			}
		}

		int result = dao.bModi(board);

		if (result > 0) {
			mav.setViewName("redirect:/bView?bNum=" + board.getBNum());
		} else {
			mav.setViewName("redirect:/bList");
		}

		return mav;
	}

	public ModelAndView bDel(int bNum) {
		int result = dao.mDel(bNum);
		
		if(result>0) {
			mav.setViewName("redirect:/bList");
			
		}else {
			mav.setViewName("redirect:/bView?bNum="+bNum);
		}
		
		return mav;
	}

public ModelAndView bList(int page, int limit) {
		
		PAGE paging = new PAGE();
		
		int block = 5;
		int bCount = dao.bCount();
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
		
		List<BOARD> bList = dao.bList(paging);
		
		mav.addObject("bList", bList);
		mav.addObject("paging", paging);
		
		mav.setViewName("pages-board");
		
		return mav;
	}


public ModelAndView bSearch(SEARCH search, int page, int limit) {
	
	PAGE paging = new PAGE();
	
	int block = 5;
	int bCount = dao.bsCount(search);
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
	paging.setCategory(search.getCategory());
	paging.setKeyword(search.getKeyword());
	
	/* List<BOARD> bList = dao.bSearch(search); */
	
	List<BOARD> bList = dao.bSearch(paging);
	
	mav.addObject("paging", paging);
	mav.addObject("bList", bList);
	mav.setViewName("pages-board-search");

	return mav;
}

public ModelAndView myList(String mId, int page, int limit) {
	
	PAGE paging = new PAGE();
	
	int block = 5;
	int bCount = dao.mybCount(mId);
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
	
	List<BOARD> myList = dao.myList(paging);
	
	mav.addObject("myList", myList);
	mav.addObject("paging", paging);
	
	mav.setViewName("pages-myboard");
	
	return mav;
}

public ModelAndView index() {
	
	List<BOARD> board = dao.indexlist();

	mav.addObject("index", board);
	
	board = dao.indexDate();
	mav.addObject("date", board);

	mav.setViewName("index");
	
	return mav;
}





/*
 * public ModelAndView bSearch(String category, String keyword, int page, int
 * limit) {
 * 
 * SEARCH search = new SEARCH(); search.setCategory(category);
 * search.setKeyword(keyword);
 * 
 * PAGE paging = new PAGE();
 * 
 * int block = 5; int bCount = dao.bsCount(search); int startRow =
 * (page-1)*limit+1; int endRow = page*limit; int maxPage =
 * (int)(Math.ceil((double)bCount/limit)); int startPage =
 * ((int)(Math.ceil((double)page/block))-1)*block+1; int endPage =
 * startPage+block-1;
 * 
 * if(endPage>maxPage) { endPage=maxPage; }
 * 
 * paging.setPage(page); paging.setStartRow(startRow); paging.setEndRow(endRow);
 * paging.setMaxPage(maxPage); paging.setStartPage(startPage);
 * paging.setEndPage(endPage); paging.setLimit(limit);
 * 
 * List<BOARD> bList = dao.bSearch(search);
 * 
 * 
 * mav.addObject("bList", bList); mav.setViewName("pages-board-search");
 * 
 * return mav; }
 */

}
