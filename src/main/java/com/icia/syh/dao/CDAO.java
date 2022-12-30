package com.icia.syh.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.syh.dto.BOARD;
import com.icia.syh.dto.COMMENT;
import com.icia.syh.dto.PAGE;

@Repository
public class CDAO {
	
	@Autowired
	private SqlSessionTemplate sql;
	
public List<COMMENT> cList(int cbNum) {
		
		return sql.selectList("Comment.cList",cbNum);
	}

	public int cmtWrite(COMMENT comment) {
		
		return sql.insert("Comment.cmtWrite",comment);
	}

	public int cmtDel(int cbNum, int cmtNum) {
		
		return sql.delete("Comment.cmtDel",cmtNum);
	}


	public COMMENT cmtList(int cmtNum) {
		
		return sql.selectOne("Comment.cmtT",cmtNum);
	}

	public List<COMMENT> cModi(COMMENT comment) {
		
			sql.update("Comment.cmtModi",comment);
		
		return sql.selectList("Comment.cmtList",comment);
	}

	public int mycCount(String mId) {
		
		return sql.selectOne("Comment.mycCount",mId);
	}

	public List<BOARD> myCmt(PAGE paging) {
		
		return sql.selectList("Comment.myCmt", paging);
	}

}
