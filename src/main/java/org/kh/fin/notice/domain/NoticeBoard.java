package org.kh.fin.notice.domain;

import java.sql.Date;

public class NoticeBoard {
	private int boardNo;
	private String memberId;
	private int categoryNum;
	private String title;
	private String content;
	private Date cdt;
	private Date mdt;
	private int prgress;
	
	public NoticeBoard() {
		// TODO Auto-generated constructor stub
	}

	public NoticeBoard(int boardNo, String memberId, int categoryNum, String title, String content, Date cdt, Date mdt, int prgress) {
		super();
		this.boardNo = boardNo;
		this.memberId = memberId;
		this.categoryNum = categoryNum;
		this.title = title;
		this.content = content;
		this.cdt = cdt;
		this.mdt = mdt;
		this.prgress = prgress;
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

	public int getCategoryNum() {
		return categoryNum;
	}

	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public int getPrgress() {
		return prgress;
	}

	public void setPrgress(int prgress) {
		this.prgress = prgress;
	}

	@Override
	public String toString() {
		return "NoticeBoard [boardNo=" + boardNo + ", memberId=" + memberId + ", categoryNum=" + categoryNum
				+ ", title=" + title + ", content=" + content + ", cdt=" + cdt + ", mdt=" + mdt + ", prgress=" + prgress
				+ "]";
	}
}