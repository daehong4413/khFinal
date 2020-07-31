package org.kh.fin.freeboard.domain;

import java.sql.Date;

public class FreeComment {
	
	private int commentNum;
	private int boardNo;
	private String memberId;
	private String cContent;
	private Date cdt;
	private Date mdt;
	private String commentStatus;
	private int parent;
	private int depth;
	private int order;
	
	public FreeComment() {
	}


	public FreeComment(int commentNum, int boardNo, String memberId, String cContent, Date cdt, Date mdt,
			String commentStatus, int parent, int depth, int order) {
		super();
		this.commentNum = commentNum;
		this.boardNo = boardNo;
		this.memberId = memberId;
		this.cContent = cContent;
		this.cdt = cdt;
		this.mdt = mdt;
		this.commentStatus = commentStatus;
		this.parent = parent;
		this.depth = depth;
		this.order = order;
	}





	public int getCommentNum() {
		return commentNum;
	}

	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
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

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
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
	
	

	public String getCommentStatus() {
		return commentStatus;
	}


	public void setCommentStatus(String commentStatus) {
		this.commentStatus = commentStatus;
	}


	public int getParent() {
		return parent;
	}


	public void setParent(int parent) {
		this.parent = parent;
	}


	public int getDepth() {
		return depth;
	}


	public void setDepth(int depth) {
		this.depth = depth;
	}


	public int getOrder() {
		return order;
	}


	public void setOrder(int order) {
		this.order = order;
	}


	@Override
	public String toString() {
		return "FreeComment [commentNum=" + commentNum + ", boardNo=" + boardNo + ", memberId=" + memberId
				+ ", cContent=" + cContent + ", cdt=" + cdt + ", mdt=" + mdt + ", commentStatus=" + commentStatus
				+ ", parent=" + parent + ", depth=" + depth + ", order=" + order + "]";
	}
	
	
	
	

}
