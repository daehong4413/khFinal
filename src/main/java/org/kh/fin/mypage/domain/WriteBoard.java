package org.kh.fin.mypage.domain;

import java.sql.Date;

public class WriteBoard {
	private String memberId;
	private String boardNum;
	private int grpNum;
	private int categoryNum;
	private String categoryName;
	private String title;
	private String content;
	private String thumbNailFile;
	private String clickChk;
	private Date cdt;
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(String boardNum) {
		this.boardNum = boardNum;
	}
	public int getGrpNum() {
		return grpNum;
	}
	public void setGrpNum(int grpNum) {
		this.grpNum = grpNum;
	}
	public int getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
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
	public String getThumbNailFile() {
		return thumbNailFile;
	}
	public void setThumbNailFile(String thumbNailFile) {
		this.thumbNailFile = thumbNailFile;
	}
	public String getClickChk() {
		return clickChk;
	}
	public void setClickChk(String clickChk) {
		this.clickChk = clickChk;
	}
	public Date getCdt() {
		return cdt;
	}
	public void setCdt(Date cdt) {
		this.cdt = cdt;
	}
}
