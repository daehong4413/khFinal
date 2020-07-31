<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<jsp:include page="/WEB-INF/views/member/include/include.jsp" />

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Mamba Bootstrap Template - Index</title>
    <meta content="" name="descriptison">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,600,600i,700,700i,900" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
    <link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
    <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">

    <!-- =======================================================
  * Template Name: Mamba - v2.3.0
  * Template URL: https://bootstrapmade.com/mamba-one-page-bootstrap-template-free/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>



    <!-- ======= Contact Us Section ======= -->
    <section id="contact" class="contact">

        <div class="container">

            <div class="section-title">
                <h2>아이디/비밀번호찾기</h2>
            </div>

            <div class="col-lg-3 d-flex align-items-stretch" data-aos-delay="100">
                <div class="info-box" id="findBox">
                    <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-person-lines-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm7 1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5zm-2-3a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm2 9a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5z" />
                    </svg>
                    <h3>아이디 찾기</h3>
                    <input type="radio" name="findType" id="findType" value="phone" />전화번호로
                    찾기<br> <input type="radio" name="findType" id="findType" value="email" />이메일주소로 찾기<br> <input type="radio" name="findType" id="findType" value="birth" />생년월일로 찾기
                    <div id="findIdForm"></div>
                    <!-- <input type="button" onclick="javascript:findId();" value="아이디찾기"/> -->
                </div>
                <div class="info-box" id="findId" style="display: none;">
                    <h3>아이디</h3>
                    <p id="foundId"></p>
                    </br> </br> <input type="button" onclick="history.go(0)" value="다시찾기" />
                    <input type="button" onclick="history.go(-1)" value="로그인" />
                </div>
            </div>

            <div class="col-lg-3 d-flex align-items-stretch" data-aos-delay="100">
                <div class="info-box" id="changePwBox">
                    <svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-shield-lock" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M5.443 1.991a60.17 60.17 0 0 0-2.725.802.454.454 0 0 0-.315.366C1.87 7.056 3.1 9.9 4.567 11.773c.736.94 1.533 1.636 2.197 2.093.333.228.626.394.857.5.116.053.21.089.282.11A.73.73 0 0 0 8 14.5c.007-.001.038-.005.097-.023.072-.022.166-.058.282-.111.23-.106.525-.272.857-.5a10.197 10.197 0 0 0 2.197-2.093C12.9 9.9 14.13 7.056 13.597 3.159a.454.454 0 0 0-.315-.366c-.626-.2-1.682-.526-2.725-.802C9.491 1.71 8.51 1.5 8 1.5c-.51 0-1.49.21-2.557.491zm-.256-.966C6.23.749 7.337.5 8 .5c.662 0 1.77.249 2.813.525a61.09 61.09 0 0 1 2.772.815c.528.168.926.623 1.003 1.184.573 4.197-.756 7.307-2.367 9.365a11.191 11.191 0 0 1-2.418 2.3 6.942 6.942 0 0 1-1.007.586c-.27.124-.558.225-.796.225s-.526-.101-.796-.225a6.908 6.908 0 0 1-1.007-.586 11.192 11.192 0 0 1-2.417-2.3C2.167 10.331.839 7.221 1.412 3.024A1.454 1.454 0 0 1 2.415 1.84a61.11 61.11 0 0 1 2.772-.815z" />
                        <path d="M9.5 6.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z" />
                        <path d="M7.411 8.034a.5.5 0 0 1 .493-.417h.156a.5.5 0 0 1 .492.414l.347 2a.5.5 0 0 1-.493.585h-.835a.5.5 0 0 1-.493-.582l.333-2z" />
                    </svg>
                    <h3>비밀번호 찾기</h3>

                    <div id="findPwForm">
                        아이디 : <input type="text" id="memberId" name="memberId" placeholder="아이디를 입력해주세요." /><br>
                        전화번호 : <input type="text" id="phone" name="key" maxlength="11" pattern="/[^0-9]{11}/" placeholder="-제외하고 입력해주세요." /><br /> <br /> <input type="button" onclick="javascript:findPwView();" value="다음으로" />'

                    </div>
                </div>
                <div class="info-box" id="findPw" style="display: none;">
                    <h3>이메일 인증</h3>
                    <div style="text-align: center;">
                        <form action="auth.me" method="post">

                            <br>
                            <div>
                                이메일 : <input type="email" name="email" placeholder="  이메일주소를 입력하세요. ">
                            </div>

                            <br> <br>
                            <button type="submit" name="submit">이메일 인증받기 (이메일 보내기)</button>
                        </form>
                    </div>

                </div>
    </section>



    <!-- Vendor JS Files -->
    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
    <script src="assets/vendor/php-email-form/validate.js"></script>
    <script src="assets/vendor/jquery-sticky/jquery.sticky.js"></script>
    <script src="assets/vendor/venobox/venobox.min.js"></script>
    <script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
    <script src="assets/vendor/counterup/counterup.min.js"></script>
    <script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
    <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="assets/vendor/aos/aos.js"></script>

    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>

    <script type="text/javascript">
        //아이디 유효성 체크한다. 그리고 ajax를 이용해서 입력한 값이 맞는지 db에서 정보를 가져오고, 지정한 곳에
        //가져온 데이터를 show해준다.
        //아이디를 가져오는 함수.
        function findId() {
            var findType = $("input[name=findType]:checked").val();
            var name = $('#memberName').val();
            var phone = $('#phone').val();
            var email = $('#email').val();
            var birth = $('#birth').val();

            var key = '';

            console.log(findType);
            if (name == '') {
                alert('이름을 입력해주세오.');
                return false;
            }

            if (findType == 'phone') {
                if (phone == null || phone == '') {
                    alert('전화번호를 입력해주세요.');
                    return false;
                } else {
                    key = phone;
                }
            }
            if (findType == 'email') {
                if (email == null || email == '') {
                    alert('이메일을 입력해주세요.');
                    return false;
                } else {
                    key = email;
                }

            }
            if (findType == 'birth') {
                if (birth == null || birth == '') {
                    alert('생년월일을 입력해주세요.');
                    return false;
                } else {
                    key = birth;
                }
            }

            $.ajax({
                url: '/findId.me', //request 보낼 서버의 경로
                type: 'post', // 메소드(get, post, put 등)
                data: {
                    'findType': findType,
                    'key': key,
                    'name': name
                }, //보낼 데이터
                //dataType:"json",
                //contentType: "application/json; charset=utf-8",
                success: function(data) {
                    console.log(data);
                    if (data != '') {
                        $('#foundId').html(data);
                        $('#findBox').hide();
                        $('#findId').show();
                    }
                },
                error: function(err) {
                    console.log(err);
                    alert('검색결과가 2개 이상입니다.\n 다른 방법을 찾아주세요!');
                    history.go(0);
                }
            });

        }

        function findPwView() {
            var memberId = $('#memberId').val();
            var phone = $('#phone').val();

            if (phone == '') {
                alert('전화번호를 입력해주세요.');
                return false;
            }
            $.ajax({
                url: '/findPwView.me',
                type: 'post',
                data: {
                    'memberId': memberId,
                    'phone': phone
                },
                success: function(data) {
                    console.log(data);
                    if (data != '') {
                        $('#changePwBox').hide();
                        $('#findPw').show();
                    }
                },
                error: function(err) {
                    console.log(err);
                    alert('오류');
                    history.go(0);
                }

            });

        };

        //비밀번호를 변경할때 사용하면 될거다.
        function changePw() {
            var password = $('#pwd1').val();
            var password2 = $('#pwd2').val();

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
            return true;
            console.log(password);

            $.ajax({
                url: '/changePw.me', //request 보낼 서버의 경로
                type: 'post', // 메소드(get, post, put 등)
                data: {
                    'memberId': memberId,
                    'password': password
                }, //보낼 데이터
                //dataType:"json",
                //contentType: "application/json; charset=utf-8",
                success: function(data) {
                    console.log(data);
                    if (data != '') {
                        alert('비밀번호가 변경되었습니다.');
                        window.close();
                    }
                },
                error: function(err) {
                    console.log(err);
                    alert('오류');
                    history.go(0);
                }
            });
        };

        //라디오 버튼 클릭스 input 창 뜨게 하는 jquery --> 아이디 찾기를 하면 findId() 함수로 연결해줌 
        $("input:radio[name=findType]")
            .click(
                function() {

                    if ($("input[name=findType]:checked").val() == "phone") {
                        $('#findIdForm')
                            .html(
                                '이름 : <input type="text" id="memberName" name="memberName" maxlength="11" placeholder="이름을 입력해주세요."/><br>전화번호 : <input type="tel" id="phone" name="key" maxlength="11" pattern="/[^0-9]{11}/" placeholder="-제외하고 입력해주세요."/><br/><br/><input type="button" onclick="javascript:findId();" value="아이디찾기"/>');
                    } else if ($("input[name=findType]:checked").val() == "email") {
                        $('#findIdForm')
                            .html(
                                '이름 : <input type="text" id="memberName" name="memberName" maxlength="11" placeholder="이름을 입력해주세요."/><br>이메일 : <input type="text" id="email" name="key" placeholder="이메일을 입력해주세요."/><br/><br/><input type="button" onclick="javascript:findId();" value="아이디찾기"/>');
                    } else if ($("input[name=findType]:checked").val() == "birth") {
                        $('#findIdForm')
                            .html(
                                '이름 : <input type="text" id="memberName" name="memberName" maxlength="11" placeholder="이름을 입력해주세요."/><br>생년월일 : <input type="text" id="birth" name="key" maxlength="8" placeholder="8자리 생년월일 입력해주세요."/><br/><br/><input type="button" onclick="javascript:findId();" value="아이디찾기"/>');
                    }

                });

    </script>


</body>

</html>
