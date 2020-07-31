package org.kh.fin.product.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.kh.fin.product.domain.Product;
import org.kh.fin.product.domain.ProductSearch;
import org.springframework.web.multipart.MultipartFile;

public interface ProductService {
	
	public int productInsert(Product product);
	
	public int productDelete(int productNum);
	
	public Product productSelectOne(int productNum);
	
	public int productModify(int productNum);

	public int insertProduct(Product product, MultipartFile uploadFile, HttpServletRequest request);

	public ArrayList<Product> productSelectList(String memberId);

	public int updateViewCnt(int pNum);

	public int updateProduct(Product product, MultipartFile uploadFile, HttpServletRequest request);
//이거 새로했음
	public ArrayList<Product> searchName(ProductSearch productsearch);
}
