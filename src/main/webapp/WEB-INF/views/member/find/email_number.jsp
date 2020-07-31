<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<span style="color: green; font-weight: bold;">입력한 이메일로 받은 인증번호를
		입력하세요. (인증번호가 맞아야 비밀번호를 변경하실 수 있습니다.)</span>
	<br>
	<br>
	<form action="emailNumber.me" method="post">
		<input type="hidden" name="dice" id="dice" value="${dice}"/>
		<input type="hidden" name="email" id="email" value="${email}"/>
		<br>
			인증번호 입력 : <input type="number" name="email_injeung"
				placeholder="인증번호를 입력하세요. ">
		<br> <br>
		<button type="submit" name="submit">인증번호 전송</button>

	</form>


</body>
</html>