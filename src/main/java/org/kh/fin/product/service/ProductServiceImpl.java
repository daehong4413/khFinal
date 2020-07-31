package org.kh.fin.product.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.kh.fin.product.domain.Product;
import org.kh.fin.product.domain.ProductSearch;
import org.kh.fin.product.store.ProductStoreLogic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


@Service("pService")
public class ProductServiceImpl implements ProductService {

	@Autowired ProductStoreLogic pStore;
	
	@Override
	public int insertProduct(Product product, MultipartFile uploadFile, HttpServletRequest request) {

		return pStore.insertProduct(product);
	}

	
	@Override
	public int productDelete(int productNum) {
		
		return pStore.selectDeleteOne(productNum);
	}

	@Override
	public Product productSelectOne(int productNum) {
		return pStore.selectOne(productNum);
	}

	@Override
	public int productModify(int productNum) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int productInsert(Product product) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public ArrayList<Product> productSelectList(String memberId) {
		return pStore.selectList(memberId);
	
	}


	@Override
	public int updateViewCnt(int pNum) {
		// TODO Auto-generated method stub
		return pStore.updateViewCnt(pNum);
	}


	@Override
	public int updateProduct(Product product, MultipartFile uploadFile, HttpServletRequest request) {
		// TODO Auto-generated method stub
		System.out.println("업데이트프로덕트"+product);
		
		return pStore.updateProduct(product);
	}


	@Override
	public ArrayList<Product> searchName(ProductSearch productsearch) {
		// TODO Auto-generated method stub
		System.out.println(productsearch.getProductName());
		return pStore.searchName(productsearch);
	}
}
