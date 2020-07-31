<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:formatDate pattern="yy-MM-dd" value="" /> --%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">



    <!-- Title Page-->
    <title>어부바 : 회원가입</title>

    <!-- Icons font CSS-->



    <link href="/resources/register/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="/resources/register/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="/resources/register/vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <!-- Main CSS-->
    <link href="/resources/register/css/main.css" rel="stylesheet" media="all">

    <!-- jQuery UI CSS파일 -->
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <!-- jQuery 기본 js파일 -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <!-- jQuery UI 라이브러리 js파일 -->
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
    <link href="/resources/register/vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">
    <style>
        #test {
            display: flex;
            flex-direction: row;
        }

    </style>
</head>

<body>
    <div class="page-wrapper bg-blue p-t-100 p-b-100 font-robo">
        <p class="bazzi-font" style="text-align: center; font-family: Nanum Pen Script; font-size: 55px;">
            <b>어부바</b>
        </p>
        <br> <br>
        <div class="wrapper wrapper--w960 wrapper--h800">
            <div class="card card-2">

                <div class="card-body">

                    <form name="frm1" id="frm1" action="newRegister.me" method="POST">
                        <input type="hidden" name="isChecked" id="isChecked" value="false" />
                        <strong>아이디</strong>
                        <div class="row row-space">
                            <div class="col-6">
                                <div class="input-group" id="test">
                                    <input class="input--style-2" type="text" placeholder="아이디 입력" name="memberId" id="memberId" style="float: left;"> <input type="button" onclick="checkId();" value="중복 확인" style="width: 110px; height: 30px; margin: 10px; float: left;">
                                </div>
                            </div>
                        </div>

                        <strong>비밀번호</strong>
                        <div class="row row-space">
                            <div class="col-6">
                                <div class="input-group" id="test">
                                    <input class="input--style-2" class="pw" type="password" placeholder="비밀번호 입력" name="memberPwd" id="pwd1">

                                </div>
                            </div>
                        </div>
                        <strong>비밀번호 확인</strong>
                        <div class="row row-space">
                            <div class="col-6">
                                <div class="input-group" id="test">
                                    <input class="input--style-2" type="password" class="pw" placeholder="비밀번호 확인" name="memberPwdRe" id="pwd2">
                                </div>
                            </div>
                        </div>
                        <strong>이름</strong>
                        <div class="row row-space">
                            <div class="col-6">
                                <div class="input-group">
                                    <input class="input--style-2 j" type="text" placeholder="이름" name="memberName" id="memberName">
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="checkedNick" id="checkedNick" value="false" /> <strong>닉네임</strong>
                        <div class="row row-space">
                            <div class="col-6">
                                <div class="input-group" id="test">
                                    <input class="input--style-2 j" type="text" placeholder="닉네임" name="nickName" id="nickName"> <input type="button" onclick="checkNickName();" value="중복 확인" style="width: 110px; height: 30px; margin: 10px; float: left;">
                                </div>
                            </div>
                        </div>
                        <strong>핸드폰</strong>
                        <div class="row row-space">
                            <div class="col-6">
                                <div class="input-group">
                                    <input class="input--style-2 j" type="text" placeholder="핸드폰" name="phone" id="phone">
                                </div>
                            </div>
                        </div>
                        <strong>이메일</strong>
                        <div class="row row-space">
                            <div class="col-6">
                                <div class="input-group">
                                    <input class="input--style-2 j" type="email" placeholder="이메일" name="email">
                                </div>
                            </div>
                        </div>
                        <strong>생년월일</strong>
                        <div class="row row-space">
                            <div class="col-6">
                                <div class="input-group">
                                    <input class="input--style-2 datepicker" type="text" id="birthDay" name="birthDay" readonly="readonly" />
                                </div>
                            </div>
                        </div>
                        <strong>성별</strong>
                        <div class="row row-space">
                            <div class="col-6">
                                <div class="input-group">
                                    <div class="rs-select2 js-select-simple select--no-search">
                                        <select name="gender">
                                            <option disabled="disabled" selected="selected">성별</option>
                                            <option value="null">선택안함</option>
                                            <option value="M">남자</option>
                                            <option value="F">여자</option>
                                        </select>
                                        <div class="select-dropdown"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <strong>주소</strong>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group" id="test">
                                    <input class="input--style-2 postcodify_postcode5" type="text" placeholder="우편번호" name="post" value="" size="6" style="float: left;" readonly> <input type="button" id="postcodify_search_button" value="검색" style="width: 110px; height: 30px;">
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="input-group" id="test">
                                    <input class="input--style-2 postcodify_address" type="text" name="address" value="" placeholder="주소" readonly>
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-6">
                                <div class="input-group">
                                    <input class="input--style-2 postcodify_extra_info" type="text" name="addressDetail" value="" placeholder="상세주소">
                                </div>
                            </div>
                        </div>


                        <div class="p-t-30">
                            <button class="btn btn--radius btn--green" type="submit" onclick="return goRegist();">가입하기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <!-- 주소api   -->

    <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
    <script>
        document.addEventListener('keydown', function(event) {

            if (event.keyCode === 13) {

                event.preventDefault();

            }

        }, true);
        // 검색 단추를 누르면 팝업 레이어가 열리도록 설정한다.
        $(function() {
            $("#postcodify_search_button").postcodifyPopUp();
        });

    </script>

    <script type="text/javascript">
        $(document).ready(function() {
            $('#memberId').focus();
        });
        /* $('.pw').focusout(function () {
            var pwd1 = $("#pwd1").val();
            var pwd2 = $("#pwd2").val();
        
            if ( pwd1 != '' && pwd2 == '' ) {
                null;
            } else if (pwd1 != "" || pwd2 != "") {
                if (pwd1 == pwd2) {
                    $("#alert-success").css('display', 'inline-block');
                    $("#alert-danger").css('display', 'none');
                } else {
                    alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
                    $("#alert-success").css('display', 'none');
                    $("#alert-danger").css('display', 'inline-block');
                }
            }
        });
         */
        // 아이디 중복체크
        function checkId() {
            var id = $('#memberId').val();
            var idReg = /^[a-z]+[a-z0-9]{5,19}$/;

            if (!idReg.test(id)) {
                alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
                return false;
            }
            //alert(id);
            if (id == '') {
                alert('id가 입력되지 않았습니다.');
                return false;
            } else {
                console.log('아이디 체크 Start');
                $.ajax({
                    url: '/checkId.me', //request 보낼 서버의 경로
                    type: 'post', // 메소드(get, post, put 등)
                    data: {
                        'id': id
                    }, //보낼 데이터
                    //dataType:"json",
                    //contentType: "application/json; charset=utf-8",
                    success: function(data) {
                        if (data == '00') {
                            alert('사용가능한 아이디 입니다.');
                            $('#pwd1').focus();
                            $('#isChecked').val('true');
                        } else if (data == '99') {
                            alert('사용불가능한 아이디 입니다.');
                            $('#memberId').val('');
                            $('#memberId').focus();
                            $('#isChecked').val('false');
                        }
                        //var dd = JSON.parse(data);
                        //console.log(dd.resultCode);
                    },
                    error: function(err) {
                        console.log(err);
                        alert('통신이 원활하지 않습니다.\n잠시후 다시 이용해 주세요.');
                    }
                });
            };

        };

        // 비밀번호 유효성 검사
        function checkPassword() {
            var password = $('#pwd1').val();
            var id = $('#memberId').val();

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

            if (password.search(id) > -1) {
                alert("비밀번호에 아이디가 포함되었습니다.");
                $('#pwd1').val('').focus();
                return false;
            }
            return true;
        };

        //닉네임 중복 체크
        function checkNickName() {
            var nick = $('#nickName').val();
            alert(nick);

            if (nick == '') {
                alert('닉네임이 입력되지 않았습니다.');
                $('#nickName').focus();
                return false;
            } else {
                console.log('닉네임체크 Start');
                $.ajax({
                    url: '/chekNickName.me', //request 보낼 서버의 경로
                    type: 'post', //메소드 (post)
                    data: {
                        'nick': nick
                    },
                    success: function(data) {
                        if (data == '00') {
                            alert('사용 가능한 닉네임입니다.');
                            $('#phone').focus();
                            $('#checkedNick').val('true');
                        } else if (data == '99') {
                            alert('사용 불가능한 닉네임 입니다.');
                            $('#nickName').val('');
                            $('#nickName').focus();
                            $('#checkedNick').val('false');
                        }
                    },
                    error: function(err) {
                        console.log(err);
                        alert('통신이 원활하지 않습니다.\n잠시후 다시 이용해 주세요.');
                    }

                });
            };
        };

        function checkPhone() {
            var phone = $('#phone').val();
            if (isMobile(phone)) {
                var regExp = /^((01[1|6|7|8|9])[1-9]+[0-9]{6,7})|(010[1-9][0-9]{7})$/;
                var result = regExp.exec(phone);
                if (result) {
                    return true;
                } else {
                    alert('정확한 번호를 기재해 주세요.');
                    $('#phone').val('').focus();
                    return false;
                }

            };

        };

        // 일단 데이트 값을 8자리로 받아오고,다음달 부터 클릭이 안됨.
        $("#birthDay").datepicker({
            changeMonth: true,
            changeYear: true,
            nextText: '다음 달',
            prevText: '이전 달',
            showButtonPanel: true,
            yearRange: "-70:+0",
            onSelect: function(data) {
                var click_data = data.split('/');
                console.log(click_data[0]);
                console.log(click_data[1]);
                console.log(click_data[2]);
                $("#birthDay").val(
                    click_data[2] + click_data[0] + click_data[1]);
            }

        });

        //회원가입 최종 스텝 (필수 입력 입력받아야지 submit 가능합니다.)
        function goRegist() {
            var isChecke = $('#isChecked').val();
            var checkedNick = $('#checkedNick').val();
            var memberId = $('#memberId').val();
            var pwd1 = $('#pwd1').val();
            var pwd2 = $('#pwd2').val();
            var memberName = $('#memberName').val();
            var nickName = $('#nickName').val();
            var phone = $('#phone').val();

            if (memberId == '') {
                alert('아이디를 입력해주세요.');
                $('#memberId').focus();
                return false;
            }
            if (isChecke == 'false') {
                alert('아이디 중복체크를 해주세요.');
                return false;
            }
            if (pwd1 == '' && pwd2 == '') {
                alert('비밀번호를 입력해주세요');
                $('#pwd1').focus();
                return false;
            }
            if (pwd1 != pwd2) {
                alert('입혁하신 비밀번호가 다릅니다.');
                $('#pwd1').focus();
                return false;
            }
            if (!checkPassword(pwd1, memberId)) {
                return false;
            }
            if (memberName == '') {
                alert('이름을 입력해주세요');
                $('#memberName').focus();
                return false;
            }

            if (nickName == '') {
                alert('닉네임을 입력해주세요');
                $('#nickName').focus();
                return false;
            }
            if (checkedNick == 'false') {
                alert('닉네임 중복체크를 해주세요.');
                return false;

            }
            if (phone == '') {
                alert('전화번호를 입력해주세요');
                $('#phone').focus();
                return false;
            }

            $('#frm1').submit();

        }

    </script>
    <!-- Vendor JS-->
    <script src="/resources/register/vendor/select2/select2.min.js"></script>
    <script src="/resources/register/vendor/datepicker/moment.min.js"></script>
    <script src="/resources/register/vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="/resources/register/js/global.js"></script>

</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->
