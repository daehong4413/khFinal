package org.kh.fin.product.domain;

public class ProductFile {
private int fileNum;
private String fileName;
private String filePath;
private int productNum;


public ProductFile(int fileNum, String fileName, String filePath, int productNum) {
	super();
	this.fileNum = fileNum;
	this.fileName = fileName;
	this.filePath = filePath;
	this.productNum = productNum;
}

@Override
public String toString() {
	return "ProductFile [fileNum=" + fileNum + ", fileName=" + fileName + ", filePath=" + filePath + ", productNum="
			+ productNum + "]";
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



}
