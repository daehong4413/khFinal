package org.kh.fin.order.domain;

public class OrderProduct {
	private String productMainName;
	private String productName;
	private int orderQty;
	private int productPrice;
	public OrderProduct() {
		// TODO Auto-generated constructor stub
	}
	public OrderProduct(String productMainName, String productName, int orderQty, int productPrice) {
		super();
		this.productMainName = productMainName;
		this.productName = productName;
		this.orderQty = orderQty;
		this.productPrice = productPrice;
	}
	public String getProductMainName() {
		return productMainName;
	}
	public void setProductMainName(String productMainName) {
		this.productMainName = productMainName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
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
	@Override
	public String toString() {
		return "OrderProduct [productMainName=" + productMainName + ", productName=" + productName + ", orderQty="
				+ orderQty + ", productPrice=" + productPrice + "]";
	}
}
