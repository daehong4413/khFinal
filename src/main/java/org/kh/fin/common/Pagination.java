package org.kh.fin.common;

public class Pagination {

	// PageInfo 객체를 리턴해주는 static 메소드 추가
	// PageInfo라는 클래스는 페이징 처리에 필요한 데이터를 
	// 담는 클래스, 클래스가 계속 생성이 되면 정보들이 초기화 되기 때문에
	// 한번만 생성하여 정보를 저장할 수 있도록 해야함 ex) db connection
	public static PageInfo getPageInfo(int currentPage, int listCount, int pageLimit, int boardLimit ) {
		//페이지 정보를 담아줄 PageInfo 참조변수 선언
		PageInfo pi = null;
		
		// currentPage와 listCount가 넘어온 상태이기 때문에
		// 페이징 처리에 필욯란 나머지 변수만 선언
		//int pageLimit = 10; // 한 페이지에서 보여질 페이징 수
		int maxPage; 		// 전체 페이징 수 중 가장 마지막 페이지
		int startPage;		// 현재 페이지에서 보여질 페이징 버튼의 시작 페이지
		int endPage;		// 현제 페이지에서 보여질 페이징 버튼의 끝 페이지
		
		//int boardLimit = 5; // 한 페이지에 보여질 게시글 갯수
		
		// *maxPage - 총 페이지수
		// 목록수가 123개이면 페이지 수는 13페이지
		// 한페이지 당 10개씩 보여줄 경우
		// ===> 페이지수는 13페이지
		// 짜투리 목록이 최소 1개일 때, 1page로 처리하기 위해 0.9를 더함
		maxPage= (int)((double)listCount / boardLimit + 0.9);
		// 15/3 + 0.9면 총 페이징 3개 3.9이기때문 9는int이기 때문에 cut
		
		// *startPage = 현재 페이지에 보여질 시작 페이지 수
		// 1, 11, 21, 31
		startPage = (((int)((double)currentPage / pageLimit +0.9)) -1) * pageLimit + 1;
		
		
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		// 123개의 게시물이 있음, 10개씩 보여준다고 했을 경우, 페이지 수 13
		// 이전 1 2 3 4 5 6 7 8 9 10 다음
		
		pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		
		return pi; // 나중에 수정 필요

	}
}

