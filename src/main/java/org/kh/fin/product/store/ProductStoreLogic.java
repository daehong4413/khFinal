package org.kh.fin.product.store;


import java.util.ArrayList;

import org.kh.fin.product.domain.Product;
import org.kh.fin.product.domain.ProductSearch;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository("pStore")
public class ProductStoreLogic {

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	public int insertProduct(Product product) {
		return sqlSession.insert("productMapper.insertProduct", product);
	}


	public ArrayList<Product> selectList(String memberId) {
		return (ArrayList)sqlSession.selectList("productMapper.selectList", memberId);
	}



	public Product selectOne(int productNum) {
		return sqlSession.selectOne("productMapper.selectOne",productNum);
	}


	public int selectDeleteOne(int productNum) {
		// TODO Auto-generated method stub
		System.out.println(productNum);
		return sqlSession.update("productMapper.selectDeleteOne",productNum);
	}


	public int updateViewCnt(int pNum) {
		// TODO Auto-generated method stub
		return sqlSession.update("productMapper.selectUpdate",pNum);
	}


	public int updateProduct(Product product) {
		// TODO Auto-generated method stub
		System.out.println("스토어로직"+product);
		return sqlSession.update("productMapper.insertUpdate",product);
	}


	public ArrayList<Product> searchName(ProductSearch productsearch) {
		// TODO Auto-generated method stub
		 System.out.println("스토어"+productsearch.getProductName());
		return (ArrayList)sqlSession.selectList("productMapper.searchProduct", productsearch);
	}
}
