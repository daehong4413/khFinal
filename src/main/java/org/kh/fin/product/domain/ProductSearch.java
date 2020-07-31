package org.kh.fin.product.domain;

public class ProductSearch {
	private String memberId;
	private String productName;
	
	public ProductSearch() {
		// TODO Auto-generated constructor stub
	}
	
	public ProductSearch(String memberId, String productName) {
		super();
		this.memberId = memberId;
		this.productName = productName;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	@Override
	public String toString() {
		return "ProductSearch [memberId=" + memberId + ", productName=" + productName + "]";
	}
}
