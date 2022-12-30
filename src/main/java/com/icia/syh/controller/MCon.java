package com.icia.syh.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.icia.syh.dto.MEMBER;
import com.icia.syh.dto.SEARCH;
import com.icia.syh.service.MService;

@Controller
public class MCon {
	
private ModelAndView mav = new ModelAndView();
	
	@Autowired
	private MService msvc;
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm() {
		
		return "M_join";
	}
	
	@RequestMapping(value = "/mJoin", method = RequestMethod.POST)
	public ModelAndView mJoin(@ModelAttribute MEMBER member) throws IllegalStateException, IOException {
		
		mav=msvc.mJoin(member);
		
		return mav;
	}
	
	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String loginForm() {
		
		return "M_login";
	}
	
	@RequestMapping(value = "/mLogin", method = RequestMethod.POST)
	public ModelAndView mLogin(@ModelAttribute MEMBER member) {
		
		
		mav =msvc.mLogin(member);
		
		
		
		return mav;
	}
	
	@RequestMapping(value = "/mLogout", method = RequestMethod.GET)
	public String mLogout() {
		
		session.invalidate();
		
		return "redirect:/index";
	}
	
	/*
	 * @RequestMapping(value = "/mList", method = RequestMethod.GET) public
	 * ModelAndView mList() {
	 * 
	 * mav = msvc.mList();
	 * 
	 * return mav; }
	 */
	@RequestMapping(value = "/mList", method = RequestMethod.GET)
	public ModelAndView pagingList(@RequestParam(value = "page",required = false, defaultValue = "1") int page, @RequestParam(value = "limit",required = false, defaultValue = "10") int limit){
		
		if(page <= 0) {
			page = 1;
		}

		mav = msvc.mList(page, limit);
		
		
		return mav;

	}
	@RequestMapping(value = "/checkId", method = RequestMethod.GET)
	public ModelAndView checkId(@RequestParam("mId") String mId) {

		mav = msvc.checkId(mId);

		return	mav ;
	}
	
	@RequestMapping(value = "/mSearch", method = RequestMethod.GET)
	public ModelAndView mSearch(@ModelAttribute SEARCH search,@RequestParam(value = "page",required = false, defaultValue = "1") int page, @RequestParam(value = "limit",required = false, defaultValue = "10") int limit) {
		if(page <= 0) {
			page = 1;
		}
		mav=msvc.mSearch(search,page,limit);
		
		return mav;
	}
	@RequestMapping(value = "/mView", method = RequestMethod.GET)
	public ModelAndView mView(@RequestParam("mId") String mId) {
		
		
		mav =msvc.mView(mId);
		

		
		return mav;
	}
	
	// 회원 수정
	@RequestMapping(value = "/mModiForm", method = RequestMethod.GET)
	public ModelAndView modiForm(@RequestParam("mId") String mId) {
		
		
		mav =msvc.mModiForm(mId);
		

		
		return mav;
	}
	@RequestMapping(value = "/mModify", method = RequestMethod.POST)
	public ModelAndView mModi(@ModelAttribute MEMBER member) throws IllegalStateException, IOException {
		
		mav =msvc.mModi(member);
		
		return mav;
	}
	
	@RequestMapping(value = "/mDel", method = RequestMethod.GET)
	public ModelAndView mDel(@RequestParam("mId") String mId, @RequestParam("admin") String admin) {
		
		
		mav =msvc.mDel(mId,admin);
		

		
		return mav;
	}
	
	@RequestMapping(value = "/idoverlap", method = RequestMethod.POST)
	public @ResponseBody String idoverlap(@RequestParam("mId") String mId) {
		
		System.out.println("ajax로 넘어온 mId : " + mId);
		
		String result = msvc.idoverlap(mId);

		return	result ;
	}
	@RequestMapping(value = "/mCheckEmail", method = RequestMethod.POST)
	public @ResponseBody String mCheckEmail(@RequestParam("mEmail") String mEmail) {
		
		
		
		String uuid = msvc.mCheckEmail(mEmail);

		return	uuid ;
	}

	

}
