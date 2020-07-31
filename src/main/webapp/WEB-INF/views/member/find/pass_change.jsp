<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>어부바 : 비밀번호 변경</title>
    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</head>

<body>

    <span style="color: green; font-weight: bold;">변경할 비밀번호를 입력해주세요.</span>
    <br>
    <br>
    <br>
    <br>

    <table>
        <!-- 	<form action="passChange.me" method="post">
 -->
        <tr>
            <td>새 비밀번호</td>
            <td><input type="password" name="memberPwd" id="pwd1" placeholder="비밀번호를 입력하세요."></td>
        </tr>
        <tr>
            <td>다시 입력</td>
            <td> <input type="password" name="memberPwdRe" id="pwd2" placeholder="비밀번호를 입력하세요."></td>
        </tr>
        <input type="hidden" name="email" id="email" value="${email}">
        <tr>
            <td></td>
            <td><button type="submit" name="submit" onclick="return changePw();" style="width:100%;">비밀번호 변경</button></td>
        </tr>

        <!-- </form> -->
    </table>
    <!-- 		//비밀번호를 변경할때 사용하면 될거다.
 -->
    <script>
        function changePw() {
            var password = $('#pwd1').val();
            var password2 = $('#pwd2').val();
            var email = $('#email').val();

            if (!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/
                .test(password)) {
                alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
                $('#pwd1').val('').focus();
                return false;
            }
            var checkNumber = password.search(/[0-9]/g);
            var checkEnglish = password.search(/[a-z]/ig);
            if (checkNumber < 0 || checkEnglish < 0) {
                alert("숫자와 영문자를 혼용하여야 합니다.");
                $('#pwd1').val('').focus();
                return false;
            }
            if (/(\w)\1\1\1/.test(password)) {
                alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
                $('#pwd1').val('').focus();
                return false;
            }

            if (password == '' && password2 == '') {
                alert('비밀번호를 입력해주세요');
                $('#pwd1').focus();
                return false;
            }
            if (password != password2) {
                alert('입혁하신 비밀번호가 다릅니다.');
                $('#pwd1').focus();
                return false;
            }

            /* if (password.search(id) > -1) {
            	alert("비밀번호에 아이디가 포함되었습니다.");
            	$('#pwd1').val('').focus();
            	return false;
            } */
            console.log(password);

            $.ajax({
                url: '/passChange.me', //request 보낼 서버의 경로
                type: 'post', // 메소드(get, post, put 등)
                data: {
                    'email': email,
                    'password': password
                },
                //보낼 데이터
                //dataType:"json",
                //contentType: "application/json; charset=utf-8",
            }).done(function(data){
            	if (data == 'success') {
                    alert('비밀번호가 변경되었습니다.');
                    window.close();
                }else if(data=="20000"){
                	alert('최근 90일 이내에 사용된 암호입니다.');
                	history.go(0);
                }else{
                	alert('회원정보와 이메일이 일치하지 않습니다.');
                    history.go(0);
                }
            });
        };

    </script>


</body>

</html>
