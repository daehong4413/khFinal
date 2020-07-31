package org.kh.fin.order.domain;

public class OrderValidate {
	private String memberId;
	private int productNum;
	
	public OrderValidate() {
		
	};
	
	public OrderValidate(String memberId, int productNum) {
		super();
		this.memberId = memberId;
		this.productNum = productNum;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getProductNum() {
		return productNum;
	}

	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	
	
	
	
	
}
