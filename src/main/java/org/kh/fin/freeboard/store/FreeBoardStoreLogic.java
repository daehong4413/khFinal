package org.kh.fin.freeboard.store;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.kh.fin.common.PageInfo;
import org.kh.fin.freeboard.domain.FreeBoard;
import org.kh.fin.freeboard.domain.FreeComment;
import org.kh.fin.freeboard.domain.Search;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository("fStore")
public class FreeBoardStoreLogic implements FreeBoardStore {

	@Autowired
	private SqlSessionTemplate sqlsession;

	@Override
	public ArrayList<FreeBoard> freeBoardList(PageInfo pi) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowbounds =new RowBounds(offset, pi.getBoardLimit());

		return(ArrayList)sqlsession.selectList("fBoardMapper.freeboardList", null, rowbounds);
	}

	@Override
	public int insertFreeBoard(FreeBoard freeboard) {
		// TODO Auto-generated method stub
		return sqlsession.insert("fBoardMapper.insertFreeboard", freeboard);
	}

	@Override
	public int updateFreeBoard(FreeBoard freeboard) {
		// TODO Auto-generated method stub
		return sqlsession.update("fBoardMapper.updateFreeboard", freeboard);
	}

	@Override
	public int deleteFreeBoard(int boardNo) {
		// TODO Auto-generated method stub
		return sqlsession.update("fBoardMapper.deleteFreeboard", boardNo);
	}

	@Override
	public ArrayList<FreeBoard> searchList(Search search, PageInfo pi) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowbounds =new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlsession.selectList("fBoardMapper.searchList", search, rowbounds);
	}

	
	public int getListCount() {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("fBoardMapper.getListCount");
	}

	@Override
	public ArrayList<FreeComment> selectFreeCommentList(int boardNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlsession.selectList("fBoardMapper.commentList",boardNo);
	}

	@Override
	public int insertFreeComment(FreeComment freecomment) {
		// TODO Auto-generated method stub
		System.out.println("1"+freecomment);
		return sqlsession.insert("fBoardMapper.insertComment",freecomment);
	}

	@Override
	public int deleteFreeComment(int commentNum) {
		// TODO Auto-generated method stub
		return sqlsession.delete("fBoardMapper.deleteComment", commentNum);
	}

	@Override
	public FreeBoard selectFreeBoard(int boardNo) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("fBoardMapper.selectOne", boardNo);
	}

	@Override
	public int updateFreeComment(FreeComment freecomment) {
		// TODO Auto-generated method stub
		return sqlsession.update("fBoardMapper.updateComment", freecomment);
	}

	@Override
	public int getSearchListCount(Search search) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("fBoardMapper.getSearchListCount", search);
	}

}
