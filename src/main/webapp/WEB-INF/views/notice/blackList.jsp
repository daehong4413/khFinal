<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>템플릿</title>
     <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
    <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

    <style>
        .pagination {
            text-align: center;
            width: 300px;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>

<body id="page-top">
    <!-- 상단바-->
   <jsp:include page="../common/mainBar.jsp"/>
    <br><br>
    <!-- 메인 콘텐츠-->
    <section class="page-section bg-light" id="portfolio">
        <div class="container">
            <!--메인 콘텐츠 위치-->
            <div class="row">
                <!--제목 위치-->
                <div class="col-11">
                    <span class="h2">블랙리스트</span>
                </div>
            </div>
            <hr>
            <br>
            <!--콘텐츠 페이지 내용 위치-->
            <div>
               
                <table class="table table-bordered">
                        <tr>
                            <th scope="col">회원아이디</th>
                            <th scope="col">등록여부</th>
                            <th scope="col">등록일</th>
                            <th scope="col">블랙리스트</th>
                        </tr>
                    <c:forEach var="list" items="${list }">
                        <tr>
                            <th>${list.memberId }</th>
                            <td>${list.status }</td>
                            <td>${list.mdt}</td>
                            <td>
                            <button type="button" class="btn btn-primary" onclick="location.href='black.do?memberId=${list.memberId}'">등록</button>
                            <button type="button" class="btn btn-primary" onclick="location.href='out.do?memberId=${list.memberId }'">해제</button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <!-- 페이징 처리 -->
                  <nav aria-label="Page navigation example">
                      <ul class="pagination justify-content-center">
                         <li class="page-item">
                           <!-- [이전] -->
                           <c:if test="${pi.currentPage <= 1 }">
                                    <li class="page-item disabled">
                              <a class="page-link" href="#" tabindex="-1"><span aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span></a>
                            </li>
                              </c:if>
                              <c:if test="${pi. currentPage > 1 }">
                           <c:url var="before" value="mlistView.do">
                              <c:param name="page" value="${pi.currentPage - 1 }" />
                           </c:url>
                           <a class="page-link" href="${before }" aria-label="Previous">
                               <span aria-hidden="true">&laquo;</span>
                             <span class="sr-only">Previous</span>
                              </a>
                              </c:if> 
                            </li>
                  <c:forEach var="p"   begin="${pi.startPage }" end="${pi.endPage }">
                        <c:if test="${p eq pi.currentPage }">
                           <li class="page-item active"><a class="page-link" href="${pagination }">${p }<span class="sr-only">(current)</span></a></li>
                        </c:if>
                        <c:if test="${p ne pi.currentPage }">
                           <c:url var="pagination" value="mlistView.do">
                              <c:param name="page" value="${p }" />
                           </c:url>                     
                            <li class="page-item"><a class="page-link" href="${pagination }">${p }</a></li>
                              </c:if>
                  </c:forEach>
                         <li class="page-item">
                         <!-- [다음] -->
                         <c:if test="${pi.currentPage >= pi.maxPage }">
                                 <li class="page-item disabled">
                           <a class="page-link" href="#" tabindex="-1"><span aria-hidden="true">&raquo;</span><span class="sr-only">Next</span></a>
                         </li>
                              </c:if>
                              <c:if test="${pi. currentPage < pi.maxPage }">
                           <c:url var="after" value="mlistView.do">
                              <c:param name="page" value="${pi.currentPage + 1 }" />
                           </c:url>
                           <a class="page-link" href="${after }" aria-label="Next">
                             <span aria-hidden="true">&raquo;</span>
                             <span class="sr-only">Next</span>
                              </a>
                              </c:if>
                         </li>
                       </ul>
                  </nav>
				<%-- <tr align="center" height="20">
			<td colspan="6">
				<!-- [이전] -->
		<c:if test="${pi.currentPage <= 1 }">
			[이전] &nbsp;
		</c:if>
		<c:if test="${pi.currentPage > 1 }">
			<c:url var="before" value="mlist.do">
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
				<c:url var="pagination" value="mlist.do">
					<c:param name="page" value="${p }" />
				</c:url>
				<a href="${pagination }">${p }</a> &nbsp;
			</c:if>
		</c:forEach>
	<!-- [다음] -->
<c:if test="${pi.currentPage >= pi.maxPage }">
	[다음] &nbsp;
</c:if>
<c:if test="${pi.currentPage < pi.maxPage }">
	<c:url var="after" value="mlist.do">
		<c:param name="page" value="${pi.currentPage + 1 }" />
		<!-- pi.currentPage + 1 가지고와서 url로 after로 지정해서 밑에서 끌어다
		쓰겠다 -->
	</c:url>
	<a href="${after }">[다음]</a> &nbsp;
	<!-- mlist.kh?page=${pi.currentPage + 1 } -->
</c:if>
			
			</td>
		</tr> --%>
		<!-- 검색 -->
		 <div id="searchArea" align="center">
   			<form action="msearch.do" name="searchForm" method="get">
     			 <select id="searchCondition" name="searchCondition">
         			<option value="all" <c:if test="${search.searchCondition == 'all' }">selected</c:if>>전체</option>
         			<option value="memberId" <c:if test="${search.searchCondition == 'memberId' }">selected</c:if>>작성자</option>
         			<option value="status" <c:if test="${search.searchCondition == 'status' }">selected</c:if>>상태</option>
      			</select>
      		<input type="search" name="searchValue" value="${search.searchValue }">
      		<button>검색</button><br>
  			 </form>
			</div>

            </div>
            <br>
        </div>
    </section>
     <jsp:include page="../common/footer.jsp"/>
</body></html>