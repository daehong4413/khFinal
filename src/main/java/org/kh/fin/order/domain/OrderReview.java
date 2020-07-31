package org.kh.fin.order.domain;

import java.sql.Date;

public class OrderReview {

	private int productNum;
	private String orderNum;
	private String title;
	private String content;
	private String member;
	private String categoryName;
	private String productName;
	private Date cdt;
	private Date mdt;
	private String fileName;
	
	public OrderReview() {
		
	}

	public OrderReview(int productNum, String orderNum, String title, String content, String member,
			String categoryName, String productName, Date cdt, Date mdt, String fileName) {
		super();
		this.productNum = productNum;
		this.orderNum = orderNum;
		this.title = title;
		this.content = content;
		this.member = member;
		this.categoryName = categoryName;
		this.productName = productName;
		this.cdt = cdt;
		this.mdt = mdt;
		this.fileName = fileName;
	}

	public int getProductNum() {
		return productNum;
	}

	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}

	public String getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
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

	public String getMember() {
		return member;
	}

	public void setMember(String member) {
		this.member = member;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
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

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	
	
}
