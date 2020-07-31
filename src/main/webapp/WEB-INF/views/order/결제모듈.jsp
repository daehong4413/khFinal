<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<input type="button" id="btn"onclick="donation()" value="btn"/>


 <script>

                     
                   function donation(){
                       var money=window.prompt("결제할 금액을 입력하세요");
                        var IMP = window.IMP;
                        IMP.init('imp37897171');
                        IMP.request_pay({
                            pg : 'html5_inicis',
                            pay_method : 'vbank',
                            merchant_uid : 'merchant_' + new Date().getTime(),
                            name : "dd",
                            amount : 1000,
                            buyer_email : "12312",
                            buyer_name : "12312",
                            buyer_tel : "123",
                            buyer_addr : "123"
                        
                           
                        }, function(rsp) {
                            if ( rsp.success ) {
                                var msg = '결제가 완료되었습니다.';
                                msg += '고유ID : ' + rsp.imp_uid;
                                msg += '상점 거래ID : ' + rsp.merchant_uid;
                                msg += '결제 금액 : ' + rsp.paid_amount;
                                msg += '카드 승인번호 : ' + rsp.apply_num;
                                
                                location.href=""
                                
                                
                                
                                
                            } else {
                                var msg = '결제에 실패하였습니다.';
                                msg += '에러내용 : ' + rsp.error_msg;
                            }
                            alert(msg);
                        });
                     
                     }
                    
                    
                  </script>
</body>
</html>