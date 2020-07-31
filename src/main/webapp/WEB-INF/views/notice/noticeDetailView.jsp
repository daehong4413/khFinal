<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 </title>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</head>
<body id="page-top">
 	<!-- 상단바-->
   <jsp:include page="../common/mainBar.jsp"/>

   <section class="page-section bg-light" id="portfolio">
	 <div class="container">
   
   <br style="clear:both">
   
   <h1 align="center">${notice.boardNo }번 상세 보기</h1>
   
   <br><br>
	
	
	<div class="select" width="200px">
					<select class="custom-select mr-sm-2" id="inlineFormCustomSelect" name="nCategory"
						style="width: 110px; height: 35px;" <c:if test="${loginInfo.memberId != notice.memberId}">disabled</c:if> >
						<c:forEach var="category" items="${cList}">
								<option value="${category.categoryNum}"
									<c:if test="${notice.categoryNum == category.categoryNum}">selected</c:if>>${category.categoryName}</option>
						</c:forEach>
					</select>
				</div>
		<div class="select" width="200px">
					<select class="custom-select mr-sm-2" id="inlineFormCustomSelect" name="prgress"
						style="width: 110px; height: 35px;" <c:if test="${loginInfo.memberId != 'admin'}">disabled</c:if> >
						<option value="1" <c:if test="${notice.prgress == 1 }">selected</c:if>>진행상황</option>
						<option value="2" <c:if test="${notice.prgress == 2 }">selected</c:if>>처리중</option>
						<option value="3" <c:if test="${notice.prgress == 3 }">selected</c:if>>완료</option>

					</select>
				</div>
				
   <br><br>
   <table align="center" width="450" border="1" cellspacing="0" class="table table-bordered">
   <tr >
      <td width="80">번호</td>
      <td>${notice.boardNo }</td>
   </tr>
   <tr >
      <td>제목</td>
      <td>${notice.title }</td>
   </tr>
   <tr >
      <td>작성자</td>
      <td>${notice.memberId }</td>
   </tr>
   <tr >
      <td>작성날짜</td>
      <td>${notice.cdt }</td>
   </tr>
   <tr height="300">
      <td>내용</td>
      <td>${notice.content }</td>
   </tr>
   
   					
   <c:if test="${loginInfo.memberId eq notice.memberId or loginInfo.memberId == 'admin'}">
   <tr>
      <td colspan="2" align="center">
      <c:url var="nupdate" value="nupView.do">
      	<c:param name="boardNo" value="${notice.boardNo}"/>
      	<!-- 쿼리스트링을 보내주어야 컨트롤러의 메소드의 매개변수 파라미터가 받아서 처리가능 -->
      </c:url>
	      <c:url var="ndelete" value="ndelete.do">
	      	<c:param name="boardNo" value="${notice.boardNo }"/>
	      </c:url>
      <a href="${nupdate}">수정페이지로 이동</a>&nbsp; &nbsp;
      <a href="${ndelete }">삭제하기</a>
      </td>
   </tr>
   </c:if>
</table>

   

   
   <p align="center">
      <c:url var="home" value="/" />
      <a href="${home}">시작페이지로 이동</a>&nbsp;
      <c:url var="nlist" value="nlist.do" />
      <a href="${nlist}">목록 전체보기</a>
   </p>
   <br><br><br><br><br><br><br><br><br><br>
   </div>
    </section>
</body>
</html>