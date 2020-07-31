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
		<title>장바구니</title>
		<meta content="" name="descriptison">
		<meta content="낚시, 구매, 상품" name="keywords">

		<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
		
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
	        #mkOrder{
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
                장바구니
                <br>
            	</span>
            	<!-- <form onsubmit='return daehong()' action="orderDetailInsertInfo.do"  method="post"> -->
            	<div class="orderList table-responsive" style="text-align:center">
                <table class="table">
                    <thead>
                        <tr class="success">
                        	<th style="text-align:center"><input type="button" value="전체선택" 
                        										 class="btn btn-primary" onclick="javascript:chkAll()"></th>
                            <th style="text-align:center">상품정보</th>
                            <th style="text-align:center">상품명</th>
                            <th style="text-align:center">사이즈</th>
                            <th style="text-align:center">색상</th>
                            <th style="text-align:center">수량</th>
                            <th style="text-align:center">가격</th>
                            <th style="text-align:center">할인률</th>
                            <th style="text-align:center">할인적용 금액</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="product" items="${pList}" varStatus="i">
                        <tr>
                        	<input type="hidden" name="productNum${i.index}" value="${product.productNum}">
                        	<td><input type="checkbox" name="chk${i.index}"></td>
                            <td><img src="/resources/images/productImg/${product.productMainName}" width="100px;" height="100px;"><br></td>
                            <td><input type="hidden" name="productName${i.index}" value="${product.productName}">${product.productName}</td>
                            <td>${product.productSize}</td>
                            <td>${product.productColor}</td>
                            <td><input type="number" id="${i.index}" name="orderQty${i.index}" min="1" max="100" step="1" value="${product.orderQty}"></td>
                            <td><input type="hidden" name="productPrice${i.index}" value="${product.productPrice}">
                            <fmt:formatNumber value="${product.productPrice}" pattern="#,###"/>원</td>
                            <td><input type="hidden" name="dcRate" value="${dcRate}">${dcRate}%</td>
                            <!-- 이부분 토탈이라서 확인해야됨 -->
                            <td id = "calcPrice${i.index}">
                            	<input 	type="hidden" name="sumPrice${i.index}" 
                    					value=<fmt:formatNumber value="${product.productPrice*((100-dcRate)/100)*product.orderQty}" type="number"/>>
                    			<fmt:formatNumber value="${product.productPrice*((100-dcRate)/100)*product.orderQty}" type="number"/>원
                    		</td>
                        </tr>
                        </c:forEach>
                    </tbody>
                    <tfoot>
                    	<tr>
                    		<td><input type="button" value="선택삭제" class="btn btn-danger" onclick="javascript:chkDel()"></td>
                    		<td colspan="5" align = "right">배송비 : </td>
                    		<td align="center">2500원</td>
                    		<td align="center">총액 : </td>
                    		<td id = "totalPrice" align="center"></td>
                    	</tr>
                    </tfoot>
                </table>
				<div class="line"></div>
				<p></p>
				- 주문자 정보
				<p></p>
				<div class="input-group">
				  <div class="input-group-prepend">
				  	<div class="input-group-text">
				    	<input type="checkbox" name="infoCheck" id="infoCheck">&nbsp; 회원주소로 불러오기
				    </div>
				  </div>
				</div>								
				<table class="table">
					<tr>
						<td>수령인 :</td>
						<td><input type="text" class="form-control" id="name"
							name="orderName" placeholder="이름을 입력해주세요"></td>
					</tr>
					<tr>
						<td>휴대폰 :</td>
						<td><input type="text" class="form-control " id="phone" 
							name="orderPhone" placeholder="휴대폰 번호를 입력해주세요"></td>
					</tr>
					<tr>
						<td><br></td>
						<td><br></td>
					</tr>
					<tr>
						<td>우편번호 찾기 :</td>
						<td><input class="btn btn-default btn-block" type="button"
							onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></td>
					</tr>
					<tr>
						<td>우편번호 :</td>
						<td><input type="text" class="form-control" id="postcode"
									name="orderPost" placeholder="우편번호"></td>
					</tr>
					<tr>
						<td>주소 :</td>
						<td><input type="text" class="form-control" id="address"
								name="orderAddress" placeholder="주소"></td>
					</tr>
					<tr>
						<td>상세주소 :</td>
						<td><input class="form-control" type="text"
								id="detailAddress" name="orderAddressDetail" placeholder="상세주소"></td>
					</tr>
				</table>
					<input type="hidden" name="statusNum" value="1">
					<input type="hidden" name="purchaseNum" value="Y">
					<input type="hidden" name="purchaseType" value="1">
				<div class="line"></div>
				<div class="paySystem">
					<br>
					<h4>- 결제 방식</h4>
					<input 	type="radio" id="acount" name="pay" value="1"
							onclick="showAcountPay();"> <label for="">무통장입금</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					<input	type="radio" id="kakao" name="pay" value="2"
							onclick="showKakao();"> <label for="">카카오페이</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input	type="radio" id="payPhone" name="pay" value="3"
							onclick="showPhone();"> <label for="">휴대폰</label>
				</div>
				<div id=acountDiv class="box">
					<p class="txt_desc_payment">
						가상계좌는 주문 시 고객님께 발급되는 일회성 계좌번호 이므로 입금자명이 다르더라도 입금 확인이 가능합니다. 단,
						선택하신 은행을 통해 결제 금액을 1원 단위까지 정확히 맞추셔야 합니다. 가상 계좌의 입금 유효 기간은 주문 후 2일
						이내이며, 기간 초과 시 계좌번호는 소멸되어 입금되지 않습니다. 구매 가능 수량이 1개로 제한된 상품은 주문 취소 시,
						24시간 내 가상 계좌를 통한 재주문이 불가 합니다. 인터넷뱅킹, 텔레뱅킹, ATM/CD기계, 은행 창구 등에서 입금할
						수 있습니다.<br /> ATM 기기는 100원 단위 입금이 되지 않으므로 통장 및 카드로 계좌이체 해주셔야 합니다.
						은행 창구에서도 1원 단위 입금이 가능합니다. 자세한 내용은 <a href="/app/cs/faq/12?view_no=231"><span>FAQ</span></a>를 확인하여 주시기바랍니다.
					</p>
					<br>
					<div class="box-select">
						<select name="card_code" id="card_code">
							<option value="1">무통장입금</option>
							<option value="2">기업은행</option>
							<option value="3">국민은행</option>
							<option value="4">우리은행</option>
							<option value="5">수협</option>
							<option value="6">농협</option>
							<option value="7">부산은행</option>
							<option value="8">SC제일은행</option>
							<option value="9">신한은행</option>
							<option value="10">KEB하나은행</option>
							<option value="11">광주은행</option>
							<option value="12">우체국</option>
							<option value="13">대구은행</option>
							<option value="14">경남은행</option>
						</select> 
						<select id="card_quota" name="card_quota">
						</select>
					</div>
				</div>
				<div id="kakaoDiv" class="box">
					<div>
						<p class="txt_tit_payment">카카오페이 안내</p>
						<p class="txt_desc_payment">카카오페이는 카카오톡에서 카드를 등록, 간단하게 비밀번호만으로
							결제할 수 있는 빠르고 편리한 모바일 결제 서비스입니다.</p>
						<ul class="list_wrap">
							<li><span>-</span><span>지원 카드 : 모든 카드 등록/결제 가능</span></li>
						</ul>
					</div>
				</div>
	
				<div id="phoneDiv" class="box">
					<div id="div_mobile"">
						<p class="txt_tit_payment">휴대폰 결제(수수료) 안내</p>
						<p class="txt_desc_payment">
							휴대폰 결제는 통신사와 결제 대행사의 정책/ 높은 수수료/늦은 정산 주기로 인해 50만 원 이하 상품만 가능하며 <strong
								class="txt-line">결제하실 금액의 5%가 결제 수수료로 추가</strong>됩니다.<br />예)
							판매 금액 50,000원 상품을 휴대폰 결제할 경우 52,500원이 결제됩니다. 환불 시에는 수수료를 포함한 결제
							금액이 환불됩니다.<br /> <br />
						</p>
						<p class="txt_desc_payment">
							※ <strong>저렴한 구매를 원하실 경우 타 결제 수단(신용카드, 가상 계좌, 계좌이체)를 이용</strong>하시기
							바랍니다.
						</p>
						<p class="txt_desc_payment">※ 부분환불/결제 월이 지난 경우, 계좌로 환불됩니다.</p>
					</div>
				</div>		
                <button id="mkOrder" type="button" class="btn btn-dark" onclick="javascript:validationInfo()">주문하기</button>
            	</div>
            	<!-- </form> -->
        	</div>
        </section>
		<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>	
		<jsp:include page="../common/footer.jsp"></jsp:include>
		<script type="text/javascript">
			var flag="true";
			function chkAll(){
				if(flag == "true"){
					for(var i=0; i<$("input[name^='chk']").length; i++){
						$("input[name^='chk']")[i].checked = true;
					}
					flag = "false";
				}else{
					for(var i=0; i<$("input[name^='chk']").length; i++){
						$("input[name^='chk']")[i].checked = false;
					}
					flag = "true";
				}
			}
			
			function chkDel(){
				var list = new Array();
				for(var i=$("input[name^='chk']").length-1; i>=0; i--){
					if($("input[name^='chk']")[i].checked){
						list.push(parseInt($("input[name='productNum"+$("input[name^='chk']")[i].name.replace("chk", "")+"']").val()));
						$($("input[name^='chk']")[i]).parent().parent().remove();
					}
				}
				calcTotalPrice();
				
				$.ajaxSettings.traditional = true;
				
				$.ajax({
					url : "delCart.do",
					type : "POST",
					data : {"pNumList" : list},
					error : function() {
						console.log("실패");
					}
				});  
			}
			
			function calcTotalPrice(){
				var regexp = /\B(?=(\d{3})+(?!\d))/g;
				var sum = 0;
				for(var i = 0; i < $("input[name^='sumPrice']").length; i++){
					sum =  sum + parseInt($($("input[name^='sumPrice']")[i]).val().replace(",", ""));
				}
				sum += 2500;
				$("#totalPrice").html(sum.toString().replace(regexp, ',') + "원");
			}
			
			$( document ).ready(function() {
				calcTotalPrice();
			});
			
			$("input[name^='orderQty']").on("change", function () {
				var id = $(this)[0].id;
				var qty = $(this).val();
				var price = $("input[name='productPrice"+id+"'").val();
				var dcRate = ${dcRate};
				var calPrice = parseInt(price*((100-dcRate)/100)*qty);
				var txt = "";
				var regexp = /\B(?=(\d{3})+(?!\d))/g;
				
				txt += "<input type='hidden' name='sumPrice"+id+"'" + " value='"+calPrice+"'>";
				txt += calPrice.toString().replace(regexp, ',') + "원";
				$("#calcPrice"+id).html(txt);
				calcTotalPrice();
			});
		</script>
		
		<script>
			$("#infoCheck").change(function(){
				var name = '${loginInfo.memberName}'; 
				var phone = '${loginInfo.phone}';
				var post = '${loginInfo.post}';
				var address = '${loginInfo.address}';
				var addressDetail = '${loginInfo.addressDetail}';
					
				if($("#infoCheck").is(":checked"))	{ 
					$("#name").val(name);
					$("#phone").val(phone);
					$("#postcode").val(post);
					$("#address").val(address);
					$("#detailAddress").val(addressDetail);
				}else{
					$("#name").val("");
					$("#phone").val("");
					$("#postcode").val("");
					$("#address").val("");
					$("#detailAddress").val("");
				}
			});
			
			$("#card_code").on("change", function() {
				if ($(this).val() != 1) {
					$("#card_quota").html("<option value=''>110-2313-222-3345 예금주 김대홍</option>");
				} else {
					$("#card_quota").html("");
				}
			});
			
			function showAcountPay() {
				var bank = document.getElementById("acount");
				if (bank.checked) {
					document.getElementById("acountDiv").style.display = "block";
					document.getElementById("kakaoDiv").style.display = "none";
					document.getElementById("phoneDiv").style.display = "none";
				}
			}
			function showKakao() {
				var kakao = document.getElementById("kakao");
				if (kakao.checked) {
					document.getElementById("acountDiv").style.display = "none";
					document.getElementById("kakaoDiv").style.display = "block";
					document.getElementById("phoneDiv").style.display = "none";
				}
			}
			
			function showPhone() {
				var phone = document.getElementById("payPhone");
				if (phone.checked) {
					console.log(phone.checked);
					document.getElementById("acountDiv").style.display = "none";
					document.getElementById("kakaoDiv").style.display = "none";
					document.getElementById("phoneDiv").style.display = "block";
				}
			}
			
			//<!-- 입력값 유효성체크 -->
			function validationInfo() {
				var name = document.getElementById("name");
				var phone = document.getElementById("phone");
				var postcode = document.getElementById("postcode");
				var address = document.getElementById("address");
				var payCheak = document.getElementsByName("pay");
				var detailAddress = document.getElementById("detailAddress");
				var num = false;
				
				if (name.value == "") {
					alert("수령인 입력하세요");
					return false;
				} else if (phone.value == "") {
					alert("휴대폰번호를 입력해주세요");
					return false;
				} else if (postcode.value == "") {
					alert("우편번호를 입력해주세요");
					return false;
				} else if(address.value == "") {
					alert("주소를 입력해주세요");
					return false;
				} else if(detailAddress.value == "") {
					alert("상세주소를 입력해주세요");
					return false;
				}
				
				var receiverData = {};
				receiverData.memberId = "${loginInfo.memberId}";
				receiverData.name = name.value;
				receiverData.phone = phone.value;
				receiverData.postcode = postcode.value;
				receiverData.address = address.value;
				receiverData.detailAddress = detailAddress.value;
				receiverData.dcRate = "${dcRate}";
				
				var productName;
				if($("input[name^='productName']").length > 1){
					productName = "" + $($("input[name^='productName']")[0]).val() + " 외 " + (($("input[name^='productName']").length)-1) + "건";
				}else{
					productName = "" + $($("input[name^='productName']")[0]).val()
				}
				
				var totalPrice = $("#totalPrice").html().toString().replace(",", "").replace("원", "");
				
				 for (var i = 0; i < payCheak.length; i++) {
					if (payCheak[i].checked == true) {
						var list = new Array();
						for(var j=0; j<$("input[name^='productNum']").length; j++){
							list.push({"productNum" : $($("input[name^='productNum']")[j]).val().toString(),
								"cnt" : $($("input[name^='orderQty"+$("input[name^='productNum']")[j].name.replace("productNum", "")+"']")).val().toString()});
						}
						receiverData.type = i.toString();
						if (i == 0) {
							calc(list, receiverData);
							break;
						} else if (i == 1) {
							Kakao(productName, totalPrice, list, receiverData);
							break;
						} else if (i == 2) {
							phonePay(productName, totalPrice, list, receiverData);
							break;
						}
					}
				}
			}
			
			function Kakao(productName, totalPrice, list, receiverData) {
				var result = "";
				var IMP = window.IMP;
				IMP.init('imp83138778');
				IMP.request_pay({
					pg : 'html5_inicis',
					pay_method : 'vbank',
					merchant_uid : 'merchant_' + new Date().getTime(),
					name : productName,
					amount : totalPrice,
					buyer_email : "12312",
					buyer_name : "12312",
					buyer_tel : "123",
					buyer_addr : "123"
	
				}, function(rsp) {
					if (rsp.success) {
						var msg = '결제가 완료되었습니다.';
						result = calc(list, receiverData);
					} else {
						result = "fail";
						var msg = '결제에 실패하였습니다.';
						msg += '에러내용 : ' + rsp.error_msg;
					}
					if(result!=""){
						alert(msg);	
					}
				});
	
			}
	
			function phonePay(productName, totalPrice, list, receiverData) {
				var result = "";
				var IMP = window.IMP;
				IMP.init('imp37897171');
				IMP.request_pay({
					pg : 'html5_inicis',
					pay_method : 'vbank',
					merchant_uid : 'merchant_' + new Date().getTime(),
					name : productName,
					amount : totalPrice,
					buyer_email : "12312",
					buyer_name : "12312",
					buyer_tel : "123",
					buyer_addr : "123"
	
				}, function(rsp) {
					if (rsp.success) {
						var msg = '결제가 완료되었습니다.';
						result = calc(list, receiverData);
					} else {
						result = "fail";
						var msg = '결제에 실패하였습니다.';
						msg += '에러내용 : ' + rsp.error_msg;
					}
					if(result != ""){
						alert(msg);	
					}
				});
			}
			
			function calc(list, receiverData) {
				var param = {};
				param.multiParam = list;
				param.receiverData = receiverData;
				console.log(JSON.stringify(param));
				
				$.ajax({
					url : "bucketToOrder.do",
					type : "POST",
					contentType: "application/json",
					dataType : "json",
					data : JSON.stringify(param),
					success : function(data) {
						if(data.result == "success"){
							alert("구매성공");
							location.reload(true);
						}else{
							alert("구매실패");
						}
						return data.result;
					},
					error : function() {
						alert("구매실패");
						return "fail";
					}
				});	
			}
			function sample6_execDaumPostcode() {
	            new daum.Postcode({
	                oncomplete: function(data) {
	                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                    var addr = ''; // 주소 변수
	                    var extraAddr = ''; // 참고항목 변수

	                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                        addr = data.roadAddress;
	                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                        addr = data.jibunAddress;
	                    }

	                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                    if (data.userSelectedType === 'R') {
	                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                        if (data.bname !== '' &&
	                            /[동|로|가]$/g.test(data.bname)) {
	                            extraAddr += data.bname;
	                        }
	                        // 건물명이 있고, 공동주택일 경우 추가한다.
	                        if (data.buildingName !== '' &&
	                            data.apartment === 'Y') {
	                            extraAddr += (extraAddr !== '' ? ', ' +
	                                data.buildingName :
	                                data.buildingName);
	                        }
	                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                        if (extraAddr !== '') {
	                            extraAddr = ' (' + extraAddr + ')';
	                        }
	                        // 조합된 참고항목을 해당 필드에 넣는다.
	                        //document.getElementById("sample6_extraAddress").value = extraAddr;

	                    } else {
	                        //document.getElementById("sample6_extraAddress").value = '';
	                    }

	                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                    document.getElementById('postcode').value = data.zonecode;
	                    document.getElementById("address").value = addr;
	                    // 커서를 상세주소 필드로 이동한다.
	                    document.getElementById("detailAddress").focus();
	                }
	            }).open();
	        }
		</script>
	</body>
</html>