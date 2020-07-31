package org.kh.fin.product.domain;


public class ProductInCart {
	private int productNum;
	private int categoryNum;
	private String productMainName;
	private String productName;
	private int productStock;
	private int productPrice;
	private String productSize;
	private String productColor;
	private int orderQty;
	public ProductInCart() {
		// TODO Auto-generated constructor stub
	}
	public ProductInCart(int productNum, int categoryNum, String productMainName, String productName, int productStock,
			int productPrice, String productSize, String productColor, int orderQty) {
		super();
		this.productNum = productNum;
		this.categoryNum = categoryNum;
		this.productMainName = productMainName;
		this.productName = productName;
		this.productStock = productStock;
		this.productPrice = productPrice;
		this.productSize = productSize;
		this.productColor = productColor;
		this.orderQty = orderQty;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public int getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
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
	public int getProductStock() {
		return productStock;
	}
	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductSize() {
		return productSize;
	}
	public void setProductSize(String productSize) {
		this.productSize = productSize;
	}
	public String getProductColor() {
		return productColor;
	}
	public void setProductColor(String productColor) {
		this.productColor = productColor;
	}
	public int getOrderQty() {
		return orderQty;
	}
	public void setOrderQty(int orderQty) {
		this.orderQty = orderQty;
	}
	@Override
	public String toString() {
		return "ProductInCart [productNum=" + productNum + ", categoryNum=" + categoryNum + ", productMainName="
				+ productMainName + ", productName=" + productName + ", productStock=" + productStock
				+ ", productPrice=" + productPrice + ", productSize=" + productSize + ", productColor=" + productColor
				+ ", orderQty=" + orderQty + "]";
	}
	
	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		ProductInCart product = (ProductInCart)obj;
		return this.productNum == product.getProductNum();
	}
}
