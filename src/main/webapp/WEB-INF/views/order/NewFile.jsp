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
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <!--    다음 주소 api    -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script>
    
        function execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var extraRoadAddr = ''; // 참고 항목 변수

                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraRoadAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraRoadAddr !== '') {
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('postcode').value = data.zonecode;
                    document.getElementById("roadAddress").value = roadAddr;
                    document.getElementById("jibunAddress").value = data.jibunAddress;



                    var guideTextBox = document.getElementById("guide");
                    // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                    if (data.autoRoadAddress) {
                        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                        guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                        guideTextBox.style.display = 'block';

                    } else if (data.autoJibunAddress) {
                        var expJibunAddr = data.autoJibunAddress;
                        guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                        guideTextBox.style.display = 'block';
                    } else {
                        guideTextBox.innerHTML = '';
                        guideTextBox.style.display = 'none';
                    }
                }
            }).open();
        }

        /* 결제 방식 */
        function showBankbook() {
            var bankBook = document.getElementById("bankBook");
            if (bankBook.checked) {
                document.getElementById("bankBookBox").style.display = "block";
                document.getElementById("cardBox").style.display = "none";
                document.getElementById("transferBox").style.display = "none";
            }
        }

        function showCard() {
            var card = document.getElementById("card");
            if (card.checked) {
                document.getElementById("bankBookBox").style.display = "none";
                document.getElementById("cardBox").style.display = "block";
                document.getElementById("transferBox").style.display = "none";
            }
        }

        function showTransfer() {
            var transfer = document.getElementById("transfer");
            if (transfer.checked) {
                document.getElementById("bankBookBox").style.display = "none";
                document.getElementById("cardBox").style.display = "none";
                document.getElementById("transferBox").style.display = "block";
            }
        }
    </script>

    <style>
        .head {
            font-size: 30px;
            color: deepskyblue;
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
    </style>


</head>

<body>
	<jsp:include page="../common/mainBar.jsp"></jsp:include>


    <section>
        <div class="container">
            <span class="head">
        <br>        
                주문 / 결제
                <br>
            </span>

       

            <br>
            <div class="line"></div>

            <form action="#" method="post">
                <div class="userInfo">
                    <h4>- 주문자 정보</h4><br>
                    <ul>
                        <li>
                            <label for="name">수령인 </label>
                            <input type="text" id="name" name="name" placeholder="이름을 입력해주세요">
                        </li>
                        <li>
                            <label for="phone">휴대폰 </label>
                            <input type="text" id="phone" name="phone" placeholder="휴대폰 번호를 입력해주세요"></li>
                        <li>
                            <label for="postcode">우편번호 </label>
                            <input type="text" id="postcode" placeholder="우편번호">
                            <input type="button" onclick="execDaumPostcode()" class="btn btn-success btn-xs" value="우편번호 찾기"></li>
                        <li>
                            <label for="roadAddress">도로명 주소 </label>
                            <input type="text" id="roadAddress" placeholder="도로명주소" disabled></li>
                        <li>
                            <label for="jibunAddress">지번 주소 </label>
                            <input type="text" id="jibunAddress" placeholder="지번주소" disabled></li>
                        <span id="guide" style="color:#999;display:none"></span>
                        <li>
                            <label for="detailAddress">상세 주소 </label>
                            <input type="text" id="detailAddress" placeholder="상세주소"></li>
                    </ul>


                </div>

                <br>
                <div class="line"></div>

                <div class="paySystem">
                    <h4>- 결제 방식</h4>
                    <input type="radio" name="pay" id="bankBook" onclick="showBankbook();"> <label for="bankBook">무통장입금</label>
                    <input type="radio" name="pay" id="card" onclick="showCard();"> <label for="card">카드결제</label>
                    <input type="radio" name="pay" id="transfer" onclick="showTransfer();"> <label for="transfer">계좌이체</label>
                </div>
                <br>

                <div id="bankBookBox" class="box">
                    <ul>
                        <li>예금주 : 이주민</li>
                        <li>입금할 계좌번호 : 355-0037-9291-93</li>
                    </ul>

                </div>

                <div id="cardBox" class="box">
                    <ul>

                        <li>
                            <label for="bank">은행 </label>
                            <input type="text" id="bank" list="Banks" placeholder="은행 입력/선택">
                            <datalist id="Banks">
                                <option value="신한"></option>
                                <option value="농협"></option>
                                <option value="우리"></option>
                                <option value="하나"></option>
                                <option value="기업"></option>
                                <option value="국민"></option>
                            </datalist></li>
                        <li>
                            <label>카드번호</label>
                            <input type="text" maxlength="4" size="4px;"> -
                            <input type="text" maxlength="4" size="4px;"> -
                            <input type="text" maxlength="4" size="4px;"> -
                            <input type="text" maxlength="4" size="4px;">
                        </li>

                        <li>
                            <label>유효기간 </label>
                            Month :
                            <input type="text" maxlength="2" size="2px;"> &nbsp;
                            Year :
                            <input type="text" maxlength="2" size="2px;">

                        </li>
                    </ul>
                </div>



                <div id="transferBox" class="box">
                    <label for="bank">은행 </label>
                    <input type="text" id="bank" list="Banks" placeholder="은행 입력/선택">
                    <datalist id="Banks">
                        <option value="신한"></option>
                        <option value="농협"></option>
                        <option value="우리"></option>
                        <option value="하나"></option>
                        <option value="기업"></option>
                        <option value="국민"></option>
                    </datalist>
                </div>

                <span class="sumAmount">총 결제 금액 : &nbsp; <b>28,900원</b></span>


                <input type="submit" class="btn btn-info btn-lg submitBtn" onclick="donation()" value="결제하기">

  <script>
                     
                     function donation(){
                       var money=window.prompt("결제할 금액을 입력하세요");
                        var IMP = window.IMP;
                        IMP.init('imp37897171');
                        IMP.request_pay({
                            pg : 'html5_inicis',
                            pay_method : 'vbank',
                            merchant_uid : 'merchant_' + new Date().getTime(),
                            name : orderName,
                            amount : money,
                            buyer_email : email,
                            buyer_name : name,
                            buyer_tel : tel,
                            buyer_addr : addr
                        
                           
                        }, function(rsp) {
                            if ( rsp.success ) {
                                var msg = '결제가 완료되었습니다.';
                                msg += '고유ID : ' + rsp.imp_uid;
                                msg += '상점 거래ID : ' + rsp.merchant_uid;
                                msg += '결제 금액 : ' + rsp.paid_amount;
                                msg += '카드 승인번호 : ' + rsp.apply_num;
                                location.href = "donationHistory?boardNo="+${board.board_No}+"&amount="+money   ;
                                
                                
                                
                            } else {
                                var msg = '결제에 실패하였습니다.';
                                msg += '에러내용 : ' + rsp.error_msg;
                            }
                            alert(msg);
                        });
                     
                     }
                    
                    
                  </script>

            </form>

        </div>



        <br><br><br>

    </section>
   
     

       
       
        <br><br><br>

    












	</section>
	<!-- End Our Portfolio Section --> </main>
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
	<script>
	
	</script>
</body>
</html>