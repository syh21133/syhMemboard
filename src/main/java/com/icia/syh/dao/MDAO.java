package com.icia.syh.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.syh.dto.MEMBER;
import com.icia.syh.dto.PAGE;
import com.icia.syh.dto.SEARCH;

@Repository
public class MDAO {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	public int mJoin(MEMBER member) {

		return sql.insert("Member.mJoin", member);
	}

	public MEMBER mLogin(MEMBER member) {

		return sql.selectOne("Member.mLogin", member);
	}

	/*
	 * public List<MEMBER> mList() {
	 * 
	 * return sql.selectList("Member.mList"); }
	 */

	public String checkId(String mId) {

		return sql.selectOne("Member.checkId", mId);
	}

	public int mCount() {

		return sql.selectOne("Member.mCount");
	}

	public List<MEMBER> mList(PAGE paging) {

		return sql.selectList("Member.mList", paging);
	}



	public MEMBER mView(String mId) {

		return sql.selectOne("Member.mView", mId);

	}

	public int mModi(MEMBER member) {

		return sql.update("Member.mModi", member);
	}

	public int mDel(String mId) {

		return sql.delete("Member.mDel", mId);
	}

	
	public List<MEMBER> mSearch(PAGE paging) {

		return sql.selectList("Member.mSearch", paging);
	}
	
	public int msCount(SEARCH search) {
		// TODO Auto-generated method stub
		return sql.selectOne("Member.msCount",search);
	}

}
