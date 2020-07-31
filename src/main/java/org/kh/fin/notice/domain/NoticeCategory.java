package org.kh.fin.notice.domain;

public class NoticeCategory {
	private int categoryNum;
	private String categoryName;
	public NoticeCategory() {
		// TODO Auto-generated constructor stub
	}
	public NoticeCategory(int categoryNum, String categoryName) {
		super();
		this.categoryNum = categoryNum;
		this.categoryName = categoryName;
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
	@Override
	public String toString() {
		return "NoticeCategory [categoryNum=" + categoryNum + ", categoryName=" + categoryName + "]";
	}
}
