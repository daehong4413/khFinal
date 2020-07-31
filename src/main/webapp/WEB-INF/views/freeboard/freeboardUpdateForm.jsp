<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>하이</title>

<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
   integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
   crossorigin="anonymous">
   
   <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
   integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
   crossorigin="anonymous"></script> -->
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
   integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
   crossorigin="anonymous"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
   integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
   crossorigin="anonymous"></script>
<script type="text/javascript"
	src="/resources/ckeditor/ckeditor.js"></script>
</head>

<body id="page-top">
   <!-- 상단바-->
   <%-- <c:import url="../common/mainBar.jsp" /> --%>
   <jsp:include page="../common/mainBar.jsp"></jsp:include>
   <br>
   <br>
   <!-- 메인 콘텐츠-->
   <section class="page-section bg-light" id="portfolio">
      <div class="container">
         <!--메인 콘텐츠 위치-->
         <div class="row">
            <!--아이콘 위치-->
            <!--제목 위치-->
            <div class="col-11">
               <span class="h2">자유게시판 수정 페이지</span>
            </div>
         </div>
         <hr>
         <br>
         <!--콘텐츠 페이지 내용 위치-->
         <div>
            <br>
            <form action="fupdate.do" method="post"
               enctype="Multipart/form-data">

               <div class="form-group">
                  <input type="text" name="boardNo" value="${freeboard.boardNo }"
                     readonly>

               </div>
              
               <div class="form-group">
                  <input type="text" name="memberId" value="${loginInfo.memberId }"
                     readonly>

               </div>
               <div class="form-group">
                  <input type="text" name="title" class="form-control"
                     id="exampleFormControlInput1" value="${freeboard.title}">
               </div>
               <div class="form-group">
                  <textarea name="bContent" id="editor1" rows="10"  >${freeboard.bContent}</textarea>
                  <script type="text/javascript">
                     // Replace the <textarea id="editor1"> with a CKEditor 4
                     // instance, using default configuration.
                     //CKEDITOR.replace( 'editor1' );
                     $(function() {
                        CKEDITOR.replace('editor1', {
                           filebrowserUploadUrl : "fileupload.do"
                        });
                     });
                  </script>
                  <div class="row">
                     <div class="col-5"></div>
                     <div class="col-5">
                        <input type="submit" value="등록">&nbsp; &nbsp; <input
                           type="reset" value="취소">

                     </div>

                  </div>
               </div>
            </form>
            
            <p align="center">
		<c:url var="home" value="/" />
		<a href="${ home }">시작페이지로 이동</a>&nbsp;
		<c:url var="flist" value="flist.do" />
		<a href="${ flist }">목록 전체보기</a>
	</p>
         </div>
         <br>
      </div>
      <div>
         <br>
      </div>
   </section>
   <jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>