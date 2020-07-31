package org.kh.fin.order.domain;

public class OrderDetail {

	private int productNum;
	private String orderNum;
	private int orderQty;
	private int productPrice;
	

	public OrderDetail() {}

	
	//프로시저 sql 하나로 묶기
	//

	public OrderDetail(int productNum, String orderNum, int orderQty, int productPrice) {
		super();
		this.productNum = productNum;
		this.orderNum = orderNum;
		this.orderQty = orderQty;
		this.productPrice = productPrice;
	}



	@Override
	public String toString() {
		return "OrderDetail [productNum=" + productNum + ", orderNum=" + orderNum + ", orderQty=" + orderQty
				+ ", productPrice=" + productPrice + "]";
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



	public int getOrderQty() {
		return orderQty;
	}



	public void setOrderQty(int orderQty) {
		this.orderQty = orderQty;
	}



	public int getProductPrice() {
		return productPrice;
	}



	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	
	
	
}
