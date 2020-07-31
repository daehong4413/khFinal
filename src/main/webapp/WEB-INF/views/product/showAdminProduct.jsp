<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<br style="clear:both">
	
	<h1 align="center">등록한 상품목록</h1>
	
	<br><br>
	<br style="clear:both">
	<table align="center" width="600" border="1" cellspacing="0" style="clear:right;" id="tb">
	<tr bgcolor="yellowgreen">
		<th>등록번호</th>
		<th>상품이름</th>
		<th>카테고리</th>
		<th>가격</th>
		
	</tr>

	<c:forEach var="p" items="${list }">
		<tr>
			</td>
			<c:url var="dProductURL" value="deleteProduct.do">
				<c:param name="pId" value="${p.productNum }" />			
			</c:url>
			<td align="center">	<a href=<c:out value="${dProductURL }"/>>${p.productNum }</a></td>
		
			<td align="center">${p.productName }</td>
			<td align="center">${p.categoryNum }</td>
			<td align="center">${p.productPrice }</td>
			<td align="center">
				<c:if test="${!empty p.productMainPath }">
					ⓞ
				</c:if>
				<c:if test="${ empty p.productMainPath }">
					&nbsp;
				</c:if>
			</td>
		</tr>
		
	</c:forEach> 
</table>



	<!-- 게시물 검색하기 -->

	<div id ="searchArea" align="center">
		<form action ="nsearch.kh" name ="searchForm" method="get">
			<select id="searchCondition" name= "searchCondition">
				<option value="all" <c:if test="${search.searchCondition == 'all' }">selected</c:if>
				>전체</option>
					</select>
			<input type="search" name="searchValue" value="">
			<button>검색</button><br>
			
		
		</form>
	
	
	</div> 

	
	<p align="center">
		<c:url var="home" value="home.kh"/>
		<a href="${home }">시작페이지로 이동</a>&nbsp;

		<c:url var="nlist" value="nlist.kh"/>
		<a href="${nlist }">목록 전체보기</a>
	</p>

</body>
</html>