<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		window.onload = function() {
			alert('변경의 성공했습니다.')
			window.opener.location.reload();
			setTimeout(function() {
				window.close();
			}, 1000);
		}
	</script>

</body>
</html>