<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<style>
		body{font-family:lato,sans-serif}
	.container{max-width:1000px;margin-left:auto;margin-right:auto;padding-left:10px;padding-right:10px}
		h2{font-size:26px;margin:20px 0;text-align:center}
	small{font-size:.5em}
	.table-header{border-radius:3px;padding:25px 30px;display:flex;justify-content:space-between;margin-bottom:25px}
	.table-row{border-radius:3px;padding:25px 30px;display:flex;justify-content:space-between;margin-bottom:25px}
	.table-header{background-color:#95A5A6;font-size:20px;text-transform:uppercase;letter-spacing:.03em}
	.table-row{background-color:#fff;box-shadow:0 0 9px 0 rgba(0,0,0,.1);font-size:15px;}
	.col-1{flex-basis:10%}
	.col-2{flex-basis:40%}
	.col-3,.col-4{flex-basis:25%}
	@media all and (max-width:767px){
	.table-header{display:none}
	li{
	display:"block"
	}
	.col{flex-basis:100%;display:flex;padding:10px 0}
	.col:before{color:#6C7A89;padding-right:10px;content:attr(data-label);flex-basis:50%;text-align:right}
	}

</style>
	 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script type="text/javascript" 
src="http://code.jquery.com/jquery-3.4.1.min.js"></script> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오더리뷰</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/mainBar.jsp"></jsp:include>
	<div class="container">
      <h2>상품 후기 <small>어부바</small></h2>
      <ul class="responsive-table">
        <li class="table-header">
          <div class="col col-2"><b>카테고리</b></div>
          <div class="col col-2"><b>상품명</b></div>
          <div class="col col-2"><b>제목</b></div>
          <div class="col col-2"><b>작성자</b></div>
          <div class="col col-2"><b>작성일</b></div>  
        </li>
        <c:forEach  items="${list }" var="item" varStatus="stat">
        
        <li class="table-row" onclick="showContent(${stat.index})" >
          <div class="col col-2" ><b>${item.categoryName }</b></div>
          <div class="col col-2" ><b>${item.productName }</b></div>
          <div class="col col-2" ><b>${item.title }</b></div>
          <div class="col col-2" ><b>${item.member }</b></div>
          <div class="col col-2" ><b>${item.cdt }</b></div>
        </li>
        
        <li class="table-row" id="content${stat.index }"style="display:none;background-color:#F5FFFA">
        	<div class="col col-12" ><img src="/resources/images/orderRviewImg/${item.fileName}" style="width:200px;height:150px"><br><b>${item.content }</b></div>
        </li>
        
        </c:forEach>
  	
        
      </ul>
    </div>
   <script>
   	function showContent(num){
   		if($("#content"+num).css("display")=="none"){
   		$("#content"+num).css("display","block");
   		}
   		else if($("#content"+num).css("display")=="block"){
   	   	$("#content"+num).css("display","none");
   	   		}
   		}
   
   </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

   
   
   <!-- 페이징 처리 -->
                  <nav aria-label="Page navigation example">
                      <ul class="pagination justify-content-center">
                         <li class="page-item">
                           <!-- [이전] -->
                           <c:if test="${pi.currentPage <= 1 }">
                                    <li class="page-item disabled">
                              <a class="page-link" href="#" tabindex="-1"><span aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span></a>
                            </li>
                              </c:if>
                              <c:if test="${pi. currentPage > 1 }">
                           <c:url var="before" value="orderReview.do">
		<c:param name="page" value="${pi.currentPage - 1 }" />
	</c:url>
                           <a class="page-link" href="${before }" aria-label="Previous">
                               <span aria-hidden="true">&laquo;</span>
                             <span class="sr-only">Previous</span>
                              </a>
                              </c:if> 
                            </li>
                  <c:forEach var="p"   begin="${pi.startPage }" end="${pi.endPage }">
                        <c:if test="${p eq pi.currentPage }">
                           <li class="page-item active"><a class="page-link" href="${pagination }">${p }<span class="sr-only">(current)</span></a></li>
                        </c:if>
                        <c:if test="${p ne pi.currentPage }">
                         <c:url var="pagination" value="orderReview.do">
			<c:param name="page" value= "${p }" />
		</c:url>         
                            <li class="page-item"><a class="page-link" href="${pagination }">${p }</a></li>
                              </c:if>
                  </c:forEach>
                         <li class="page-item">
                         <!-- [다음] -->
                         <c:if test="${pi.currentPage >= pi.maxPage }">
                                 <li class="page-item disabled">
                           <a class="page-link" href="#" tabindex="-1"><span aria-hidden="true">&raquo;</span><span class="sr-only">Next</span></a>
                         </li>
                              </c:if>
                              <c:if test="${pi. currentPage < pi.maxPage }">
                          <c:url var="after" value="orderReview.do">
		<c:param name="page" value="${pi.currentPage + 1 }" />
	</c:url>
                           <a class="page-link" href="${after }" aria-label="Next">
                             <span aria-hidden="true">&raquo;</span>
                             <span class="sr-only">Next</span>
                              </a>
                              </c:if>
                         </li>
                       </ul>
                  </nav>
		
	
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
</body>
</html>