package com.icia.syh.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.icia.syh.dto.BOARD;
import com.icia.syh.dto.SEARCH;
import com.icia.syh.service.BService;
import com.icia.syh.service.CService;

@Controller
public class BCon {

private ModelAndView mav = new ModelAndView();
	
	@Autowired
	private BService bsvc; 
	
	@Autowired
	private CService csvc;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value = "/bWriteForm", method = RequestMethod.GET)
	public String bWriteForm() {
		
		
		
		return "pages-board-write";
	}
	
	@RequestMapping(value = "/bWrite", method = RequestMethod.POST)
	public ModelAndView Bwrite(@ModelAttribute BOARD board) throws IllegalStateException, IOException {
		
		mav = bsvc.bWrite(board);
		
		
		return mav;
	}
	

	
	
	@RequestMapping(value = "/bView", method = RequestMethod.GET)
	public ModelAndView bView(@RequestParam("bNum") int bNum) {
		
		
		mav =bsvc.bView(bNum);
		

		
		return mav;
	}
	@RequestMapping(value = "/bModiForm", method = RequestMethod.GET)
	public ModelAndView bModiForm(@RequestParam("bNum") int bNum) {
		
		
		mav =bsvc.bModiForm(bNum);
		

		
		return mav;
	}
	@RequestMapping(value = "/bModi", method = RequestMethod.POST)
	public ModelAndView bModi(@ModelAttribute BOARD board) throws IllegalStateException, IOException {
		
		
		mav =bsvc.bModi(board);
		

		
		return mav;
	}
	@RequestMapping(value = "/bDel", method = RequestMethod.GET)
	public ModelAndView bDel(@RequestParam("bNum") int bNum) {
		
		
		mav =bsvc.bDel(bNum);
		

		
		return mav;
	}
	@RequestMapping(value = "/bList", method = RequestMethod.GET)
	public ModelAndView pagingList(@RequestParam(value = "page",required = false, defaultValue = "1") int page, @RequestParam(value = "limit",required = false, defaultValue = "10") int limit){
		
		if(page <= 0) {
			page = 1;
		}

		mav = bsvc.bList(page, limit);
		
		
		return mav;

	}
	@RequestMapping(value = "/bSearch", method = RequestMethod.GET)
	public ModelAndView mSearch(@ModelAttribute SEARCH search,@RequestParam(value = "page",required = false, defaultValue = "1") int page, @RequestParam(value = "limit",required = false, defaultValue = "10") int limit) {
		
		if(page <= 0) {
			page = 1;
		}
		
		mav=bsvc.bSearch(search,page,limit);
		
		return mav;
	}
	
	
	
	@RequestMapping(value = "/mybList", method = RequestMethod.GET)
	public ModelAndView mybList(@RequestParam("mId") String mId ,@RequestParam(value = "page",required = false, defaultValue = "1") int page, @RequestParam(value = "limit",required = false, defaultValue = "10") int limit){
		
		if(page <= 0) {
			page = 1;
		}

		mav = bsvc.myList(mId,page,limit);
		
		
		return mav;

	}
	@RequestMapping(value = "/myCmt", method = RequestMethod.GET)
	public ModelAndView myCmt(@RequestParam("mId") String mId ,@RequestParam(value = "page",required = false, defaultValue = "1") int page, @RequestParam(value = "limit",required = false, defaultValue = "10") int limit){
		
		if(page <= 0) {
			page = 1;
		}

		mav = csvc.myList(mId,page,limit);
		
		
		return mav;

	}
}
