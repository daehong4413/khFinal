<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>어부바 메인페이지</title>
    <meta content="" name="descriptison">
    <meta content="낚시, 구매, 상품" name="keywords">


    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,600,600i,700,700i,900" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
    <link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
    <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">

    <!-- =======================================================
  * Template Name: Mamba - v2.3.0
  * Template URL: https://bootstrapmade.com/mamba-one-page-bootstrap-template-free/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
    <!-- 부트스트랩  4.5.0 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<style type="text/css">
.btn-custom {
  background-color: #52768D !important;
  background-repeat: repeat-x;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#768FA6", endColorstr="#768FA6");
  background-image: -khtml-gradient(linear, left top, left bottom, from(#768FA6), to(#768FA6));
  background-image: -moz-linear-gradient(top, #768FA6, #768FA6);
  background-image: -ms-linear-gradient(top, #768FA6, #768FA6);
  background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #768FA6), color-stop(100%, #768FA6));
  background-image: -webkit-linear-gradient(top, #768FA6, #768FA6);
  background-image: -o-linear-gradient(top, #768FA6, #768FA6);
  background-image: linear-gradient(#768FA6, #768FA6);
  border-color: #768FA6 #768FA6 #52768D;
  color: #fff !important;
  text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.16);
  -webkit-font-smoothing: antialiased;
}
</style>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

</head>

<body>
    <jsp:include page="../common/mainBar.jsp"></jsp:include>



    <main id="main">
        <!-- ======= Our Portfolio Section ======= -->
        <section id="portfolio" class="portfolio section-bg">
            <div class="container" data-aos="fade-up" data-aos-delay="100">

                <c:set var="name" value="${loginInfo.memberName }"></c:set>
                <c:if test="${loginInfo.memberId eq 'admin'}">
                    <a href="insertShowProduct.do" class="btn btn-custom btn-lg">상품등록</a>

                </c:if>

                <div class="section-title">
                    <h2>낚시용품</h2>
                    <p>빠르게 만나보는 낚시용품</p>
                </div>

                <div class="row">
                    <div class="col-lg-12">
                        <ul id="portfolio-flters">
                            <li data-filter="*" class="btn btn-custom btn-sm">전체보기</li>
                            <li data-filter=".filter-fishingRod">낚시대</li>
                            <li data-filter=".filter-fishingReel">릴</li>
                            <li data-filter=".filter-fishingBag">가방</li>
                            <li data-filter=".filter-fishingFeed">채비</li>
                            <li data-filter=".filter-fishingLine">라인</li><br><br>
                            <form action="searchProduct.do">
                                <input type="text" name="productName" placeholder="검색">
                                <button click="submit" class="btn btn-custom btn-sm">검색</button>
                            </form>
                        </ul>
                    </div>
                </div>

                <div class="row portfolio-container">
                    <c:forEach items="${list }" var="p">
                        <c:if test="${p.categoryNum eq 0}">
                            <div class="col-lg-4 col-md-6 portfolio-item filter-fishingRod">
                                <div class="portfolio-wrap" style="height: 350px;width: 350px;">
                                    <img src="/resources/images/productImg/${p.productMainName}" class="img-fluid" alt="" style="height:100%; width:100%;">
                                    <c:url var="detailView" value="ProductDetailView.do">
                                        <c:param name="pNum" value="${p.productNum }" />
                                        <%-- <c:param name="pViewCtn" value="${p.productShowCnt }" /> --%>

                                    </c:url>

                                    <div class="portfolio-info">
                                        <h4>상품명 : ${p.productName }</h4>
                                        <p>가격 : ${p.productPrice }원</p>
                                        <p>조회수 : ${p.productShowCnt}</p>
                                        <p id="fCnt${p.productNum}">좋아요 : ${p.fCnt}</p>
                                        <div class="portfolio-links">
                                        	<a href="ProductDetailView.do?pNum=${p.productNum }" title="More Details" value="${p.productNum }"><svg xmlns="http://www.w3.org/2000/svg" height="30" viewBox="0 3 24 24" width="30"><path d="M0 0h24v24H0V0z" fill="none"/><path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/><path d="M12 10h-2v2H9v-2H7V9h2V7h1v2h2v1z"/></svg></a>
                                            <a href="javascript:chg(${p.productNum})">
                                            <i class='<c:if test="${p.fStat eq 'T'}">fas</c:if><c:if test="${p.fStat eq 'F'}">far</c:if> fa-star' style='font-size: 20px' id="icon${p.productNum}"></i>
                                           	</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>


                        <c:if test="${p.categoryNum eq 1}">
                            <div class="col-lg-4 col-md-6 portfolio-item filter-fishingReel">
                                <div class="portfolio-wrap" style="height: 350px;width: 350px;">

                                    <img src="/resources/images/productImg/${p.productMainName }" class="img-fluid" alt="" style="height:100%; width:100%;">
                                    <c:url var="detailView" value="ProductDetailView.do">
                                        <c:param name="pNum" value="${p.productNum }" />
                                    </c:url>
                                    <div class="portfolio-info">
                                        <h4>상품명 : ${p.productName }</h4>
                                        <p>가격 : ${p.productPrice }원</p>
                                        <p>조회수 : ${p.productShowCnt}</p>
                                        <p id="fCnt${p.productNum}">좋아요 : ${p.fCnt}</p>
                                        <div class="portfolio-links">
                                            <a href="ProductDetailView.do?pNum=${p.productNum }" title="More Details" value="${p.productNum }"><svg xmlns="http://www.w3.org/2000/svg" height="30" viewBox="0 3 24 24" width="30"><path d="M0 0h24v24H0V0z" fill="none"/><path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/><path d="M12 10h-2v2H9v-2H7V9h2V7h1v2h2v1z"/></svg></a>
                                            <a href="javascript:chg(${p.productNum})">
                                            <i class='<c:if test="${p.fStat eq 'T'}">fas</c:if><c:if test="${p.fStat eq 'F'}">far</c:if> fa-star' style='font-size: 20px' id="icon${p.productNum}"></i>
                                           	</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>


                        <c:if test="${p.categoryNum eq 2}">
                            <div class="col-lg-4 col-md-6 portfolio-item filter-fishingBag">
                                <div class="portfolio-wrap" style="height: 350px;width: 350px;">

                                    <img src="/resources/images/productImg/${p.productMainName }" class="img-fluid" alt="" style="height:100%; width:100%;">
                                    <c:url var="detailView" value="ProductDetailView.do">
                                        <c:param name="pNum" value="${p.productNum }" />

                                    </c:url>
                                    <div class="portfolio-info">
                                        <h4>상품명 : ${p.productName }</h4>
                                        <p>가격 : ${p.productPrice }원</p>
                                        <p>조회수 : ${p.productShowCnt}</p>
                                        <p id="fCnt${p.productNum}">좋아요 : ${p.fCnt}</p>
                                        <div class="portfolio-links">
                                            <a href="ProductDetailView.do?pNum=${p.productNum }" title="More Details" value="${p.productNum }"><svg xmlns="http://www.w3.org/2000/svg" height="30" viewBox="0 3 24 24" width="30"><path d="M0 0h24v24H0V0z" fill="none"/><path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/><path d="M12 10h-2v2H9v-2H7V9h2V7h1v2h2v1z"/></svg></a>
                                            <a href="javascript:chg(${p.productNum})">
                                            <i class='<c:if test="${p.fStat eq 'T'}">fas</c:if><c:if test="${p.fStat eq 'F'}">far</c:if> fa-star' style='font-size: 20px' id="icon${p.productNum}"></i>
                                           	</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${p.categoryNum eq 3}">
                            <div class="col-lg-4 col-md-6 portfolio-item filter-fishingFeed">
                                <div class="portfolio-wrap" style="height: 350px;width: 350px;">

                                    <img src="/resources/images/productImg/${p.productMainName }" class="img-fluid" alt="" style="height:100%; width:100%;">
                                    <c:url var="detailView" value="ProductDetailView.do">
                                        <c:param name="pNum" value="${p.productNum }" />
                                    </c:url>
                                    <div class="portfolio-info">
                                        <h4>상품명 : ${p.productName }</h4>
                                        <p>가격 : ${p.productPrice }원</p>
                                        <p>조회수 : ${p.productShowCnt}</p>
                                        <p id="fCnt${p.productNum}">좋아요 : ${p.fCnt}</p>
                                        <div class="portfolio-links">
											<a href="ProductDetailView.do?pNum=${p.productNum }" title="More Details" value="${p.productNum }"><svg xmlns="http://www.w3.org/2000/svg" height="30" viewBox="0 3 24 24" width="30"><path d="M0 0h24v24H0V0z" fill="none"/><path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/><path d="M12 10h-2v2H9v-2H7V9h2V7h1v2h2v1z"/></svg></a>
                                            <a href="javascript:chg(${p.productNum})">
                                            <i class='<c:if test="${p.fStat eq 'T'}">fas</c:if><c:if test="${p.fStat eq 'F'}">far</c:if> fa-star' style='font-size: 20px' id="icon${p.productNum}"></i>
                                           	</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>


                        <c:if test="${p.categoryNum eq 4}">
                            <div class="col-lg-4 col-md-6 portfolio-item filter-fishingLine">
                                <div class="portfolio-wrap" style="height: 350px;width: 350px;">

                                    <img src="/resources/images/productImg/${p.productMainName}" class="img-fluid" alt="" style="height:100%; width:100%;">
                                    <c:url var="detailView" value="ProductDetailView.do">
                                        <c:param name="pNum" value="${p.productNum }" />
                                    </c:url>
                                    <div class="portfolio-info">
                                        <h4>상품명 : ${p.productName }</h4>
                                        <p>가격 : ${p.productPrice }원</p>
                                        <p>조회수 : ${p.productShowCnt}</p>
                                        <p id="fCnt${p.productNum}">좋아요 : ${p.fCnt}</p>
                                        <div class="portfolio-links">
                                        	<a href="ProductDetailView.do?pNum=${p.productNum }" title="More Details" value="${p.productNum }"><svg xmlns="http://www.w3.org/2000/svg" height="30" viewBox="0 3 24 24" width="30"><path d="M0 0h24v24H0V0z" fill="none"/><path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"/><path d="M12 10h-2v2H9v-2H7V9h2V7h1v2h2v1z"/></svg></a>
                                            <a href="javascript:chg(${p.productNum})">
                                            <i class='<c:if test="${p.fStat eq 'T'}">fas</c:if><c:if test="${p.fStat eq 'F'}">far</c:if> fa-star' style='font-size: 20px' id="icon${p.productNum}"></i>
                                           	</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>

            </div>




            <!-- End Our Portfolio Section -->
    </main>
    <!-- End #main -->

    <jsp:include page="../common/footer.jsp"></jsp:include>
    <!-- End Footer -->

    <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

    <!-- Vendor JS Files -->
    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
    <script src="assets/vendor/php-email-form/validate.js"></script>
    <script src="assets/vendor/jquery-sticky/jquery.sticky.js"></script>
    <script src="assets/vendor/venobox/venobox.min.js"></script>
    <script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
    <script src="assets/vendor/counterup/counterup.min.js"></script>
    <script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
    <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="assets/vendor/aos/aos.js"></script>

    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>
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
