package org.kh.fin.freeboard.domain;

import java.sql.Date;

public class FreeBoard {
	
	private int boardNo;
	private String memberId;
	private String title;
	private String bContent;
	private Date cdt;
	private Date mdt;
	private String boardStatus;
	
	public FreeBoard() {}

	public FreeBoard(int boardNo, String memberId, String title, String bContent, Date cdt, Date mdt, String boardStatus) {
		super();
		this.boardNo = boardNo;
		this.memberId = memberId;
		this.title = title;
		this.bContent = bContent;
		this.cdt = cdt;
		this.mdt = mdt;
		this.boardStatus = boardStatus;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public Date getCdt() {
		return cdt;
	}

	public void setCdt(Date cdt) {
		this.cdt = cdt;
	}

	public Date getMdt() {
		return mdt;
	}

	public void setMdt(Date mdt) {
		this.mdt = mdt;
	}

	public String getboardStatus() {
		return boardStatus;
	}

	public void setboardStatus(String boardStatus) {
		this.boardStatus = boardStatus;
	}

	@Override
	public String toString() {
		return "FreeBoard [boardNo=" + boardNo + ", memberId=" + memberId + ", title=" + title + ", bContent=" + bContent
				+ ", cdt=" + cdt + ", mdt=" + mdt + ", boardStatus=" + boardStatus + "]";
	}
	
	
	
	

}
