<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>마이 페이지 : 내 정보 </title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">


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
</head>

<body>

 	<jsp:include page="../common/mainBar.jsp"></jsp:include>
	
    <!-- ======= About Lists Section ======= -->
    <section class="about-lists">
      <div class="container">

        <div class="row no-gutters">

          <div class="col-lg-4 col-md-6 content-item" data-aos="fade-up">
            <span>01</span>
            <a href="memberIdModifyView.me"><h4>프로필 수정</h4></a>
            <table>
                <tr>
                    <td style="width:38px;">이름</td><td>${loginInfo.memberName }</td>
                </tr>
               
                 <tr>
                    <td>별명</td><td>${loginInfo.nickName}</td>
                </tr>
            </table>
          </div>

          <div class="col-lg-4 col-md-6 content-item" data-aos="fade-up" data-aos-delay="100">
            <span>02</span>
            <a href="phoneModifyView.me"><h4>연락처 수정</h4></a>
            <table>
                <tr>
                    <td style="width:70px;">이메일</td><td>${loginInfo.email}</td>
                </tr>
                 <tr>
                    <td>전화번호</td><td>${loginInfo.phone}</td>
                </tr>
            </table>
          </div>

          <div class="col-lg-4 col-md-6 content-item" data-aos="fade-up" data-aos-delay="200">
            <span>03</span>
            <a href="addressModifyView.me"><h4>배송지 수정</h4></a>
            <p>어부바에서 쇼핑 하실려면 최근 거주하시는 배송지를 입력하세요.
              </p>
          </div>

          <div class="col-lg-4 col-md-6 content-item" data-aos="fade-up" data-aos-delay="300">
            <span>04</span>
            <a href="passwordModifyView.me"><h4>보안 설정</h4></a>
            <p>어부바 로그인시 사용하는 비밀번호를 변경하세요. 주기적인 비밀번호 변경을 통해 개인정보를 안전하게 보호하세요</p>
          </div>

          <div class="col-lg-4 col-md-6 content-item" data-aos="fade-up" data-aos-delay="400">
            <span>05</span>
           <a href="deleteMember.me?memberId=${loginInfo.memberId }" onclick="return confirm('정말 탈퇴 하시겠습니까? 되돌 릴 수 없습니다.')"><h4>회원 탈퇴</h4></a>
            <p>어부바를 더이상 이용하지 않는다면...</p>
          </div>

          <div class="col-lg-4 col-md-6 content-item" data-aos="fade-up" data-aos-delay="500">
            <span>06</span>
            <a href="/"><h4>메인 페이지로</h4></a>
            <p>메인페이지로 이동합니다.</p>
          </div>

        </div>

      </div>
    </section><!-- End About Lists Section -->

 

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