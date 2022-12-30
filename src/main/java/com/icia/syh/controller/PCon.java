package com.icia.syh.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.icia.syh.service.BService;

@Controller
public class PCon {
	
private ModelAndView mav = new ModelAndView();
	
	@Autowired
	private BService bsvc;
	
	@Autowired
	private HttpSession session;
	
	/*
	 * @RequestMapping(value = "/", method = RequestMethod.GET) public ModelAndView
	 * index() {
	 * 
	 * mav=bsvc.index();
	 * 
	 * return mav; }
	 */
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		
		
		
		return "index1";
	}
	@RequestMapping(value = "/charts-chartjs", method = RequestMethod.GET)
	public String chartschartjs() {
		
		return "charts-chartjs";
	}
	@RequestMapping(value = "/icons-feather", method = RequestMethod.GET)
	public String iconsfeather() {
		
		return "icons-feather";
	}
	@RequestMapping(value = "/maps-google", method = RequestMethod.GET)
	public String mapsgoogle() {
		
		return "maps-google";
	}
	@RequestMapping(value = "/pages-blank", method = RequestMethod.GET)
	public String pagesblank() {
		
		return "pages-blank";
	}
	@RequestMapping(value = "/pages-profile", method = RequestMethod.GET)
	public String pagesprofile() {
		
		return "pages-profile";
	}
	@RequestMapping(value = "/pages-sign-in", method = RequestMethod.GET)
	public String pagessignin() {
		
		return "pages-sign-in";
	}
	@RequestMapping(value = "/pages-sign-up", method = RequestMethod.GET)
	public String pagessignup() {
		
		return "pages-sign-up";
	}
	@RequestMapping(value = "/ui-buttons", method = RequestMethod.GET)
	public String uibuttons() {
		
		return "ui-buttons";
	}
	@RequestMapping(value = "/ui-cards", method = RequestMethod.GET)
	public String uicards() {
		
		return "ui-cards";
	}
	@RequestMapping(value = "/ui-forms", method = RequestMethod.GET)
	public String uiforms() {
		
		return "ui-forms";
	}
	@RequestMapping(value = "/ui-typography", method = RequestMethod.GET)
	public String uitypography() {
		
		return "ui-typography";
	}
	
	
	@RequestMapping(value = "/pages-board", method = RequestMethod.GET)
	public String pagesprofilecommunity() {
		
		return "pages-board";
	}
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView index1() {
		
		mav=bsvc.index();
		
		return mav;
	}
	
	

	

}
