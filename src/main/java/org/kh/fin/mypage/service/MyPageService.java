package org.kh.fin.mypage.service;

import java.util.ArrayList;

import org.kh.fin.common.PageInfo;
import org.kh.fin.member.domain.Member;
import org.kh.fin.mypage.domain.Favorite;
import org.kh.fin.mypage.domain.OrderInfo;
import org.kh.fin.mypage.domain.WriteBoard;
import org.kh.fin.order.domain.Order;
import org.kh.fin.order.domain.OrderProduct;
import org.kh.fin.order.domain.Status;
import org.kh.fin.product.domain.Product;
import org.kh.fin.product.domain.ProductInCart;

public interface MyPageService {
	public int getListCount(String memberId, String type);
	public ArrayList<WriteBoard> selectWriteList(String memberId, PageInfo pi);
	public ArrayList<OrderInfo> selectOrderList(String memberId, PageInfo pi);
	public ArrayList<Product> selectFavoriteList(String memberId, PageInfo pi);
	public ArrayList<Integer> insertFavorite(Favorite favorite);
	public ArrayList<Integer> deleteFavorite(Favorite favorite);
	public ProductInCart selectOneProduct(int productNum);
	public int getdcRate(String memberId);
	public int memberIdModify(Member mem);
	public int phoneModify(Member mem);
	public int addressModify(Member mem);
	public int passwordModify(Member mem);
	public int deleteMember(String memberId);
	public Order selectOrderOne(String orderNum);
	public ArrayList<Status> selectStatus();
	public ArrayList<OrderProduct> selectProductInfo(String orderNum);
	public int fixOrder(String orderNum);
	public int cancelOrder(String orderNum);
}
