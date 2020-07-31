package org.kh.fin.freeboard.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.kh.fin.common.PageInfo;
import org.kh.fin.freeboard.domain.FreeBoard;
import org.kh.fin.freeboard.domain.FreeComment;
import org.kh.fin.freeboard.domain.Search;
import org.kh.fin.freeboard.store.FreeBoardStore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("fService")
public class FreeBoardServicImpl implements FreeboardService {

	@Autowired
	private FreeBoardStore fStore;
	
	

	@Override
	public ArrayList<FreeBoard> freeBoardList(PageInfo pi) {
		// TODO Auto-generated method stub
		return fStore.freeBoardList(pi);
	}

	@Override
	public int insertFreeBoard(FreeBoard freeboard, HttpServletRequest request ) {
		// TODO Auto-generated method stub
		return fStore.insertFreeBoard(freeboard);
	}
	
	@Override
	public int updateFreeBoard(FreeBoard freeboard, HttpServletRequest request) {
		// TODO Auto-generated method stub
		return fStore.updateFreeBoard(freeboard);
	}

	@Override
	public int deleteFreeBoard(int boardNo) {
		// TODO Auto-generated method stub
		return fStore.deleteFreeBoard(boardNo);
	}

	@Override
	public ArrayList<FreeBoard> searchList(Search search, PageInfo pi) {
		// TODO Auto-generated method stub
		return fStore.searchList(search, pi);
	}

	@Override
	public ArrayList<FreeComment> selectFreeCommentList(int boardNo) {
		// TODO Auto-generated method stub
		return fStore.selectFreeCommentList(boardNo);
	}

	@Override
	public int insertFreeComment(FreeComment freeComment) {
		// TODO Auto-generated method stub
		//System.out.println("2"+freeComment);
		return fStore.insertFreeComment(freeComment);
	}

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return fStore.getListCount();
	}

	@Override
	public int deleteFreeComment(int commentNum) {
		// TODO Auto-generated method stub
		return fStore.deleteFreeComment(commentNum);
	}

	@Override
	public FreeBoard selectBoard(int boardNo) {
		// TODO Auto-generated method stub
		return fStore.selectFreeBoard(boardNo);
	}

	@Override
	public int updateFreeComment(FreeComment freeComment) {
		// TODO Auto-generated method stub
		return fStore.updateFreeComment(freeComment);
	}

	@Override
	public int getSearchListCount(Search search) {
		// TODO Auto-generated method stub
		return fStore.getSearchListCount(search);
	}


}
