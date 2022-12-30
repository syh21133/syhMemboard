package com.icia.syh.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.icia.syh.dto.MEMBER;
import com.icia.syh.dto.PAGE;
import com.icia.syh.dto.SEARCH;
import com.icia.syh.dao.MDAO;

@Service
public class MService {
	private ModelAndView mav = new ModelAndView();

	@Autowired
	private MDAO dao;

	@Autowired
	private HttpSession session;

	@Autowired
	private HttpServletRequest request;

	@Autowired
	private BCryptPasswordEncoder pwEnc;
	
	@Autowired
	private JavaMailSender mailSender;
	public ModelAndView mJoin(MEMBER member) throws IllegalStateException, IOException {

		member.setMAddr("(" + member.getAddr1() + ") " + member.getAddr2() + ", " + member.getAddr3());

		MultipartFile mProfile = member.getMProfile();

		UUID uuid = UUID.randomUUID();

		if (!mProfile.isEmpty()) {
			String fileName = uuid.toString().substring(0, 8) + "_" + mProfile.getOriginalFilename();

			member.setMProfileName(fileName);

			String savePath = request.getSession().getServletContext().getRealPath("/resources/proFile/");

			mProfile.transferTo(new File(savePath + fileName));

		} else {
			String filename = mProfile.getOriginalFilename();
			member.setMProfileName(filename);
		}

		// 비밀번호 암호화
		member.setMPw(pwEnc.encode(member.getMPw()));

		int result = dao.mJoin(member);

		if (result > 0) {
			mav.setViewName("index");
		} else {
			mav.setViewName("M_join");
		}
		return mav;
	}

	public ModelAndView mLogin(MEMBER member) {

		MEMBER encPw = dao.mLogin(member);

		if (pwEnc.matches(member.getMPw(), encPw.getMPw())) {
			session.setAttribute("mId", member.getMId());
			session.setAttribute("mProfileName", encPw.getMProfileName());
			mav.setViewName("redirect:/index");
		} else {
			mav.setViewName("M_login");
		}

		return mav;
	}

	/*
	 * public ModelAndView mList() {
	 * 
	 * List<MEMBER> mList = dao.mList();
	 * 
	 * mav.setViewName("M_list"); mav.addObject("mList", mList);
	 * 
	 * return mav;
	 * 
	 * }
	 */
	public ModelAndView mList(int page, int limit) {
		PAGE paging = new PAGE();

		int block = 5;
		int mCount = dao.mCount();
		int startRow = (page - 1) * limit + 1;
		int endRow = page * limit;
		int maxPage = (int) (Math.ceil((double) mCount / limit));
		int startPage = ((int) (Math.ceil((double) page / block)) - 1) * block + 1;
		int endPage = startPage + block - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		paging.setPage(page);
		paging.setStartRow(startRow);
		paging.setEndRow(endRow);
		paging.setMaxPage(maxPage);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setLimit(limit);

		List<MEMBER> mList = dao.mList(paging);

		mav.addObject("mList", mList);
		mav.addObject("paging", paging);

		mav.setViewName("pages-memberlist");

		return mav;
	}

	public ModelAndView checkId(String mId) {

		String checkId = dao.checkId(mId);

		if (checkId == null) {
			mav.setViewName("M_join1");
			mav.addObject("checkId", mId);
		} else {
			mav.setViewName("M_join2");
			mav.addObject("checkId", mId);
		}

		return mav;
	}

	public ModelAndView mSearch(SEARCH search, int page, int limit) {
		PAGE paging = new PAGE();
		
		int block = 5;
		int bCount = dao.msCount(search);
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
		
		List<MEMBER> mList = dao.mSearch(paging);

		mav.addObject("paging", paging);
		mav.addObject("mList", mList);
		mav.setViewName("pages-memberlist-search");

		return mav;
	}

	public ModelAndView mView(String mId) {

		MEMBER member = dao.mView(mId);


		mav.setViewName("pages-profile");
		mav.addObject("view", member);

		return mav;
	}

	public ModelAndView mModiForm(String mId) {

		MEMBER member = dao.mView(mId);

		mav.setViewName("pages-profile-modi");
		mav.addObject("modi", member);

		return mav;
	}

	public ModelAndView mModi(MEMBER member) throws IllegalStateException, IOException {

		MultipartFile mProfile = member.getMProfile();

		UUID uuid = UUID.randomUUID();

		if (mProfile.getOriginalFilename().isEmpty()) {
			String fileName = member.getMProfileName();
			member.setMProfileName(fileName);

		} else {
			
			if (mProfile != null) {
				
				String deletePath = request.getSession().getServletContext().getRealPath("/resources/proFile/");
				File deleteFile = new File(deletePath + member.getMProfileName());
				if (deleteFile.exists()) {
					deleteFile.delete();
					System.out.println("기존 파일 삭제 성공!");
				} else {
					System.out.println("파일존재x, 삭제 실패!");
				}

				String fileName = uuid.toString().substring(0, 8) + "_" + mProfile.getOriginalFilename();

				member.setMProfileName(fileName);

				String savePath = request.getSession().getServletContext().getRealPath("/resources/proFile/");

				mProfile.transferTo(new File(savePath + fileName));

			}
		}
		member.setMAddr("(" + member.getAddr1() + ") " + member.getAddr2() + ", " + member.getAddr3());

		member.setMPw(pwEnc.encode(member.getMPw()));

		int result = dao.mModi(member);

		if (result > 0) {
			mav.setViewName("redirect:/mView?mId=" + member.getMId());
		} else {
			mav.setViewName("redirect:/mList");
		}

		return mav;

	}

	public ModelAndView mDel(String mId, String admin) {

		int result = dao.mDel(mId);

		if (result > 0) {

			if (admin.equals("admin")) {
				mav.setViewName("redirect:/mList");
			} else {
				session.invalidate();
				mav.setViewName("Home");
			}

		} else {
			mav.setViewName("index");
		}

		return mav;
	}

	public String idoverlap(String mId) {
		
		String checkId = dao.checkId(mId);
		String result;

		if (checkId == null) {
			result = "OK";
		} else {
			result = "NO";
		}

		return result;
	}

	public String mCheckEmail(String mEmail) {
		
		String uuid = UUID.randomUUID().toString().substring(0,6);
		
		MimeMessage mail = mailSender.createMimeMessage();
		
		String mailContent = "<h2>안녕하세요 인천일보아카데미입니다.</h2><br/>"
				+ "<h3>인증번호는 " +uuid+"입니다.</h3>";
		
		try {
			mail.setSubject("[이메일 인증] 인천일보 아카데미 이메일 인증","UTF-8");
			mail.setText(mailContent,"UTF-8","html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(mEmail));
			
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		
		return uuid;
	}

}
