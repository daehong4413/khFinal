<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	</div>
	<script type="text/javascript">
		window.onload = function() {
			window.opener.location.reload();
			setTimeout(function() {
				window.close();
			}, 1000);
		}
	</script>
</body>
</html>