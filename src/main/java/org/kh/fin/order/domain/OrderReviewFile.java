package org.kh.fin.order.domain;

public class OrderReviewFile {
	private int fileNum;
	private String fileName;
	private String filePath;
	private int productNum;
	private String orderNum;
	
	public OrderReviewFile() {}
	
	public OrderReviewFile(int fileNum, String fileName, String filePath, int productNum, String orderNum) {
		super();
		this.fileNum = fileNum;
		this.fileName = fileName;
		this.filePath = filePath;
		this.productNum = productNum;
		this.orderNum = orderNum;
	}
	
	
	public int getFileNum() {
		return fileNum;
	}
	public void setFileNum(int fileNum) {
		this.fileNum = fileNum;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
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
	
}
