package com.icia.syh.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.icia.syh.dto.BOARD;
import com.icia.syh.dto.PAGE;
import com.icia.syh.dto.SEARCH;

@Repository
public class BDAO {
	@Autowired
	private SqlSessionTemplate sql;
	
public int bWrite(BOARD board) {
		
		return sql.insert("Board.bWrite", board);
		}


	public BOARD bView(int bNum) {
		
		sql.update("Board.bHit", bNum);
		
		return sql.selectOne("Board.bView", bNum);
	}


	public int bModi(BOARD board) {
		
		return sql.update("Board.bModi", board);
	}

	public int mDel(int bNum) {
		
		return sql.delete("Board.bDel", bNum);
	}

	public int bCount() {
		
		return sql.selectOne("Board.bCount");
	}
	public List<BOARD> bList(PAGE paging) {
		
		return sql.selectList("Board.bList", paging);
	}


	public List<BOARD> bSearch(PAGE paging) {
		
		return sql.selectList("Board.bSearch", paging);
	}


	public List<BOARD> indexlist() {
		
		return sql.selectList("Board.indexList");
	}


	public List<BOARD> indexDate() {
		
		return sql.selectList("Board.indexDate");
	}


	public List<BOARD> myList(PAGE paging) {
		
		return sql.selectList("Board.myList", paging);
	}


	public int mybCount(String mId) {
		
		return sql.selectOne("Board.mybCount",mId);
	}


	public int bsCount(SEARCH search) {
		
		return sql.selectOne("Board.bsCount",search);
	}
	
	

}
