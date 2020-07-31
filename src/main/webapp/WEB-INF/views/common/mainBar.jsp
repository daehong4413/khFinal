<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  
  
  <!--채팅창 style  -->
  <style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

/* Button used to open the chat form - fixed at the bottom of the page */
.open-button {
  
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  opacity: 0.7;
  position: fixed;
  bottom: 3px;
  right: 28px;
  width: 80px;
}

/* The popup chat - hidden by default */
.chat-popup {
  display: none;
  position: fixed;
  bottom: 0;
  right: 15px;
  border: 3px solid #f1f1f1;
  z-index: 9;
}

/* Add styles to the form container */
.form-container {
  height: 600px;
  width: 800px;
  padding: 10px;
  background-color: white;
}



/* Set a style for the submit/send button */
.form-container .btn {
  float:right;	
  color: white;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  bottm:23px;
  right:15px;
  width: 80px;
  opacity: 0.7;
  
 
  
}

/* Add a red background color to the cancel button */
.form-container .cancel {
  background-color: none;
}

/* Add some hover effects to buttons */
.form-container .btn:hover, .open-button:hover {
  opacity: 1;
}
</style>
</head>

<body>

    <!-- ======= Header ======= -->
    <header id="header">
        <div class="container">

            <div class="logo float-left">
                <h1 class="text-light">
                    <a href="/"><span>어부바</span></a>
                </h1>
                <!-- Uncomment below if you prefer to use an image logo -->
                <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
            </div>
            <c:url var="nlist" value="nlist.do" />
            <c:url var="flist" value="flist.do" />
            <nav class="nav-menu float-right d-none d-lg-block">
                <ul>
                    <li class="active"><a href="/">홈</a></li>
                    <c:if test="${!empty sessionScope.loginInfo}">
                        <li><a href="productMain.do">낚시용품</a></li>
                    </c:if>
                    <c:if test="${empty sessionScope.loginInfo}">
                        <li><a onclick="failed();">낚시용품</a></li>
                    </c:if>
                    <c:if test="${empty sessionScope.loginInfo}">
					<li><a onclick="failed();">커뮤니티</a></li>
					</c:if>
					<c:if test="${!empty sessionScope.loginInfo}">
					<li><a onclick="#">커뮤니티</a></li>
					</c:if>
					<c:if test="${empty sessionScope.loginInfo}">
					<li><a onclick="failed();">구매후기</a></li>
					</c:if>
					<c:if test="${!empty sessionScope.loginInfo}">
					<li><a href="orderReview.do">구매후기</a></li>
					</c:if>
					<c:if test="${empty sessionScope.loginInfo}">
					<li><a onclick="failed();">자유게시판</a></li>
					</c:if>
					<c:if test="${!empty sessionScope.loginInfo}">					
					<li><a href="${flist }">자유게시판</a></li>
					</c:if>
                    <c:if test="${empty sessionScope.loginInfo}">
					<li><a onclick="failed();">고객센터</a></li>
					</c:if>
					<c:if test="${!empty sessionScope.loginInfo}">					
					<li><a href="${nlist }">고객센터</a></li>
					</c:if>	
                    <c:if test="${ !empty sessionScope.loginInfo }">
                        <li class="drop-down"><a href="/">마이페이지</a>
                            <ul>
                                <li><a href="myWriteList.do">내가 쓴 게시물</a></li>
                                <li><a href="myOrderList.do">구매내역</a></li>
                                <li><a href="myCartList.do">장바구니</a></li>
                                <li><a href="myFavoriteList.do">관심상품</a></li>
                                <li><a href="myPage.me">내 정보</a></li>
                                <c:if test="${loginInfo.memberId eq 'admin' }">
                                <li><a href="mlistView.do">회원관리</a></li>
                                </c:if>
                            </ul>
                        </li>
                    </c:if>
                    <c:if test="${ empty sessionScope.loginInfo }">
                        <li><a href="" onclick="open_pop();">로그인/회원가입</a></li>
                    </c:if>
                    <c:url var="logout" value="logout.me"></c:url>
                    <c:if test="${ !empty sessionScope.loginInfo }">
                        <li><a href=${logout }>${loginInfo.memberName }님/로그아웃</a></li>
                    </c:if>

                </ul>
            </nav>
            <script type="text/javascript">
                function open_pop() {
                    var width = 350,
                        height = 600;
                    var popupX = (document.body.offsetWidth / 2) - (width / 2);
                    //&nbsp;만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
                    var popupY = (window.screen.height / 2) - (height / 2);
                    //&nbsp;만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음

                    var url = "loginMain.me";
                    var option = "width = " + width + ", height = " + height + ", " +
                        "top = " + popupY + ", left = " + popupX + ", location = no, resizable=no";
                    var title = "login";
                    console.log(url);
                    window.open(url, title, option);
                }

                function failed() {
                    alert('로그인 후 사용가능합니다.!');
                    return false;
                }
            </script>
        </div>
    </header>
    <!-- End Header -->
    <a class="link"href="" target="site">
			<img class="open-button" src="resources/images/chat.png" onclick="openForm()"/>
			</a>
			<!-- <button class="open-button" onclick="openForm()">Chat</button> -->

<div class="chat-popup" id="myForm">
  <div class="form-container">
	<iframe id="_chatbox" name="site" style="width:100%; height:100%;" ></iframe>
	<a class="link"href="" target="site">
    <img class="btn cancel" src="resources/images/chathide.png" onclick="closeForm()"/>
    </a>
  </div>
</div>

<script>
function openForm() {
	
		$("#myForm").css("display", "block");
		$(".open-button").css("display", "none");
		$(".link").attr("href", "chat2.jsp?id="+'${loginInfo.memberId }');
		
		
	}

	function closeForm() {
		$("#myForm").css("display", "none");
		$(".open-button").css("display", "block");
		$(".link").attr("href", "");
		$('#_chatbox').get(0).contentWindow.webSocket.onClose;

	}
	
	 $(".chat").on({
	        "click" : function() {
	        		
	            if ($(this).attr("src") == "resources/images/chat.png") {
	            	$(".link").attr("href","chat2.jsp");
	                $(".chat").attr("src", "resources/images/chathide.png");
	                $("#_chatbox").css("display", "block");
	            } else if ($(this).attr("src") == "resources/images/chathide.png") {
	                $(".chat").attr("src", "resources/images/chat.png");
	                $("#_chatbox").css("display", "none");
	                $(".link").attr("href","");
	                $('#_chatbox').get(0).contentWindow.webSocket.onClose;
					//iframe의 내부에 있는 메소드 사용하여 연결해제
	              	
	            }
	        }
	    
	    });
	
</script>
</body>