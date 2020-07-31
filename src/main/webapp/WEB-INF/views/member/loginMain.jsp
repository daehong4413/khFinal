<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="keywords" content="login">
    <meta name="descriprion" content="어부, 낚시 용품, 지도">
    <meta name="author" content="어부바">
    <title>어부바 : 로그인</title>
    <link rel="stylesheet" href="/resources/css/loginForm.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" charset="utf-8"></script>
    <link href="https://fonts.googleapis.com/css2?family=Black+And+White+Picture&display=swap" rel="stylesheet">
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
</head>

<body>

    <form action="login.me" method="post" class="login-form">
        <h1>어부바</h1>

        <div class="txtb">
            <input type="text" name="memberId"> <span data-placeholder="아이디"></span>
        </div>

        <div class="txtb">
            <input type="password" name="memberPwd"> <span data-placeholder="패스워드"></span>
        </div>

        <center><a href="findIdPwd.me">아이디/비밀번호 찾기</a><br><br></center>

        <input type="submit" class="logbtn" value="로그인">
        <br>
        <!-- 네이버아이디로로그인 버튼 노출 영역 -->
        <div id="naverIdLogin"></div>
        <br>
            계정이 없으신가요? <a href="resister.me" onclick="closeWindows();">가입하기</a>

    </form>


    <script type="text/javascript">
        function closeWindows() {
            opener.location.href = "agree.me";
            window.close();
        }

        $(".txtb input").on("focus", function() {
            $(this).addClass("focus");
        });

        $(".txtb input").on("blur", function() {
            if ($(this).val() == "")
                $(this).removeClass("focus");
        });

    </script>
    <!-- 네이버아디디로로그인 초기화 Script -->
    <script type="text/javascript">
        var naverLogin = new naver.LoginWithNaverId({
            clientId: "b4IQUWrmdRHkDLDNPMaI",
            callbackUrl: "http://localhost:8989/callback.me",
            isPopup: false,
            /* 팝업을 통한 연동처리 여부 */
            loginButton: {
                color: "green",
                type: 3,
                height: 60
            }
            /* 로그인 버튼의 타입을 지정 */
        });

        /* 설정정보를 초기화하고 연동을 준비 */
        naverLogin.init();

    </script>


</body>

</html>
