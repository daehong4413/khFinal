package org.kh.fin.common.domain;

public class MainItem {
	private int categoryNum;
	private String categoryName;
	private String productMainName;
	private int productNum;
	private String productName;
	private int productPrice;
	private int cnt;
	
	public MainItem() {
		// TODO Auto-generated constructor stub
	}
	public MainItem(int categoryNum, String categoryName, String productMainName, int productNum, String productName,
			int productPrice, int cnt) {
		super();
		this.categoryNum = categoryNum;
		this.categoryName = categoryName;
		this.productMainName = productMainName;
		this.productNum = productNum;
		this.productName = productName;
		this.productPrice = productPrice;
		this.cnt = cnt;
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

	public String getProductMainName() {
		return productMainName;
	}

	public void setProductMainName(String productMainName) {
		this.productMainName = productMainName;
	}

	public int getProductNum() {
		return productNum;
	}

	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return "MainItem [categoryNum=" + categoryNum + ", categoryName=" + categoryName + ", productMainName="
				+ productMainName + ", productNum=" + productNum + ", productName=" + productName + ", productPrice="
				+ productPrice + ", cnt=" + cnt + "]";
	}
}
