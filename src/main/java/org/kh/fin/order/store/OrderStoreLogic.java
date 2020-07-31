package org.kh.fin.order.store;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.kh.fin.common.PageInfo;
import org.kh.fin.order.domain.Order;
import org.kh.fin.order.domain.OrderDetail;
import org.kh.fin.order.domain.OrderReview;
import org.kh.fin.order.domain.OrderReviewFile;
import org.kh.fin.order.domain.OrderValidate;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("oStore")
public class OrderStoreLogic {

	@Autowired
	SqlSessionTemplate sqlSession;

	public int insertOrderDetail(OrderDetail orderDetail) {
		return sqlSession.insert("orderMapper.insertOrderDetail", orderDetail);
	}

	public int insertOrder(Order order) {
		return sqlSession.insert("orderMapper.insertOrder", order);
	}

	public String getOrderNum() {
		return sqlSession.selectOne("orderMapper.getOrderNum");
	}

	public int updateProductCnt(OrderDetail orderDetail) {
		return sqlSession.update("orderMapper.updateProductCnt", orderDetail);
	}

	public ArrayList<OrderReview> selectAllOrderReview(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		// mybatis의 RowBounds 클래스 사용
		// off : 얼마나 건너뛸 것인가, 증가값
		// limit : 고정된 값, 내가 가져오고 싶은 갯수
		// off : 5, limit : 10
		// 5 + 10 건을 가져온 후에 5건을 건너띄고 10개를 가져옴
		// 10 + 10 건을 가져온 후에 10건을 건너띄고 10개를 가져옴
		// 단점 : 데이터가 많아지면 느려질 수 있음.
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("orderMapper.selectOrderReviewAll", null, rowBounds);
	}

	public int getListCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("orderMapper.selectReviewCount");
	}

	public ArrayList<OrderReview> selectProductReview(PageInfo pi, int pNum) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList) sqlSession.selectList("orderMapper.selectProductReview", pNum, rowBounds);
	}

	public int getPnumList(int pNum) {

		return sqlSession.selectOne("orderMapper.selectPnumCount", pNum);
	}

	public int deleteReview(OrderReview review) {
		// TODO Auto-generated method stub
		return sqlSession.delete("orderMapper.deleteReview", review);
	}

	public OrderDetail insertValidate(OrderValidate vali) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("orderMapper.insertValidate", vali);
	}

	public int insertReview(OrderReview review) {
		// TODO Auto-generated method stub
		return sqlSession.insert("orderMapper.insertReview", review);
	}

	public int insertReviewFile(OrderReviewFile orFile) {
		// TODO Auto-generated method stub
		return sqlSession.insert("orderMapper.insertReviewFile", orFile);
	}

	public int updateReview(OrderReview review) {
		// TODO Auto-generated method stub
		return sqlSession.update("orderMapper.updateReview", review);
	}

	public int updateReviewFile(OrderReviewFile orFile) {
		// TODO Auto-generated method stub
		return sqlSession.update("orderMapper.updateReviewFile", orFile);
	}
}
