package org.kh.fin.mypage.store;


import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
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
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class MyPageStore {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount(String memberId, String type) {
		int result;
		if(type.equals("write")) {
			result = sqlSession.selectOne("mypageMapper.writeCount", memberId);
		}else if(type.equals("order")){
			result = sqlSession.selectOne("mypageMapper.orderCount", memberId);
		}else if(type.equals("favorite")) {
			result = sqlSession.selectOne("mypageMapper.favoriteCount", memberId);
		}else {
			result = 0;
		}
		return result;
	}
	
	public ArrayList<WriteBoard> selectWriteList(String memberId, PageInfo pi){
 	 	int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		// mybatis의 RowBounds 클래스 사용
		// off : 10, boardLimit : 10
		// 10건의 0건만큼 건너뛰고 결과값을 가져옴
		// 15건의 5건만큼 건너뛰고 결과값을 가져옴
		// 20건의 10건만큼 건너뛰고 결과값을 가져옴
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mypageMapper.selectWriteList", memberId, rowBounds);
	}
	
	public ArrayList<OrderInfo> selectOrderList(String memberId, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		// mybatis의 RowBounds 클래스 사용
		// off : 10, boardLimit : 10
		// 10건의 0건만큼 건너뛰고 결과값을 가져옴
		// 15건의 5건만큼 건너뛰고 결과값을 가져옴
		// 20건의 10건만큼 건너뛰고 결과값을 가져옴
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mypageMapper.selectOrderList", memberId, rowBounds);
	}
	
	public ArrayList<Product> selectFavoriteList(String memberId, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		// mybatis의 RowBounds 클래스 사용
		// off : 10, boardLimit : 10
		// 10건의 0건만큼 건너뛰고 결과값을 가져옴
		// 15건의 5건만큼 건너뛰고 결과값을 가져옴
		// 20건의 10건만큼 건너뛰고 결과값을 가져옴
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mypageMapper.selectFavoriteList", memberId, rowBounds);
	}

	public ArrayList<Integer> insertFavorite(Favorite favorite) {
		// TODO Auto-generated method stub
		ArrayList<Integer> list = new ArrayList<Integer>();
		int result = 0;
		int cnt = 0;
		result = sqlSession.insert("mypageMapper.insertFavorite", favorite);
		cnt = sqlSession.selectOne("mypageMapper.getFavoriteCnt", favorite);
		list.add(result);
		list.add(cnt);
		return list;
	}

	public ArrayList<Integer> deleteFavorite(Favorite favorite) {
		// TODO Auto-generated method stub
		ArrayList<Integer> list = new ArrayList<Integer>();
		int result = 0;
		int cnt = 0;
		result = sqlSession.delete("mypageMapper.deleteFavorite", favorite);
		cnt = sqlSession.selectOne("mypageMapper.getFavoriteCnt", favorite);
		list.add(result);
		list.add(cnt);
		return list;
	}

	public ProductInCart selectOneProduct(int productNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mypageMapper.selectProduct", productNum);
	}

	public int getdcRate(String memberId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mypageMapper.getdcRate", memberId);
	}
	public int memberIdModify(Member mem) {
		return sqlSession.update("memberMapper.updateId",mem);
	}
	public int phoneModify(Member mem) {
		return sqlSession.update("memberMapper.updatePhone",mem);
	}
	public int addressModify(Member mem) {
		return sqlSession.update("memberMapper.updateAddress",mem);
	}
	public int passwordModify(Member mem) {
		return sqlSession.update("memberMapper.updatePassword",mem);
	}
	public int deleteMember(String memberId) {
		return sqlSession.update("memberMapper.updateDelete",memberId);
	}

	public Order selectOrderOne(String orderNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mypageMapper.selectOrderOne", orderNum);
	}

	public ArrayList<Status> selectStatus() {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mypageMapper.selectStatus");
	}

	public ArrayList<OrderProduct> selectProductInfo(String orderNum) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("mypageMapper.selectProductInfo", orderNum);
	}
	
	public int fixOrder(String orderNum) {
		return sqlSession.update("mypageMapper.fixOrder", orderNum);
	}
	public int cancelOrder(String orderNum) {
		return sqlSession.update("mypageMapper.cancelOrder", orderNum);
	}
}
