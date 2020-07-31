package org.kh.fin.order.service;

import java.util.ArrayList;

import org.kh.fin.common.PageInfo;
import org.kh.fin.order.domain.Order;
import org.kh.fin.order.domain.OrderDetail;
import org.kh.fin.order.domain.OrderReview;
import org.kh.fin.order.domain.OrderReviewFile;
import org.kh.fin.order.domain.OrderValidate;

public interface OrderService {
	public String getOrderNum();
	public int insertOrderDetail(OrderDetail orderDetail);
	public int insertOrder(Order order);
	public int updateProductCnt(OrderDetail orderDetail);
	/**
	 * 전체 상품의 구매후기 조회
	 * @param pi
	 * @return ArrayList
	 */
	public ArrayList<OrderReview> selectAllOrderReview(PageInfo pi);

	
	/**
	 * 게시물 총 개수
	 * @return int
	 */
	public int getListCount();
	
	/**
	 * 상품번호에 따른 게시물 개수
	 * @return int
	 */
	public int getPnumList(int pNum);
	
	
	/**
	 * 상품번호에 따른 구매 후기 조회
	 * @param pi
	 * @return ArrayList
	 */
	public ArrayList<OrderReview> selectProductReview(PageInfo pi,int pNum);
	
	
	
	/**
	 * 리뷰 삭제
	 * @param review 
	 * @param OrderReview
	 * @return int
	 */
	public int deleteReview(OrderReview review);
	
	/**
	 * 리뷰 작성 전 구매여부 확인
	 * @param memberId
	 * @param pNum
	 * @return int
	 */
	public OrderDetail insertValidate(OrderValidate orderVali);
	
	
	/**
	 * 리뷰 작성 insert
	 * @param review 
	 * @return int
	 */
	public int insertReview(OrderReview review);
	
	
	/**
	 * 리뷰 첨부 파일
	 * @param orFile
	 * @return
	 */
	public int insertReviewFile(OrderReviewFile orFile);
	
	/**
	 * 리뷰 수정
	 * @param review
	 * @return
	 */
	public int updateReview(OrderReview review);
	
	/**
	 * 리뷰 첨부 파일 수정
	 * @param orFile
	 * @return
	 */
	public int updateReviewFile(OrderReviewFile orFile);

}
