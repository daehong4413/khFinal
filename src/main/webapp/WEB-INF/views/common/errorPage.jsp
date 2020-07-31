<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>에러 페이지</title>
</head>
<body>
	<div id="error-container" style="text-align:center;">
		<h1>Error</h1>
		<h2 style="color:red;">${msg }</h2>
		<c:if test="${flag eq 'login'}">
			3초후 로그인 화면으로 이동합니다.
		</c:if>
		<c:if test="${!flag eq 'login'}">
			<a href="/">시작페이지로 이동</a>
		</c:if>
	</div>
	
	<script type="text/javascript">
		if(${flag eq 'login'}){
			setInterval(goLoginHome, 3000);	
		}
		function goLoginHome() {
			location.href = "loginMain.me";
		}
	</script>
</body>
</html>