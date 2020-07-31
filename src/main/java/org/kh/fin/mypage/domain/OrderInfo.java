package org.kh.fin.mypage.domain;

import java.sql.Date;

public class OrderInfo {
	private String orderNum;
	private int statusNum;
	private String statusName;
	private String productName;
	private int totalPrice;
	private String thumbNailFile;
	private Date cdt;
	public OrderInfo() {
		// TODO Auto-generated constructor stub
	}
	public OrderInfo(String orderNum, int statusNum, String statusName, String productName, int totalPrice,
			String thumbNailFile, Date cdt) {
		super();
		this.orderNum = orderNum;
		this.statusNum = statusNum;
		this.statusName = statusName;
		this.productName = productName;
		this.totalPrice = totalPrice;
		this.thumbNailFile = thumbNailFile;
		this.cdt = cdt;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public int getStatusNum() {
		return statusNum;
	}
	public void setStatusNum(int statusNum) {
		this.statusNum = statusNum;
	}
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getThumbNailFile() {
		return thumbNailFile;
	}
	public void setThumbNailFile(String thumbNailFile) {
		this.thumbNailFile = thumbNailFile;
	}
	public Date getCdt() {
		return cdt;
	}
	public void setCdt(Date cdt) {
		this.cdt = cdt;
	}
}
