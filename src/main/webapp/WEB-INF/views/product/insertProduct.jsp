
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
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<style>
.head {
	font-size: 30px;
	color: lightgray;
}

.line {
	border: 0.5px solid lightgray;
	background: lightgray;
}

input {
	background-color: transparent;
	border: solid lightgray;
	text-align: right;
}

.userInfo ul li {
	list-style: none;
	height: 40px;
}

.userInfo label {
	float: left;
	width: 100px;
}

.paySystem label {
	width: 100px;
}

.box {
	display: none;
}

.box li {
	list-style: none;
}

.box label {
	width: 70px;
}

.sumAmount {
	font-size: 30px;
	float: right;
}

.sumAmount b {
	color: cornflowerblue;
	float: right;
}

.submitBtn {
	margin-top: 70px;
	margin-left: 40%;
}
</style>

<!-- 부트스트랩  4.5.0 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>



</head>

<body>



	<jsp:include page="../common/mainBar.jsp"></jsp:include>


	<section class="text-monospace h3">

	<div class="section-title">
				<h2>판매상품등록</h2>
			</div>
		<form action="insertProduct.do" id="myForm" method="post"
			enctype="Multipart/form-data">
  	<div width="1200px" align="center" class="container">
   	<table align="center" border="0" cellspacing="0" class="table table-bordered">
				<tr>
					<td>카테고리</td>
					<td><select class="custom-select custom-select-lg mb-3" name="categoryNum" >
							<option value="0" selected>낚시대</option>
							<option value="1">릴</option>
							<option value="2">가방</option>
							<option value="3">채비</option>
							<option value="4">라인</option>
					</select></td>
				</tr>
				<tr>
					<td>상품이름</td>
					<td><input type="text" name="productName" id="name" class="form-control-file"></td>
				</tr>
				<tr>
					<td>상품재고</td>
					<td><input type="text" name="productStock" id="stock" class="form-control-file"></td>
				</tr>
				<tr>
					<td>상품가격</td>
					<td><input type="text" name="productPrice" id="price" class="form-control-file"></td>
				</tr>
				<tr>
					<td>상품사이즈</td>
					<td><input type="text" name="productSize" id="size" class="form-control-file"></td>

				</tr>
				<tr>
					<td>상품색상</td>
					<td><input type="text" name="productColor" id="color" class="form-control-file"></td>
				</tr>
				<tr>
					<td>상품정보</td>
					<td><input type="file" name="uploadFileInfo" id="info" class="form-control-file" ></td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td><input type="file" name="uploadFile"  id="uploadfile" class="form-control-file" ></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					
				
					<input type="button" value="등록" onclick="validationInfo();">&nbsp;
						&nbsp;</td>
					
				</tr>


			</table>
			</div>
		</form>

	</section>

<script>
function validationInfo() {

	var name = document.getElementById("name");
	var stock = document.getElementById("stock");
	var price = document.getElementById("price");
	var size = document.getElementById("size");
	var color = document.getElementById("color");
	var info = document.getElementById("info");
	var uploadfile = document.getElementById("uploadfile");

	if(name.value==""){
		alert("이름을 입력하세요");
		name.focus();
		return false;
	}else if(stock.value==""){
		alert("상품재고를 입력하세요");
		stock.focus();
		return false;
	}else if(price.value==""){
		alert("가격을 입력하세요");
		price.focus();
		return false;
	}else if(size.value==""){
		alert("사이즈를 입력하세요");
		size.focus();
		return false;	
	}else if(color.value==""){
		alert("색을 입력하세요")
		color.focus();
		return false;
	}else if(info.value==""){
		alert("상품정보를 등록하세요")
		info.focus();
		return false;
	}else if(uploadfile.value==""){
		alert("메인사진을 등록하세요")
		uploadfile.focus();
		return false;
	}
	document.getElementById('myForm').submit();
}



</script>



	<!-- End Our Portfolio Section -->
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer">
		<div class="footer-top">
			<div class="container">
				<div class="row">

					<div class="col-lg-3 col-md-6 footer-info">
						<h3>어부바</h3>
						<p>
							서울시 영등포구 당산동 <br> <br> <br> <strong>Phone:</strong>
							+82 010-6666-8888<br> <strong>Email:</strong>
							fisherbarKH@gmail.com<br>
						</p>
						<div class="social-links mt-3">
							<a href="#" class="twitter"><i class="bx bxl-twitter"></i></a> <a
								href="#" class="facebook"><i class="bx bxl-facebook"></i></a> <a
								href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
							<a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
							<a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
						</div>
					</div>

					<div class="col-lg-2 col-md-6 footer-links">
						<h4>Useful Links</h4>
						<ul>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">About
									us</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Terms
									of service</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Privacy
									policy</a></li>
						</ul>
					</div>

					<div class="col-lg-3 col-md-6 footer-links">
						<h4>Our Services</h4>
						<ul>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Web
									Design</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Web
									Development</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Product
									Management</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Graphic
									Design</a></li>
						</ul>
					</div>

					<div class="col-lg-4 col-md-6 footer-newsletter">
						<h4>Our Newsletter</h4>
						<p>Tamen quem nulla quae legam multos aute sint culpa legam
							noster magna</p>


					</div>

				</div>
			</div>
		</div>

		<div class="container">
			<div class="copyright">
				&copy; Copyright <strong><span>Mamba</span></strong>. All Rights
				Reserved
			</div>
			<div class="credits">
				<!-- All the links in the footer should remain intact. -->
				<!-- You can delete the links only if you purchased the pro version. -->
				<!-- Licensing information: https://bootstrapmade.com/license/ -->
				<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/mamba-one-page-bootstrap-template-free/ -->
				Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
			</div>
		</div>
	</footer>
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
	<script>
		
	</script>
</body>
</html>