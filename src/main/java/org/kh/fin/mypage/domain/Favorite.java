package org.kh.fin.mypage.domain;

public class Favorite {
	private String memberId;
	private int productNum;
	public Favorite() {
		// TODO Auto-generated constructor stub
	}
	public Favorite(String memberId, int productNum) {
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
	@Override
	public String toString() {
		return "Favorite [memberId=" + memberId + ", productNum=" + productNum + "]";
	}
}
