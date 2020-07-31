package org.kh.fin.mypage.domain;

import org.kh.fin.product.domain.Product;

public class Bucket {
	private int productNum;
	private int cnt;
	
	public Bucket() {
		// TODO Auto-generated constructor stub
	}

	public Bucket(int productNum, int cnt) {
		super();
		this.productNum = productNum;
		this.cnt = cnt;
	}

	public int getProductNum() {
		return productNum;
	}

	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "Bucket [productNum=" + productNum + ", cnt=" + cnt + "]";
	}
	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		Bucket bucket = (Bucket)obj;
		return this.productNum == bucket.getProductNum();
	}
}
