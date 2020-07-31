package org.kh.fin.order.service;

import java.util.ArrayList;

import org.kh.fin.common.PageInfo;
import org.kh.fin.order.domain.Order;
import org.kh.fin.order.domain.OrderDetail;
import org.kh.fin.order.domain.OrderReview;
import org.kh.fin.order.domain.OrderReviewFile;
import org.kh.fin.order.domain.OrderValidate;
import org.kh.fin.order.store.OrderStoreLogic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderStoreLogic oStore;

	@Override
	public String getOrderNum() {
		// TODO Auto-generated method stub
		return oStore.getOrderNum();
	}

	@Override
	public int insertOrderDetail(OrderDetail orderDetail) {
		return oStore.insertOrderDetail(orderDetail);
	}

	@Override
	public int insertOrder(Order order) {
		return oStore.insertOrder(order);
	}

	@Override
	public int updateProductCnt(OrderDetail orderDetail) {
		return oStore.updateProductCnt(orderDetail);
	}

	// 상품 코드에 따른 게시물 개수
	@Override
	public int getPnumList(int pNum) {
		int count = oStore.getPnumList(pNum);
		return count;
	}

	// 리뷰 삭제
	@Override
	public int deleteReview(OrderReview review) {
		int result = oStore.deleteReview(review);
		return result;
	}

	// 구매여부 확인
	@Override
	public OrderDetail insertValidate(OrderValidate vali) {
		// TODO Auto-generated method stub
		return oStore.insertValidate(vali);
	}

	// 리뷰 작성
	@Override
	public int insertReview(OrderReview review) {
		// TODO Auto-generated method stub
		return oStore.insertReview(review);
	}

	// 리뷰 첨부파일
	@Override
	public int insertReviewFile(OrderReviewFile orFile) {
		// TODO Auto-generated method stub
		return oStore.insertReviewFile(orFile);
	}

	// 리뷰 수정
	@Override
	public int updateReview(OrderReview review) {
		// TODO Auto-generated method stub
		return oStore.updateReview(review);
	}

	@Override
	public int updateReviewFile(OrderReviewFile orFile) {
		// TODO Auto-generated method stub
		return oStore.updateReviewFile(orFile);
	}

	@Override
	public ArrayList<OrderReview> selectAllOrderReview(PageInfo pi) {
		ArrayList<OrderReview> list = oStore.selectAllOrderReview(pi);
		return list;
	}

	@Override
	public int getListCount() {
		int count = oStore.getListCount();
		return count;
	}
	@Override
	public ArrayList<OrderReview> selectProductReview(PageInfo pi, int pNum) {
		// TODO Auto-generated method stub
		ArrayList<OrderReview> list = oStore.selectProductReview(pi, pNum);
		return list;
	}
}
