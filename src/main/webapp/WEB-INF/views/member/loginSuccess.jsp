<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 성공</title>
</head>
<body>

	<script type="text/javascript">
	
	alert('${loginInfo.memberName}님 환영합니다.');
		window.onload = function() {
			window.opener.location.reload();
			setTimeout(function() {
				
				window.close();
			}, 1000);
		}
	</script>

</body>
</html>