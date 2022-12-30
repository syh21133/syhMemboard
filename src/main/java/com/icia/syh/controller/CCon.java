package com.icia.syh.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icia.syh.dto.COMMENT;
import com.icia.syh.service.CService;

@Controller
@RequestMapping("/comment")
public class CCon {
	
	private ModelAndView mav = new ModelAndView();
	
	@Autowired
	private CService csvc;

	@RequestMapping(value="/commentList", method=RequestMethod.POST)
	public @ResponseBody List<COMMENT> cList(@RequestParam("cbNum") int cbNum ){
		
		List<COMMENT> commentList = csvc.cList(cbNum);
		
		return commentList;
	}
	
	@RequestMapping(value="/cmtWrite", method=RequestMethod.POST)
	public @ResponseBody List<COMMENT> cmtWrite(@ModelAttribute COMMENT comment){
		
		List<COMMENT> commentList = csvc.cmtWrite(comment);
		
		return commentList;
		
	}
	
	@RequestMapping(value="/cmtDel", method=RequestMethod.POST)
	public @ResponseBody List<COMMENT> cmtDel(@RequestParam("cbNum") int cbNum, @RequestParam("cmtNum") int cmtNum ){
		
		List<COMMENT> commentList = csvc.cmtDel(cbNum,cmtNum);
		
		return commentList;
	}
	
	@RequestMapping(value = "/cmtModiForm", method = RequestMethod.POST)
	public @ResponseBody List<COMMENT> cmtModiForm(@RequestParam("cbNum") int cbNum, @RequestParam("cmtNum") int cmtNum) {

		List<COMMENT> commentList = csvc.cmtModiform(cbNum, cmtNum);

		return commentList;
	}
	
	@RequestMapping(value = "/cmtModi", method = RequestMethod.POST)
	public @ResponseBody List<COMMENT> cmtModi(@RequestParam("cmtNum") int cmtNum, @RequestParam("cmtContent") String cmtContent) {

		
		List<COMMENT> commentList = csvc.cmtModi(cmtNum, cmtContent);

		return commentList;
	}
	
	
}
