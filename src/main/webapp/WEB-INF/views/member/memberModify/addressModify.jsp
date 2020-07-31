<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>배송지 수정</title>
<!-- Google Fonts -->
    <!-- Google fonts-->
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</head>

<body id="page-top">
<jsp:include page="../../common/mainBar.jsp"/> 
	<!-- 제목 콘텐츠-->
	<section class="page-section bg-light" id="portfolio">
		<div class="container">
		 <h2>배송지 수정</h2>
			<div class="row">
			
			<!--콘텐츠 페이지 내용 위치-->
			<div class="col-lg-12" data-aos="fade-up" data-aos-delay="300">
				<form action="addressModify.me" method="get" class="php-email-form">
			
				<table>
						<tr>
							<td>지역번호</td>
							<td><input type="text" class="form-control" id="id"
								size="30" name="post" placeholder="" value="${loginInfo.post }"
								style="margin: 10px"></td>
						</tr>
						<tr>
							<td>주소</td>
							<td><input type="text" class="form-control" id="id"
								size="30" name="post" placeholder="" value="${loginInfo.address }"
								style="margin: 10px"></td>
						</tr>
						<tr>
							<td>상세주소</td>
							<td><input type="text" class="form-control" id="id"
								size="30" name="post" placeholder="" value="${loginInfo.addressDetail }"
								style="margin: 10px"></td>
						</tr>		
						<input type="hidden" name="memberId" value="${loginInfo.memberId }"/>
						<tr>
						
							<td>
								<button type="reset" class="btn btn-secondary">취소하기</button>
							</td>
							<td>
								<button type="submit" class="btn btn-primary">등록하기</button>
							</td>

						</tr>

					</table> 
				</form>
		</div>
			</div>
		</div>
		</div>
	</section>

	<jsp:include page="../../common/footer.jsp"/>
	<!-- End Footer -->
</body>
</html>