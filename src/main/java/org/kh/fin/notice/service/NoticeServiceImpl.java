package org.kh.fin.notice.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.kh.fin.common.PageInfo;
import org.kh.fin.member.domain.Member;
import org.kh.fin.notice.domain.NoticeBoard;
import org.kh.fin.notice.domain.NoticeCategory;
import org.kh.fin.notice.domain.Search;
import org.kh.fin.notice.store.NoticeStoreLogic;

@Service
public class NoticeServiceImpl {
	@Autowired
	private NoticeStoreLogic nStore;
	
	public ArrayList<NoticeCategory> getCategory(){
		return nStore.getCategory();
	}
	
	public ArrayList<NoticeBoard> selectList(PageInfo pi) {
		return nStore.selectList(pi);
	}

	public int insertNotice(NoticeBoard notice,HttpServletRequest request) {
		// textarea의 개행문자를 <br>로 변경
		//notice.setnContent(notice.getnContent().replace("\n", "<br>"));
		return nStore.insertNotice(notice);
	}

	public NoticeBoard selectOne(int boardNo) {
		return nStore.selectOne(boardNo);
	}

	public int updateNotice(NoticeBoard notice) {
		
		return nStore.updateNotice(notice);
	}

	public int deleteNotice(int boardNo) {
		
		return nStore.deleteNotice(boardNo);
	}

	public ArrayList<NoticeBoard> searchList(Search search,PageInfo pi) {
		
		return nStore.searchList(search,pi);
	}

	public int getListCount() {
		return nStore.getListCount();
	}
	//검색후 페이징 처리 
	public int getListSearchCount(Search search) {
		return nStore.getListSearchCount(search);
	}
	
	public int blackMember(String memberId) {
		return nStore.blackMember(memberId);
	}

	public int outMember(String memberId) {
		return nStore.outMember(memberId);
	}

	public ArrayList<Member> searchList(Search search) {
		return nStore.searchList(search);
	}

	public ArrayList<Member> selectListblack(PageInfo pi) {
		return nStore.selectListblack(pi);
	}
	public int getListCountblack() {
		return nStore.getListCountblack();
	}
		

}
