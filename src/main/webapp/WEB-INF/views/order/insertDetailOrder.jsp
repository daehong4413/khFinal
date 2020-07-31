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
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,600,600i,700,700i,900"
	rel="stylesheet">

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

<!-- =======================================================
  * Template Name: Mamba - v2.3.0
  * Template URL: https://bootstrapmade.com/mamba-one-page-bootstrap-template-free/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
	<jsp:include page="../common/mainBar.jsp"></jsp:include>


   
        <div class="container">
            <span class="head">
                주문 / 결제
            </span>

            <br>
            <div class="line"></div><br><br>

            <div class="orderList table-responsive" style="text-align:center">
                <table class="table">
                    <thead>
                        <tr class="success">
                            <th style="text-align:center">상품정보</th>
                            <th style="text-align:center">상품명</th>
                            <th style="text-align:center">사이즈</th>
                            <th style="text-align:center">색상</th>
                            <th style="text-align:center">수량</th>
                            <th style="text-align:center">가격</th>
                            <th style="text-align:center">배송비</th>
                            <th style="text-align:center">가격-등급할인+배송비</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td> <img src="img/%EA%B3%A0%EC%B0%BD%EC%88%98%EB%B0%95.jpg" width="100px;" height="100px;"><br>
                                고창 수박
                            </td>
                            <td>프레비</td>
                            <td>1</td>
                            <td>2,500</td>
                            <td>28,900</td>
                        </tr>
                    </tbody>

                </table>
            </div>

            <br>
            <div class="line"></div>


        </div>
    <div class="container">
 <button type="submit" class="btn btn-primary" onclick="">결제하기</button>
  <button type="submit" class="btn btn-primary" onclick="">쇼핑하기</button>
</div>

        <br><br><br>

    












	</section>
	<!-- End Our Portfolio Section --> </main>
	<!-- End #main -->

	<jsp:include page="../common/footer.jsp"></jsp:include>

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

</body>
</html>