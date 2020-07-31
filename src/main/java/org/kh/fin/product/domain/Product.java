package org.kh.fin.product.domain;

import java.util.Date;

public class Product {

	private int productNum;
	private int categoryNum;
	private String productMainName;
	private String productMainPath;
	private String productName;
	private int productStock;
	private int productPrice;
	private String productInfo;
	private String productSize;
	private String productColor;
	private int productShowCnt;
	private String productStatus;
	private Date cdt;
	private Date mdt;
	private int fCnt;
	private String fStat;
	
	public Product() {}
	
	
	public Product(int productNum, int categoryNum, String productMainName, String productMainPath, String productName,
			int productStock, int productPrice, String productInfo, String productSize, String productColor,
			int productShowCnt, String productStatus, Date cdt, Date mdt) {
		super();
		this.productNum = productNum;
		this.categoryNum = categoryNum;
		this.productMainName = productMainName;
		this.productMainPath = productMainPath;
		this.productName = productName;
		this.productStock = productStock;
		this.productPrice = productPrice;
		this.productInfo = productInfo;
		this.productSize = productSize;
		this.productColor = productColor;
		this.productShowCnt = productShowCnt;
		this.productStatus = productStatus;
		this.cdt = cdt;
		this.mdt = mdt;
	}
	
	
	public Product(int productNum, int categoryNum, String productMainName, String productMainPath, String productName,
			int productStock, int productPrice, String productInfo, String productSize, String productColor,
			int productShowCnt, String productStatus, Date cdt, Date mdt, int fCnt, String fStat) {
		super();
		this.productNum = productNum;
		this.categoryNum = categoryNum;
		this.productMainName = productMainName;
		this.productMainPath = productMainPath;
		this.productName = productName;
		this.productStock = productStock;
		this.productPrice = productPrice;
		this.productInfo = productInfo;
		this.productSize = productSize;
		this.productColor = productColor;
		this.productShowCnt = productShowCnt;
		this.productStatus = productStatus;
		this.cdt = cdt;
		this.mdt = mdt;
		this.fCnt = fCnt;
		this.fStat = fStat;
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
	public String getProductMainPath() {
		return productMainPath;
	}
	public void setProductMainPath(String productMainPath) {
		this.productMainPath = productMainPath;
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
	public String getProductInfo() {
		return productInfo;
	}
	public void setProductInfo(String productInfo) {
		this.productInfo = productInfo;
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
	public int getProductShowCnt() {
		return productShowCnt;
	}
	public void setProductShowCnt(int productShowCnt) {
		this.productShowCnt = productShowCnt;
	}
	public String getProductStatus() {
		return productStatus;
	}
	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
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
	public int getfCnt() {
		return fCnt;
	}
	public void setfCnt(int fCnt) {
		this.fCnt = fCnt;
	}
	public String getfStat() {
		return fStat;
	}
	public void setfStat(String fStat) {
		this.fStat = fStat;
	}
	@Override
	public String toString() {
		return "Product [productNum=" + productNum + ", categoryNum=" + categoryNum + ", productMainName="
				+ productMainName + ", productMainPath=" + productMainPath + ", productName=" + productName
				+ ", productStock=" + productStock + ", productPrice=" + productPrice + ", productInfo=" + productInfo
				+ ", productSize=" + productSize + ", productColor=" + productColor + ", productShowCnt="
				+ productShowCnt + ", productStatus=" + productStatus + ", cdt=" + cdt + ", mdt=" + mdt + ", fCnt="
				+ fCnt + ", fStat=" + fStat + "]";
	}	
}
