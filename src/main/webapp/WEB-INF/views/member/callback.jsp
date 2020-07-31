<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 성공</title>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"
	charset="utf-8"></script>
</head>
<body>
<h1 id="logintitle"></h1>
	<script type="text/javascript">
	window.onload = function () {
		setTimeout(function() {  
	        window.close();  
	            }, 2000);  
	}
	var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "{YOUR_CLIENT_ID}",
			callbackUrl: "{YOUR_REDIRECT_URL}",
			isPopup: false,
			callbackHandle: true
			/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
		}
	);

	/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
	naverLogin.init();

	/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
	window.addEventListener('load', function () {
		naverLogin.getLoginStatus(function (status) {
			alert(status);
			if (status) {
				/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
				var email = naverLogin.user.getEmail();
				var name = naverLogin.user.getNickName();
				var profileImage = naverLogin.user.getProfileImage();
				var birthday = naverLogin.user.getBirthday();			
				var uniqId = naverLogin.user.getId();
				var age = naverLogin.user.getAge();
				
				var msg = '메일  : ' + email;
				msg += '<\n>이름 : ' + name;
				msg += '<\n>프로필 사진 : ' + profileImage;
				msg += '<\n>생일 : ' + birthday;
				msg += '<\n>고유 번호 : ' + uniqId;
				msg += '<\n>연령대 : ' + age;
				alert(msg);
				
				var mainmsg = name + "님 환영합니다.";
				document.getElementById("logintitle").innerHTML = mainmsg
				

				//window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/sample/main.html");
			} else {
				console.log("callback 처리에 실패하였습니다.");
			}
		});
	});
</script>

</body>
</html>