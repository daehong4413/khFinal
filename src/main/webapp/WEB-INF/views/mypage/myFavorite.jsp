<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관심상품</title>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>
<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
<link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
<link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="assets/vendor/aos/aos.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<style type="text/css">
.portfolio-links {
	display: flex;
	flex-direction: row;
}
</style>
</head>
<body>
	<jsp:include page="../common/mainBar.jsp"></jsp:include>
	<section id="portfolio" class="portfolio section-bg">
		<div class="container" data-aos="fade-up" data-aos-delay="100">
			<div class="row portfolio-container">
				<c:forEach var="Product" items="${pList}" varStatus="i">
					<div class="col-lg-4 col-md-6 portfolio-item filter-app">
						<div class="portfolio-wrap">
							<img
								src="/resources/images/productImg/${Product.productMainName}"
								class="img-fluid" width="350px">
							<div class="portfolio-info">
								<h4>상품명 : ${Product.productName }</h4>
								<p>
									가격 :
									<fmt:setLocale value="ko_KR" />
									<fmt:formatNumber type="currency"
										value="${Product.productPrice}" />
								</p>
								<p>조회수 : ${Product.productShowCnt}</p>
								<p id="fCnt${Product.productNum}">좋아요 : ${Product.fCnt}</p>
								<div class="portfolio-links">
									<a
										href="/resources/images/productImg/${Product.productMainName}"
										data-gall="portfolioGallery" class="venobox"> <i
										class="icofont-eye"></i></a> <a
										href="ProductDetailView.do?pNum=${Product.productNum}"
										title="More Details"><svg xmlns="http://www.w3.org/2000/svg" height="30" viewBox="0 3 24 24" width="30"><path d="M0 0h24v24H0V0z" fill="none"/><path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/><path d="M12 10h-2v2H9v-2H7V9h2V7h1v2h2v1z"/></svg></a>
									<a href="javascript:chg(${Product.productNum})"> <i
										class='fas fa-star' style='font-size: 20px'
										id="icon${Product.productNum}"></i></a>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- 페이징 처리 -->
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item">
						<!-- [이전] --> <c:if test="${pi.currentPage <= 1 }">
							<li class="page-item disabled"><a class="page-link" href="#"
								tabindex="-1"><span aria-hidden="true">&laquo;</span><span
									class="sr-only">Previous</span></a></li>
						</c:if> <c:if test="${pi. currentPage > 1 }">
							<c:url var="before" value="myFavoriteList.do">
								<c:param name="page" value="${pi.currentPage - 1 }" />
							</c:url>
							<a class="page-link" href="${before }" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
							</a>
						</c:if>
					</li>
					<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
						<c:if test="${p eq pi.currentPage }">
							<li class="page-item active"><a class="page-link"
								href="${pagination }">${p }<span class="sr-only">(current)</span></a></li>
						</c:if>
						<c:if test="${p ne pi.currentPage }">
							<c:url var="pagination" value="myFavoriteList.do">
								<c:param name="page" value="${p }" />
							</c:url>
							<li class="page-item"><a class="page-link"
								href="${pagination }">${p }</a></li>
						</c:if>
					</c:forEach>
					<li class="page-item">
						<!-- [다음] --> <c:if test="${pi.currentPage >= pi.maxPage }">
							<li class="page-item disabled"><a class="page-link" href="#"
								tabindex="-1"><span aria-hidden="true">&raquo;</span><span
									class="sr-only">Next</span></a></li>
						</c:if> <c:if test="${pi. currentPage < pi.maxPage }">
							<c:url var="after" value="myFavoriteList.do">
								<c:param name="page" value="${pi.currentPage + 1 }" />
							</c:url>
							<a class="page-link" href="${after }" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
							</a>
						</c:if>
					</li>
				</ul>
			</nav>
		</div>
	</section>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script type="text/javascript">
		function chg(num) {			
			var url = "";
			if($("#icon"+num)[0].className == "fas fa-star"){
				url = "/deleteFavorite.do?page=${pi.currentPage}&pNum="+num;
			}else if($("#icon"+num)[0].className == "far fa-star"){
				url = "/insertFavorite.do?page=${pi.currentPage}&pNum="+num;
			}
			
			$.ajax({
				url : url,
				type : "get",
				success : function(data) {
					$("#icon"+num)[0].className = data.src;
					$("#fCnt"+num)[0].innerHTML = "좋아요 : " + data.cnt;
				},
				error : function() {
					console.log("실패");
				}
			}); 
		}
	</script>
</body>
</html>