<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>내가 쓴 게시물</title>
    <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
    <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <style type="text/css">
        td {
            vertical-align: middle;
        }

    </style>
</head>

<body>
    <jsp:include page="../common/mainBar.jsp"></jsp:include>
    <section id="portfolio" class="portfolio section-bg">
        <div class="container" data-aos="fade-up" data-aos-delay="100">
            <table align="center" id="tb" class="table table-hover">
                <thead>
                    <tr>
                        <th>카테고리</th>
                        <th>썸네일</th>
                        <th width="300">제목</th>
                        <th>내용</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="wBoard" items="${wList}" varStatus="i">
                        <tr>
                            <td align="center">
                                <c:choose>
                                    <c:when test="${wBoard.grpNum eq 1}">${wBoard.categoryName}</c:when>
                                    <c:when test="${wBoard.grpNum eq 2}">자유게시판</c:when>
                                    <c:when test="${wBoard.grpNum eq 3}">${wBoard.categoryName}</c:when>
                                </c:choose>
                            </td>
                            <td align="center">
                                <c:if test="${!empty wBoard.thumbNailFile}">
                                    <img alt="" src="${wBoard.thumbNailFile}">
                                </c:if>
                                <c:if test="${empty wBoard.thumbNailFile}">
                                    <img alt="" src="/resources/images/common/thumbnail.svg">
                                </c:if>
                            </td>
                            <td align="left">
                                <c:choose>
                                    <c:when test="${wBoard.grpNum eq 1}">${wBoard.title}</c:when>
                                    <c:when test="${wBoard.grpNum eq 2}">
                                        <c:url var="fdetail" value="fdetail.do">
                                            <c:param name="boardNo" value="${wBoard.boardNum}" />
                                        </c:url>
                                        <a href="${fdetail}">${wBoard.title}</a>
                                    </c:when>
                                    <c:when test="${wBoard.grpNum eq 3}">
                                        <c:url var="ndetail" value="ndetail.do">
                                            <c:param name="boardNo" value="${wBoard.boardNum}" />
                                        </c:url>
                                        <a href="${ndetail}">${wBoard.title}</a>
                                    </c:when>
                                </c:choose>
                            <td align="center">${wBoard.content}</td>
                            <td align="center">${wBoard.cdt}</td>
                        </tr>
                    </c:forEach>
                    <!-- 페이징 처리 -->
                </tbody>
            </table>
            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
                    <li class="page-item">
                        <!-- [이전] -->
                        <c:if test="${pi.currentPage <= 1 }">
                    <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1"><span aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span></a></li>
                    </c:if>
                    <c:if test="${pi. currentPage > 1 }">
                        <c:url var="before" value="myWriteList.do">
                            <c:param name="page" value="${pi.currentPage - 1 }" />
                        </c:url>
                        <a class="page-link" href="${before }" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
                        </a>
                    </c:if>
                    </li>
                    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
                        <c:if test="${p eq pi.currentPage }">
                            <li class="page-item active"><a class="page-link" href="${pagination }">${p }<span class="sr-only">(current)</span></a></li>
                        </c:if>
                        <c:if test="${p ne pi.currentPage }">
                            <c:url var="pagination" value="myWriteList.do">
                                <c:param name="page" value="${p }" />
                            </c:url>
                            <li class="page-item"><a class="page-link" href="${pagination }">${p }</a></li>
                        </c:if>
                    </c:forEach>
                    <li class="page-item">
                        <!-- [다음] -->
                        <c:if test="${pi.currentPage >= pi.maxPage }">
                    <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1"><span aria-hidden="true">&raquo;</span><span class="sr-only">Next</span></a></li>
                    </c:if>
                    <c:if test="${pi. currentPage < pi.maxPage }">
                        <c:url var="after" value="myWriteList.do">
                            <c:param name="page" value="${pi.currentPage + 1 }" />
                        </c:url>
                        <a class="page-link" href="${after }" aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
                        </a>
                    </c:if>
                    </li>
                </ul>
            </nav>
        </div>
    </section>
    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>

</html>
