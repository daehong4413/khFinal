<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>구매내역</title>
    <meta content="" name="descriptison">
    <meta content="낚시, 구매, 상품" name="keywords">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

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
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>
    <style type="text/css">
        .head {
            font-size: 30px;
            color: lightgray;
        }

        .line {
            border: 0.5px solid lightgray;
            background: lightgray;
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

        #mkOrder {
            float: right;
        }

    </style>
</head>

<body>
    <jsp:include page="../common/mainBar.jsp"></jsp:include>
    <section>
        <div class="container">
            <span class="head">
                <br>
                구매내역
                <br>
            </span>
            <div class="orderList table-responsive" style="text-align:center">
                <table class="table">
                    <thead>
                        <tr class="success">
                            <th style="text-align:center">상품정보</th>
                            <th style="text-align:center">상품명</th>
                            <th style="text-align:center">수량</th>
                            <th style="text-align:center">가격</th>
                            <th style="text-align:center">할인률</th>
                            <th style="text-align:center">할인적용 금액</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="product" items="${pList}" varStatus="i">
                            <tr>
                                <td><img src="/resources/images/productImg/${product.productMainName}" width="100px;" height="100px;"><br></td>
                                <td><input type="hidden" name="productName" value="${product.productName}">${product.productName}</td>
                                <td>${product.orderQty}</td>
                                <td><input type="hidden" name="productPrice" value="${product.productPrice}">
                                    <fmt:formatNumber value="${product.productPrice}" pattern="#,###" />원</td>
                                <td><input type="hidden" name="dcRate" value="${order.dcRate}">${order.dcRate}%</td>
                                <!-- 이부분 토탈이라서 확인해야됨 -->
                                <td id="calcPrice${i.index}">
                                    <input type="hidden" name="sumPrice" value=<fmt:formatNumber value="${product.productPrice*((100-order.dcRate)/100)*product.orderQty}" type="number" />>
                                    <fmt:formatNumber value="${product.productPrice*((100-order.dcRate)/100)*product.orderQty}" type="number" />원
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="3" align="right">배송비 : </td>
                            <td align="center">2500원</td>
                            <td align="center">총액 : </td>
                            <td id="totalPrice" align="center"></td>
                        </tr>
                    </tfoot>
                </table>
                <div class="line"></div>
                <p></p>
                - 주문 정보
                <p></p>

                <table class="table">
                    <tr>
                        <td>수령인 :</td>
                        <td><input type="text" class="form-control" id="name" value="${order.orderName}" readonly></td>
                    </tr>
                    <tr>
                        <td>휴대폰 :</td>
                        <td><input type="text" class="form-control" id="phone" value="${order.orderPhone}" readonly></td>
                    </tr>
                    <tr>
                    	<td>상태 : </td>
                        <td>	
							<c:forEach var="stat" items="${sList}">
							<c:if test="${stat.statusNum == order.statusNum}">
								<input type="text" class="form-control"  value="${stat.statusName}" readonly/>
							</c:if>
								
                            	
							</c:forEach>
                        </td>
                    </tr>

                    <tr>
                        <td>우편번호 :</td>
                        <td><input type="text" class="form-control" id="postcode" value="${order.orderPost}" readonly></td>
                    </tr>
                    <tr>
                        <td>주소 :</td>
                        <td><input type="text" class="form-control" id="address" value="${order.orderAddress}" readonly></td>
                    </tr>
                    <tr>
                        <td>상세주소 :</td>
                        <td><input type="text" class="form-control" id="detailAddress" value="${order.orderAddressDetail}" readonly></td>
                    </tr>
                </table>
                <div class="line"></div>
            </div>
		</div>
    </section>
    <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
    <jsp:include page="../common/footer.jsp"></jsp:include>
    <script type="text/javascript">
		$( document ).ready(function() {
			calcTotalPrice();
		});
		function calcTotalPrice(){
			var regexp = /\B(?=(\d{3})+(?!\d))/g;
			var sum = 0;
			for(var i = 0; i < $("input[name^='sumPrice']").length; i++){
				sum =  sum + parseInt($($("input[name^='sumPrice']")[i]).val().replace(",", ""));
			}
			sum += 2500;
			$("#totalPrice").html(sum.toString().replace(regexp, ',') + "원");
		}
    </script>   
</body>

</html>
