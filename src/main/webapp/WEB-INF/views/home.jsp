<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>어부바 메인페이지</title>
    <meta content="" name="descriptison">
    <meta content="낚시, 구매, 상품" name="keywords">

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
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
    <style type="text/css">


    </style>
</head>

<body>

    <jsp:include page="common/mainBar.jsp"></jsp:include>

    <!-- ======= Hero Section ======= -->
    <section id="hero">
        <div class="hero-container">
            <div id="heroCarousel" class="carousel slide carousel-fade" data-ride="carousel">

                <ol class="carousel-indicators" id="hero-carousel-indicators"></ol>

                <div class="carousel-inner" role="listbox">

                    <!-- Slide 1 -->
                    <div class="carousel-item active" style="background-image: url('assets/img/slide/fisherman1.png');">
                        <div class="carousel-container">
                            <div class="carousel-content container">
                                <h2 class="animate__animated animate__fadeInDown">
                                    <small>우리는</small> '어부바' <span></span>
                                </h2>
                                <p class="animate__animated animate__fadeInUp">'어부들이 부러워 하는 바다'로서<br> 좋은 품질의 낚시용품을 제공하고 좋은 조과포인트를,<br> 함께 할 수 있는 멤버들을 구하고 활발히 교류할수 있는 커뮤니티를<br> 한공간에 제공하는 플랫폼을 만들고자 했습니다.
                                </p>
                                <!-- <a href="#about"
                           class="btn-get-started animate__animated animate__fadeInUp scrollto">더보기</a> -->
                            </div>
                        </div>
                    </div>

                    <!-- Slide 2 -->
                    <div class="carousel-item" style="background-image: url('assets/img/slide/fisherman2.png');">
                        <div class="carousel-container">
                            <div class="carousel-content container">
                                <h2 class="animate__animated animate__fadeInDown">조과 포인트를 한눈에</h2>
                                <p class="animate__animated animate__fadeInUp">우리 낚시하러 같이 갈래요?</p>
                                <a href="#about" class="btn-get-started animate__animated animate__fadeInUp scrollto">지도보러가기</a>
                            </div>
                        </div>
                    </div>

                    <!-- Slide 3 -->
                    <div class="carousel-item" style="background-image: url('assets/img/slide/fisherman3.png');">
                        <div class="carousel-container">
                            <div class="carousel-content container">
                                <h2 class="animate__animated animate__fadeInDown">낚시 용품을 한눈에</h2>
                                <p class="animate__animated animate__fadeInUp"></p>
                                <a href="productMain.do" class="btn-get-started animate__animated animate__fadeInUp scrollto">쇼핑하러가기</a>
                            </div>
                        </div>
                    </div>

                </div>

                <a class="carousel-control-prev" href="#heroCarousel" role="button" data-slide="prev"> <span class="carousel-control-prev-icon icofont-rounded-left" aria-hidden="true"></span> <span class="sr-only">Previous</span>
                </a> <a class="carousel-control-next" href="#heroCarousel" role="button" data-slide="next"> <span class="carousel-control-next-icon icofont-rounded-right" aria-hidden="true"></span> <span class="sr-only">Next</span>
                </a>

            </div>
        </div>
    </section>
    <!-- End Hero -->

    <main id="main">
        <!-- ======= Our Portfolio Section ======= -->
        <section id="portfolio" class="portfolio section-bg">
            <div class="container" data-aos="fade-up" data-aos-delay="100">
                <div class="section-title">
                    <h2>낚시용품</h2>
                    <p>빠르게 만나보는 낚시용품</p>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <ul id="portfolio-flters">
                            <li data-filter="*" class="filter-active">전체보기</li>
                            <li data-filter=".filter-favorite">좋아요</li>
                            <li data-filter=".filter-sold">판매량</li>
                            <li data-filter=".filter-views">조회순</li>
                        </ul>
                    </div>
                </div>
                <div class="row portfolio-container">
                    <c:forEach var="Product" items="${favoriteList}" varStatus="i">
                        <div class="col-lg-4 col-md-6 portfolio-item filter-favorite">
                            <div class="portfolio-wrap" style="height: 350px;width: 350px;">
                                <img src="/resources/images/productImg/${Product.productMainName}" class="img-fluid" style="height:100%; width:100%;">
                                <div class="portfolio-info">
                                    <h4>상품명 : ${Product.productName }</h4>
                                    <p>가격 : ${Product.productPrice }원</p>
                                    <p>좋아요 : ${Product.cnt}</p>
                                    <div class="portfolio-links">
                                        <a href="/resources/images/productImg/${Product.productMainName}" data-gall="portfolioGallery" class="venobox"> <i class="icofont-eye"></i></a>
                                        <a href="javascript:showItem(${Product.productNum}, '${loginInfo.memberId}')" title="More Details">
                                            <svg xmlns="http://www.w3.org/2000/svg" height="30" viewBox="0 3 24 24" width="30">
                                                <path d="M0 0h24v24H0V0z" fill="none" />
                                                <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z" />
                                                <path d="M12 10h-2v2H9v-2H7V9h2V7h1v2h2v1z" /></svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <c:forEach var="Product" items="${soldList}" varStatus="i">
                        <div class="col-lg-4 col-md-6 portfolio-item filter-sold">
                            <div class="portfolio-wrap" style="height: 350px;width: 350px;">
                                <img src="/resources/images/productImg/${Product.productMainName}" class="img-fluid" style="height:100%; width:100%;">
                                <div class="portfolio-info">
                                    <h4>상품명 : ${Product.productName }</h4>
                                    <p>가격 : ${Product.productPrice }원</p>
                                    <p>판매량 : ${Product.cnt}</p>
                                    <div class="portfolio-links">
                                        <a href="/resources/images/productImg/${Product.productMainName}" data-gall="portfolioGallery" class="venobox"> <i class="icofont-eye"></i></a>
                                        <a href="javascript:showItem(${Product.productNum})" title="More Details">
                                            <svg xmlns="http://www.w3.org/2000/svg" height="30" viewBox="0 3 24 24" width="30">
                                                <path d="M0 0h24v24H0V0z" fill="none" />
                                                <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z" />
                                                <path d="M12 10h-2v2H9v-2H7V9h2V7h1v2h2v1z" /></svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <c:forEach var="Product" items="${showList}" varStatus="i">
                        <div class="col-lg-4 col-md-6 portfolio-item filter-views">
                            <div class="portfolio-wrap" style="height: 350px;width: 350px;">
                                <img src="/resources/images/productImg/${Product.productMainName}" class="img-fluid" style="height:100%; width:100%;">
                                <div class="portfolio-info">
                                    <h4>상품명 : ${Product.productName }</h4>
                                    <p>가격 : ${Product.productPrice }원</p>
                                    <p>조회수 : ${Product.cnt}</p>
                                    <div class="portfolio-links">
                                        <a href="/resources/images/productImg/${Product.productMainName}" data-gall="portfolioGallery" class="venobox"> <i class="icofont-eye"></i></a>
                                        <a href="javascript:showItem(${Product.productNum})" title="More Details">
                                            <svg xmlns="http://www.w3.org/2000/svg" height="30" viewBox="0 3 24 24" width="30">
                                                <path d="M0 0h24v24H0V0z" fill="none" />
                                                <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z" />
                                                <path d="M12 10h-2v2H9v-2H7V9h2V7h1v2h2v1z" /></svg>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
        <!-- End Our Portfolio Section -->
        <!-- ======= Counts Section ======= -->
        <section class="counts section-bg">
            <div class="container">
            	<div class="section-title">
            		<h2>낚시터 현황</h2>
            	</div>                
                <div class="row">
					<iframe class="fixed-area" src="map.do" width="100%" height="500px"></iframe>
				</div>
            </div>
        </section>
        <!-- End Counts Section -->
    </main>
    <!-- End #main -->
    <script type="text/javascript">
        function showItem(num, id) {
            if (id != "") {
                location.href = "ProductDetailView.do?pNum=" + num;
            } else {
                alert("로그인후 사용이 가능합니다.");
            }
        }

    </script>
    <jsp:include page="common/footer.jsp"></jsp:include>
</body>

</html>
