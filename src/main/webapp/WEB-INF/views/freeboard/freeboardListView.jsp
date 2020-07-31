<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<style>
   body{font-family:lato,sans-serif}
.container{max-width:1000px;margin-left:auto;margin-right:auto;padding-left:10px;padding-right:10px}
h2{font-size:26px;margin:20px 0;text-align:center}
small{font-size:.5em}
li{border-radius:3px;padding:25px 30px;display:flex;justify-content:space-between;margin-bottom:25px}
.table-header{background-color:#95A5A6;font-size:20px;text-transform:uppercase;letter-spacing:.03em}
.table-row{background-color:#fff;box-shadow:0 0 9px 0 rgba(0,0,0,.1);font-size:15px;}
.col-1{flex-basis:10%}
.col-2{flex-basis:40%}
.col-3,.col-4{flex-basis:25%}
@media all and (max-width:767px){
.table-header{display:none}
li{display:block}
.col{flex-basis:100%;display:flex;padding:10px 0}
.col:before{color:#6C7A89;padding-right:10px;content:attr(data-label);flex-basis:50%;text-align:right}
}

</style>
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script type="text/javascript" 
src="http://code.jquery.com/jquery-3.4.1.min.js"></script> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오더리뷰</title>
</head>
<body>
<c:import url="../common/mainBar.jsp" />
<jsp:include page="/WEB-INF/common/mainBar.jsp"></jsp:include>
   <div class="container">
      <h2>자유게시판 <small>어부바</small></h2>	
      <ul class="responsive-table">
        <li class="table-header">
          <div class="col col-2"><b>번호</b></div>
          <div class="col col-4"><b>제목</b></div>
          <div class="col col-2"><b>작성자</b></div>
          <div class="col col-2"><b>작성일</b></div>  
        </li>
        <c:forEach  items="${list }" var="item" varStatus="stat">
        
        <li class="table-row"onclick="showContent(${stat.index})"style="cursor:pointer;" >
          <div class="col col-2" ><b id="boardNo${stat.index}">${item.boardNo }</b></div>
          <div class="col col-4" ><b>${item.title }</b></div>
          <div class="col col-2" ><b>${item.memberId }</b></div>
          <div class="col col-2" ><b>${item.cdt }</b></div>
        </li>
        <li class="table-row" id="content${stat.index }"style="display:none;background-color:#F5FFFA">
           <div class="col col-12" >
           <!-- 자유게시판 상세보기 -->                      
							<table align="center" id="tb" cellpadding="10" cellspacing="0"
								border="1" width="700">

								<tr height="300">
									<td>${item.bContent }</td>
								</tr>


								<c:if test="${loginInfo.memberId eq item.memberId }">
			<tr>
			<c:url var="fupdate" value="fupdateView.do">
			<c:param name="boardNo" value="${item.boardNo }"/>
			<!-- 쿼리스트링을 보내주어야 컨트롤러의 메소드의 매개변수(파라미터)
			가 받아서 처리가능 -->
			</c:url>
			<c:url var ="fdelete" value="fdelete.do">
			<c:param name="boardNo" value="${item.boardNo }"/>
			</c:url>
				<td colspan="2" align="center"><a href="${fupdate }">수정하기</a>&nbsp;
					&nbsp; <a href="${fdelete }">삭제하기</a></td>
			</tr>
		</c:if>	

								<tr>
									<td colspan="2" align="center"><c:url var="flist"
											value="flist.do">
											<c:param name="page" value="${currentPage }" />
										</c:url> <c:if test="${loginInfo.memberId eq freeboard.memberId }">
										
										</c:if>
										<a href="fupdateView.do">수정하기</a> &nbsp; <a href="fdelete.do">삭제하기</a> &nbsp;</td>
								</tr>
							</table>


							<!-- 댓글 등록  -->
							<table align="center" width="700" border="1" cellspacing="0">
								<tr>
									<td><textarea cols="55" rows="3" id="cContent"></textarea></td>
									<td>
										<button id="cSubmit${stat.index }" name="${item.boardNo}">등록하기</button>
									</td>
								</tr>
							</table>


							<!-- 댓글 목록  -->
							<table id="ctb" align="center" width="700" border="1"
								cellspacing="0">
								<thead>
									<tr>
										<td colspan="2"><b>댓글</b></td>
									</tr>
								</thead>
								<tbody></tbody>
							</table></div>
        </li>
         </c:forEach> 
      </ul>
    </div>
<script>
	  //자유게시판 게시글 펼치기  
      function showContent(num){		 
    	     if(${empty loginInfo }){
    		alert  ("로그인 해 주세요");
    	  }else if(${!empty loginInfo }){        
         if($("#content"+num).css("display")=="none"){
         $("#content"+num).css("display","block");
         getReplyList();
      // 댓글 리스트 불러오는 ajax 함수
 		function getReplyList() {
 			//var boardNo = $("#content"+num);
    	  //var boardNo = $("#content"+num >"#boardNo");
    	  var boardNo =$("#boardNo"+num).text();
 		console.log(boardNo);
 			$.ajax({
 				
 						url : "clist.do",
 						data : {boardNo : boardNo},
 						type : "post",
 						dataType : "json",
 						success : function(data) { // 응답이 오는 데이터는 JSON형태
 			 				//console.log(data);
 							$tableBody = $("#ctb tbody");
 							$tableBody.html("");

 							var $div;
 							var $rWriter;
 							var $cContent;
 							var $rTable;
 							var $rCreateDate;
 							var $result;
 							

 							
 							if (data.length > 0) {
 								for ( var i in data) {
 									//console.log(data)
 									//console.log(${'data[i].commentNum'});
 									//console.log('${loginInfo.memberId}');
 									$tr=$("<tr>");
 									//$li = $("<li>"); 
 									//$table = $("<table align='center' width='500' border='1' cellspacing='0' id='p' style='display:none'>");
 									$div = $("<div>");// 자동으로 닫힘
 									$rWriter = $("<div style='float:left'>").text(data[i].memberId);
 									$rCreateDate = $("<div>").html('&nbsp&nbsp&nbsp'+ data[i].cdt);
 											//+ "<div style='cursor:pointer;color:blue;float:right'>삭제&nbsp;</div> <div style='cursor:pointer;color:blue;float:right'>수정&nbsp;</div><div style='cursor:pointer;color:blue;float:right' onclick='showComment'>댓글&nbsp;</div>");
 									$y = $("<tr style='float:right'>").html("<td align='right'><button onclick='cDelete("+data[i].commentNum+")' >삭제</button></td><td align='right'><a href='${cupdate }'>수정</a></td><td align='right'><a href='#'>댓글</a></td>");
 									$n = $("<tr style='float:right'>").html("<td align='right'><a href='#'>댓글</a></td>");
 									//console.log(data[i].memberId);
 									//console.log('${loginInfo.memberId}' == data[i].memberId);
 													
 									$cContent = $("<div class='contents'>").text(decodeURIComponent(data[i].cContent.replace(/\+/g, " ")));
 									//$rTable = $("<tr>").html("<td><textarea cols='55' rows='1' id='cContent'></textarea></td><td><button id='rSubmit'>등록하기</button></td>");
 									$rTable = $("<div style='display:none'>").html("<textarea cols='55' rows='1' id='cContent'></textarea><button id='rSubmit'>등록하기</button>");
 									
 								
 									
 									$div.append($rWriter);
 									$div.append($rCreateDate);
 									//$div.append($result);
 									 if('${loginInfo.memberId}' == data[i].memberId){
 										$div.append($y);
 										}else {
 											$div.append($n);
 										} 								
 									$div.append($cContent);
 									$div.append($rTable);
 									//$table.append($rTable);
 									$tableBody.append($div);
 								}
 							} else {
 								$div = $("<div>");
 								$cContent = $("<div>").text(
 										"등록된 댓글이 없습니다.");

 								$div.append($cContent);
 								$tableBody.append($div);
 							}
 						
 						}
 					});
 		}	
 		// 댓글 등록 ajax
 	 	$("button[id^='cSubmit']").on("click", function () {
 			//console.log();
 			
			var cContent = $("#cContent").val(); // 댓글의 내용
			var boardNo = $("#boardNo"+num).text(); // 어느 게시글의 댓글인지 알려줌
		
			//console.log(boardNo);//여기 눌렀던 만큼 찍힘
			$.ajax({
				url : "cinsert.do",
				data : {cContent:cContent, boardNo:boardNo},
				type : "post",
				success : function(data) { // data를 String으로 받아옴, 이전에는 json
					if(data == "success") { 
						getReplyList();
						$("#cContent").val("");
					}
				}
				
			}); 
		}); 
 	 
         }
    	 
         else if($("#content"+num).css("display")=="block"){
            $("#content"+num).css("display","none");
               }
         }
         
	  }
	  
      //댓글 삭제 ajax
		 function cDelete(num1) {
			//console.log(num);
			//var commentNum = ;
			//var boardNo = $("#boardNo"+num).text(); // 어느 게시글의 댓글인지 알려줌
			$.ajax({
				url : "cdelete.do",
				data : {commentNum:num1},
				type : "get",
				success : function(data) { // data를 String으로 받아옴, 이전에는 json
					if(data == "success") {
						location.reload(true);
						location.redirect;
						
						
					}
				}
				
			});
		}      
    
   </script>
   
   
<!-- 검색쿼리 --> 
<div id="searchArea" align="center">
<!-- 글쓰기 버튼  -->
			<c:if test="${loginInfo.status != null }">
			<button onclick="location.href='fWriteView.do'">글쓰기</button>
			</c:if>
		<form action="fsearch.do" name="searchForm" method="get">
			<select id="searchCondition" name="searchCondition">
				<option value="all"
					<c:if test="${search.searchCondition=='all'}">selected</c:if>>전체</option>
				<option value="writer"
					<c:if test="${search.searchCondition=='writer'}">selected</c:if>>작성자</option>
				<option value="title"
					<c:if test="${search.searchCondition=='title'}">selected</c:if>>제목+내용</option>
			</select> <input type="search" name="searchValue"
				value="${search.searchValue }">
			<button>검색</button>
		</form>
	</div>
   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   <!-- 페이징 처리 -->
   <center>
   <table>
      <tr align="center" height="20">
         <td colspan="6">
            <!-- [이전] -->
<c:if test="${pi.currentPage <= 1 }">
   [이전] &nbsp;
</c:if>
<c:if test="${pi. currentPage > 1 }">
   <c:url var="before" value="flist.do">
      <c:param name="page" value="${pi.currentPage - 1 }" />
   </c:url>
   <a href="${before }">[이전]</a> &nbsp;
</c:if>
            
                  <!-- 페이지 -->
<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
   <c:if test="${p eq pi.currentPage }">
      <font color="red" size="4"><b>[${p }]</b></font>
   </c:if>
   <c:if test="${p ne pi.currentPage }">
      <c:url var="pagination" value="flist.do">
         <c:param name="page" value= "${p }" />
      </c:url>
      <a href="${pagination }">${p }</a> &nbsp;
   </c:if>
</c:forEach>      
            
            
            <!-- [다음] -->
<c:if test="${pi.currentPage >= pi.maxPage }">
   [다음] &nbsp;
</c:if>
<c:if test="${pi.currentPage < pi.maxPage }">
   <c:url var="after" value="flist.do">
      <c:param name="page" value="${pi.currentPage + 1 }" />
   </c:url>
   <a href="${after }">[다음]</a> &nbsp;
</c:if>

            
         </td>
      </tr>
   </table>
   </center>
<br style="clear: both">
	<br>
	<br>
	
	<br style="clear: both">
</body>
</html> --%>